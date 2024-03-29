resource "aws_vpc" "eks" {
  cidr_block = "${var.vpc_cidr}"

  tags = "${
    map(
     "Name", "terraform-eks-${var.cluster_name}-node",
     "kubernetes-cluster", "${var.cluster_name}",
     "kubernetes.io/cluster/${var.cluster_name}", "shared",
    )
  }"
}

resource "aws_subnet" "eks" {
  count = "${var.number_of_subnets}"

  availability_zone = "${var.availability_zones[count.index]}" 
  cidr_block = "${cidrsubnet(var.vpc_cidr, 8, count.index)}"
  vpc_id = "${aws_vpc.eks.id}"

  tags = "${
    map(
     "Name", "terraform-eks-${var.cluster_name}-node",
     "kubernetes-cluster", "${var.cluster_name}",
     "kubernetes.io/cluster/${var.cluster_name}", "shared",
    )
  }"
}

resource "aws_internet_gateway" "eks" {
  vpc_id = "${aws_vpc.eks.id}"

  tags {
    Name = "terraform-eks-${var.cluster_name}"
  }
}

resource "aws_route_table" "eks" {
  vpc_id = "${aws_vpc.eks.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.eks.id}"
  }
}

resource "aws_route_table_association" "eks" {
  count = "${var.number_of_routes_tables}"

  subnet_id      = "${aws_subnet.eks.*.id[count.index]}"
  route_table_id = "${aws_route_table.eks.id}"
}