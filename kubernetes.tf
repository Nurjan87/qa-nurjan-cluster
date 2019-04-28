locals = {
  bastion_autoscaling_group_ids     = ["${aws_autoscaling_group.bastions-qa-nurajn-com.id}"]
  bastion_security_group_ids        = ["${aws_security_group.bastion-qa-nurajn-com.id}"]
  bastions_role_arn                 = "${aws_iam_role.bastions-qa-nurajn-com.arn}"
  bastions_role_name                = "${aws_iam_role.bastions-qa-nurajn-com.name}"
  cluster_name                      = "qa-nurajn.com"
  master_autoscaling_group_ids      = ["${aws_autoscaling_group.master-us-west-1b-masters-qa-nurajn-com.id}"]
  master_security_group_ids         = ["${aws_security_group.masters-qa-nurajn-com.id}"]
  masters_role_arn                  = "${aws_iam_role.masters-qa-nurajn-com.arn}"
  masters_role_name                 = "${aws_iam_role.masters-qa-nurajn-com.name}"
  node_autoscaling_group_ids        = ["${aws_autoscaling_group.nodes-qa-nurajn-com.id}"]
  node_security_group_ids           = ["${aws_security_group.nodes-qa-nurajn-com.id}"]
  node_subnet_ids                   = ["${aws_subnet.us-west-1b-qa-nurajn-com.id}", "${aws_subnet.us-west-1c-qa-nurajn-com.id}"]
  nodes_role_arn                    = "${aws_iam_role.nodes-qa-nurajn-com.arn}"
  nodes_role_name                   = "${aws_iam_role.nodes-qa-nurajn-com.name}"
  region                            = "us-west-1"
  route_table_private-us-west-1b_id = "${aws_route_table.private-us-west-1b-qa-nurajn-com.id}"
  route_table_private-us-west-1c_id = "${aws_route_table.private-us-west-1c-qa-nurajn-com.id}"
  route_table_public_id             = "${aws_route_table.qa-nurajn-com.id}"
  subnet_us-west-1b_id              = "${aws_subnet.us-west-1b-qa-nurajn-com.id}"
  subnet_us-west-1c_id              = "${aws_subnet.us-west-1c-qa-nurajn-com.id}"
  subnet_utility-us-west-1b_id      = "${aws_subnet.utility-us-west-1b-qa-nurajn-com.id}"
  subnet_utility-us-west-1c_id      = "${aws_subnet.utility-us-west-1c-qa-nurajn-com.id}"
  vpc_cidr_block                    = "${aws_vpc.qa-nurajn-com.cidr_block}"
  vpc_id                            = "${aws_vpc.qa-nurajn-com.id}"
}

output "bastion_autoscaling_group_ids" {
  value = ["${aws_autoscaling_group.bastions-qa-nurajn-com.id}"]
}

output "bastion_security_group_ids" {
  value = ["${aws_security_group.bastion-qa-nurajn-com.id}"]
}

output "bastions_role_arn" {
  value = "${aws_iam_role.bastions-qa-nurajn-com.arn}"
}

output "bastions_role_name" {
  value = "${aws_iam_role.bastions-qa-nurajn-com.name}"
}

output "cluster_name" {
  value = "qa-nurajn.com"
}

output "master_autoscaling_group_ids" {
  value = ["${aws_autoscaling_group.master-us-west-1b-masters-qa-nurajn-com.id}"]
}

output "master_security_group_ids" {
  value = ["${aws_security_group.masters-qa-nurajn-com.id}"]
}

output "masters_role_arn" {
  value = "${aws_iam_role.masters-qa-nurajn-com.arn}"
}

output "masters_role_name" {
  value = "${aws_iam_role.masters-qa-nurajn-com.name}"
}

output "node_autoscaling_group_ids" {
  value = ["${aws_autoscaling_group.nodes-qa-nurajn-com.id}"]
}

output "node_security_group_ids" {
  value = ["${aws_security_group.nodes-qa-nurajn-com.id}"]
}

output "node_subnet_ids" {
  value = ["${aws_subnet.us-west-1b-qa-nurajn-com.id}", "${aws_subnet.us-west-1c-qa-nurajn-com.id}"]
}

output "nodes_role_arn" {
  value = "${aws_iam_role.nodes-qa-nurajn-com.arn}"
}

output "nodes_role_name" {
  value = "${aws_iam_role.nodes-qa-nurajn-com.name}"
}

output "region" {
  value = "us-west-1"
}

output "route_table_private-us-west-1b_id" {
  value = "${aws_route_table.private-us-west-1b-qa-nurajn-com.id}"
}

output "route_table_private-us-west-1c_id" {
  value = "${aws_route_table.private-us-west-1c-qa-nurajn-com.id}"
}

output "route_table_public_id" {
  value = "${aws_route_table.qa-nurajn-com.id}"
}

output "subnet_us-west-1b_id" {
  value = "${aws_subnet.us-west-1b-qa-nurajn-com.id}"
}

output "subnet_us-west-1c_id" {
  value = "${aws_subnet.us-west-1c-qa-nurajn-com.id}"
}

output "subnet_utility-us-west-1b_id" {
  value = "${aws_subnet.utility-us-west-1b-qa-nurajn-com.id}"
}

output "subnet_utility-us-west-1c_id" {
  value = "${aws_subnet.utility-us-west-1c-qa-nurajn-com.id}"
}

output "vpc_cidr_block" {
  value = "${aws_vpc.qa-nurajn-com.cidr_block}"
}

output "vpc_id" {
  value = "${aws_vpc.qa-nurajn-com.id}"
}

provider "aws" {
  region = "us-west-1"
}

resource "aws_autoscaling_attachment" "bastions-qa-nurajn-com" {
  elb                    = "${aws_elb.bastion-qa-nurajn-com.id}"
  autoscaling_group_name = "${aws_autoscaling_group.bastions-qa-nurajn-com.id}"
}

resource "aws_autoscaling_attachment" "master-us-west-1b-masters-qa-nurajn-com" {
  elb                    = "${aws_elb.api-qa-nurajn-com.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-us-west-1b-masters-qa-nurajn-com.id}"
}

resource "aws_autoscaling_group" "bastions-qa-nurajn-com" {
  name                 = "bastions.qa-nurajn.com"
  launch_configuration = "${aws_launch_configuration.bastions-qa-nurajn-com.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.utility-us-west-1b-qa-nurajn-com.id}", "${aws_subnet.utility-us-west-1c-qa-nurajn-com.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "qa-nurajn.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "bastions.qa-nurajn.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "bastions"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/bastion"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "master-us-west-1b-masters-qa-nurajn-com" {
  name                 = "master-us-west-1b.masters.qa-nurajn.com"
  launch_configuration = "${aws_launch_configuration.master-us-west-1b-masters-qa-nurajn-com.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.us-west-1b-qa-nurajn-com.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "qa-nurajn.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-us-west-1b.masters.qa-nurajn.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "master-us-west-1b"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "nodes-qa-nurajn-com" {
  name                 = "nodes.qa-nurajn.com"
  launch_configuration = "${aws_launch_configuration.nodes-qa-nurajn-com.id}"
  max_size             = 2
  min_size             = 2
  vpc_zone_identifier  = ["${aws_subnet.us-west-1b-qa-nurajn-com.id}", "${aws_subnet.us-west-1c-qa-nurajn-com.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "qa-nurajn.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "nodes.qa-nurajn.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "nodes"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/node"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_ebs_volume" "b-etcd-events-qa-nurajn-com" {
  availability_zone = "us-west-1b"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                     = "qa-nurajn.com"
    Name                                  = "b.etcd-events.qa-nurajn.com"
    "k8s.io/etcd/events"                  = "b/b"
    "k8s.io/role/master"                  = "1"
    "kubernetes.io/cluster/qa-nurajn.com" = "owned"
  }
}

resource "aws_ebs_volume" "b-etcd-main-qa-nurajn-com" {
  availability_zone = "us-west-1b"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                     = "qa-nurajn.com"
    Name                                  = "b.etcd-main.qa-nurajn.com"
    "k8s.io/etcd/main"                    = "b/b"
    "k8s.io/role/master"                  = "1"
    "kubernetes.io/cluster/qa-nurajn.com" = "owned"
  }
}

resource "aws_eip" "us-west-1b-qa-nurajn-com" {
  vpc = true

  tags = {
    KubernetesCluster                     = "qa-nurajn.com"
    Name                                  = "us-west-1b.qa-nurajn.com"
    "kubernetes.io/cluster/qa-nurajn.com" = "owned"
  }
}

resource "aws_eip" "us-west-1c-qa-nurajn-com" {
  vpc = true

  tags = {
    KubernetesCluster                     = "qa-nurajn.com"
    Name                                  = "us-west-1c.qa-nurajn.com"
    "kubernetes.io/cluster/qa-nurajn.com" = "owned"
  }
}

resource "aws_elb" "api-qa-nurajn-com" {
  name = "api-qa-nurajn-com-tehmic"

  listener = {
    instance_port     = 443
    instance_protocol = "TCP"
    lb_port           = 443
    lb_protocol       = "TCP"
  }

  security_groups = ["${aws_security_group.api-elb-qa-nurajn-com.id}"]
  subnets         = ["${aws_subnet.utility-us-west-1b-qa-nurajn-com.id}", "${aws_subnet.utility-us-west-1c-qa-nurajn-com.id}"]

  health_check = {
    target              = "SSL:443"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 10
    timeout             = 5
  }

  idle_timeout = 300

  tags = {
    KubernetesCluster = "qa-nurajn.com"
    Name              = "api.qa-nurajn.com"
  }
}

resource "aws_elb" "bastion-qa-nurajn-com" {
  name = "bastion-qa-nurajn-com-qe64um"

  listener = {
    instance_port     = 22
    instance_protocol = "TCP"
    lb_port           = 22
    lb_protocol       = "TCP"
  }

  security_groups = ["${aws_security_group.bastion-elb-qa-nurajn-com.id}"]
  subnets         = ["${aws_subnet.utility-us-west-1b-qa-nurajn-com.id}", "${aws_subnet.utility-us-west-1c-qa-nurajn-com.id}"]

  health_check = {
    target              = "TCP:22"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 10
    timeout             = 5
  }

  idle_timeout = 300

  tags = {
    KubernetesCluster = "qa-nurajn.com"
    Name              = "bastion.qa-nurajn.com"
  }
}

resource "aws_iam_instance_profile" "bastions-qa-nurajn-com" {
  name = "bastions.qa-nurajn.com"
  role = "${aws_iam_role.bastions-qa-nurajn-com.name}"
}

resource "aws_iam_instance_profile" "masters-qa-nurajn-com" {
  name = "masters.qa-nurajn.com"
  role = "${aws_iam_role.masters-qa-nurajn-com.name}"
}

resource "aws_iam_instance_profile" "nodes-qa-nurajn-com" {
  name = "nodes.qa-nurajn.com"
  role = "${aws_iam_role.nodes-qa-nurajn-com.name}"
}

resource "aws_iam_role" "bastions-qa-nurajn-com" {
  name               = "bastions.qa-nurajn.com"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_bastions.qa-nurajn.com_policy")}"
}

resource "aws_iam_role" "masters-qa-nurajn-com" {
  name               = "masters.qa-nurajn.com"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_masters.qa-nurajn.com_policy")}"
}

resource "aws_iam_role" "nodes-qa-nurajn-com" {
  name               = "nodes.qa-nurajn.com"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_nodes.qa-nurajn.com_policy")}"
}

resource "aws_iam_role_policy" "bastions-qa-nurajn-com" {
  name   = "bastions.qa-nurajn.com"
  role   = "${aws_iam_role.bastions-qa-nurajn-com.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_bastions.qa-nurajn.com_policy")}"
}

resource "aws_iam_role_policy" "masters-qa-nurajn-com" {
  name   = "masters.qa-nurajn.com"
  role   = "${aws_iam_role.masters-qa-nurajn-com.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_masters.qa-nurajn.com_policy")}"
}

resource "aws_iam_role_policy" "nodes-qa-nurajn-com" {
  name   = "nodes.qa-nurajn.com"
  role   = "${aws_iam_role.nodes-qa-nurajn-com.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_nodes.qa-nurajn.com_policy")}"
}

resource "aws_internet_gateway" "qa-nurajn-com" {
  vpc_id = "${aws_vpc.qa-nurajn-com.id}"

  tags = {
    KubernetesCluster                     = "qa-nurajn.com"
    Name                                  = "qa-nurajn.com"
    "kubernetes.io/cluster/qa-nurajn.com" = "owned"
  }
}

resource "aws_key_pair" "kubernetes-qa-nurajn-com-fff9a267ed92123f049c4380510a90e9" {
  key_name   = "kubernetes.qa-nurajn.com-ff:f9:a2:67:ed:92:12:3f:04:9c:43:80:51:0a:90:e9"
  public_key = "${file("${path.module}/data/aws_key_pair_kubernetes.qa-nurajn.com-fff9a267ed92123f049c4380510a90e9_public_key")}"
}

resource "aws_launch_configuration" "bastions-qa-nurajn-com" {
  name_prefix                 = "bastions.qa-nurajn.com-"
  image_id                    = "ami-0a34dc66f2d0cf25b"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-qa-nurajn-com-fff9a267ed92123f049c4380510a90e9.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.bastions-qa-nurajn-com.id}"
  security_groups             = ["${aws_security_group.bastion-qa-nurajn-com.id}"]
  associate_public_ip_address = true

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 32
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "master-us-west-1b-masters-qa-nurajn-com" {
  name_prefix                 = "master-us-west-1b.masters.qa-nurajn.com-"
  image_id                    = "ami-0a34dc66f2d0cf25b"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-qa-nurajn-com-fff9a267ed92123f049c4380510a90e9.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-qa-nurajn-com.id}"
  security_groups             = ["${aws_security_group.masters-qa-nurajn-com.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-us-west-1b.masters.qa-nurajn.com_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "nodes-qa-nurajn-com" {
  name_prefix                 = "nodes.qa-nurajn.com-"
  image_id                    = "ami-0a34dc66f2d0cf25b"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-qa-nurajn-com-fff9a267ed92123f049c4380510a90e9.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.nodes-qa-nurajn-com.id}"
  security_groups             = ["${aws_security_group.nodes-qa-nurajn-com.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_nodes.qa-nurajn.com_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 128
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_nat_gateway" "us-west-1b-qa-nurajn-com" {
  allocation_id = "${aws_eip.us-west-1b-qa-nurajn-com.id}"
  subnet_id     = "${aws_subnet.utility-us-west-1b-qa-nurajn-com.id}"

  tags = {
    KubernetesCluster                     = "qa-nurajn.com"
    Name                                  = "us-west-1b.qa-nurajn.com"
    "kubernetes.io/cluster/qa-nurajn.com" = "owned"
  }
}

resource "aws_nat_gateway" "us-west-1c-qa-nurajn-com" {
  allocation_id = "${aws_eip.us-west-1c-qa-nurajn-com.id}"
  subnet_id     = "${aws_subnet.utility-us-west-1c-qa-nurajn-com.id}"

  tags = {
    KubernetesCluster                     = "qa-nurajn.com"
    Name                                  = "us-west-1c.qa-nurajn.com"
    "kubernetes.io/cluster/qa-nurajn.com" = "owned"
  }
}

resource "aws_route" "0-0-0-0--0" {
  route_table_id         = "${aws_route_table.qa-nurajn-com.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.qa-nurajn-com.id}"
}

resource "aws_route" "private-us-west-1b-0-0-0-0--0" {
  route_table_id         = "${aws_route_table.private-us-west-1b-qa-nurajn-com.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.us-west-1b-qa-nurajn-com.id}"
}

resource "aws_route" "private-us-west-1c-0-0-0-0--0" {
  route_table_id         = "${aws_route_table.private-us-west-1c-qa-nurajn-com.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.us-west-1c-qa-nurajn-com.id}"
}

resource "aws_route53_record" "api-qa-nurajn-com" {
  name = "api.qa-nurajn.com"
  type = "A"

  alias = {
    name                   = "${aws_elb.api-qa-nurajn-com.dns_name}"
    zone_id                = "${aws_elb.api-qa-nurajn-com.zone_id}"
    evaluate_target_health = false
  }

  zone_id = "/hostedzone/Z3DY2HDHAL36NI"
}

resource "aws_route53_record" "bastion-qa-nurajn-com" {
  name = "bastion.qa-nurajn.com"
  type = "A"

  alias = {
    name                   = "${aws_elb.bastion-qa-nurajn-com.dns_name}"
    zone_id                = "${aws_elb.bastion-qa-nurajn-com.zone_id}"
    evaluate_target_health = false
  }

  zone_id = "/hostedzone/Z3DY2HDHAL36NI"
}

resource "aws_route53_zone_association" "Z3DY2HDHAL36NI" {
  zone_id = "/hostedzone/Z3DY2HDHAL36NI"
  vpc_id  = "${aws_vpc.qa-nurajn-com.id}"
}

resource "aws_route_table" "private-us-west-1b-qa-nurajn-com" {
  vpc_id = "${aws_vpc.qa-nurajn-com.id}"

  tags = {
    KubernetesCluster                     = "qa-nurajn.com"
    Name                                  = "private-us-west-1b.qa-nurajn.com"
    "kubernetes.io/cluster/qa-nurajn.com" = "owned"
    "kubernetes.io/kops/role"             = "private-us-west-1b"
  }
}

resource "aws_route_table" "private-us-west-1c-qa-nurajn-com" {
  vpc_id = "${aws_vpc.qa-nurajn-com.id}"

  tags = {
    KubernetesCluster                     = "qa-nurajn.com"
    Name                                  = "private-us-west-1c.qa-nurajn.com"
    "kubernetes.io/cluster/qa-nurajn.com" = "owned"
    "kubernetes.io/kops/role"             = "private-us-west-1c"
  }
}

resource "aws_route_table" "qa-nurajn-com" {
  vpc_id = "${aws_vpc.qa-nurajn-com.id}"

  tags = {
    KubernetesCluster                     = "qa-nurajn.com"
    Name                                  = "qa-nurajn.com"
    "kubernetes.io/cluster/qa-nurajn.com" = "owned"
    "kubernetes.io/kops/role"             = "public"
  }
}

resource "aws_route_table_association" "private-us-west-1b-qa-nurajn-com" {
  subnet_id      = "${aws_subnet.us-west-1b-qa-nurajn-com.id}"
  route_table_id = "${aws_route_table.private-us-west-1b-qa-nurajn-com.id}"
}

resource "aws_route_table_association" "private-us-west-1c-qa-nurajn-com" {
  subnet_id      = "${aws_subnet.us-west-1c-qa-nurajn-com.id}"
  route_table_id = "${aws_route_table.private-us-west-1c-qa-nurajn-com.id}"
}

resource "aws_route_table_association" "utility-us-west-1b-qa-nurajn-com" {
  subnet_id      = "${aws_subnet.utility-us-west-1b-qa-nurajn-com.id}"
  route_table_id = "${aws_route_table.qa-nurajn-com.id}"
}

resource "aws_route_table_association" "utility-us-west-1c-qa-nurajn-com" {
  subnet_id      = "${aws_subnet.utility-us-west-1c-qa-nurajn-com.id}"
  route_table_id = "${aws_route_table.qa-nurajn-com.id}"
}

resource "aws_security_group" "api-elb-qa-nurajn-com" {
  name        = "api-elb.qa-nurajn.com"
  vpc_id      = "${aws_vpc.qa-nurajn-com.id}"
  description = "Security group for api ELB"

  tags = {
    KubernetesCluster                     = "qa-nurajn.com"
    Name                                  = "api-elb.qa-nurajn.com"
    "kubernetes.io/cluster/qa-nurajn.com" = "owned"
  }
}

resource "aws_security_group" "bastion-elb-qa-nurajn-com" {
  name        = "bastion-elb.qa-nurajn.com"
  vpc_id      = "${aws_vpc.qa-nurajn-com.id}"
  description = "Security group for bastion ELB"

  tags = {
    KubernetesCluster                     = "qa-nurajn.com"
    Name                                  = "bastion-elb.qa-nurajn.com"
    "kubernetes.io/cluster/qa-nurajn.com" = "owned"
  }
}

resource "aws_security_group" "bastion-qa-nurajn-com" {
  name        = "bastion.qa-nurajn.com"
  vpc_id      = "${aws_vpc.qa-nurajn-com.id}"
  description = "Security group for bastion"

  tags = {
    KubernetesCluster                     = "qa-nurajn.com"
    Name                                  = "bastion.qa-nurajn.com"
    "kubernetes.io/cluster/qa-nurajn.com" = "owned"
  }
}

resource "aws_security_group" "masters-qa-nurajn-com" {
  name        = "masters.qa-nurajn.com"
  vpc_id      = "${aws_vpc.qa-nurajn-com.id}"
  description = "Security group for masters"

  tags = {
    KubernetesCluster                     = "qa-nurajn.com"
    Name                                  = "masters.qa-nurajn.com"
    "kubernetes.io/cluster/qa-nurajn.com" = "owned"
  }
}

resource "aws_security_group" "nodes-qa-nurajn-com" {
  name        = "nodes.qa-nurajn.com"
  vpc_id      = "${aws_vpc.qa-nurajn-com.id}"
  description = "Security group for nodes"

  tags = {
    KubernetesCluster                     = "qa-nurajn.com"
    Name                                  = "nodes.qa-nurajn.com"
    "kubernetes.io/cluster/qa-nurajn.com" = "owned"
  }
}

resource "aws_security_group_rule" "all-master-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-qa-nurajn-com.id}"
  source_security_group_id = "${aws_security_group.masters-qa-nurajn-com.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-master-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-qa-nurajn-com.id}"
  source_security_group_id = "${aws_security_group.masters-qa-nurajn-com.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-node-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-qa-nurajn-com.id}"
  source_security_group_id = "${aws_security_group.nodes-qa-nurajn-com.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "api-elb-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.api-elb-qa-nurajn-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "bastion-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.bastion-qa-nurajn-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "bastion-elb-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.bastion-elb-qa-nurajn-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "bastion-to-master-ssh" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-qa-nurajn-com.id}"
  source_security_group_id = "${aws_security_group.bastion-qa-nurajn-com.id}"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "bastion-to-node-ssh" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-qa-nurajn-com.id}"
  source_security_group_id = "${aws_security_group.bastion-qa-nurajn-com.id}"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "https-api-elb-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.api-elb-qa-nurajn-com.id}"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "https-elb-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-qa-nurajn-com.id}"
  source_security_group_id = "${aws_security_group.api-elb-qa-nurajn-com.id}"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "master-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.masters-qa-nurajn-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.nodes-qa-nurajn-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-to-master-tcp-1-2379" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-qa-nurajn-com.id}"
  source_security_group_id = "${aws_security_group.nodes-qa-nurajn-com.id}"
  from_port                = 1
  to_port                  = 2379
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-2382-4000" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-qa-nurajn-com.id}"
  source_security_group_id = "${aws_security_group.nodes-qa-nurajn-com.id}"
  from_port                = 2382
  to_port                  = 4000
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-4003-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-qa-nurajn-com.id}"
  source_security_group_id = "${aws_security_group.nodes-qa-nurajn-com.id}"
  from_port                = 4003
  to_port                  = 65535
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-udp-1-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-qa-nurajn-com.id}"
  source_security_group_id = "${aws_security_group.nodes-qa-nurajn-com.id}"
  from_port                = 1
  to_port                  = 65535
  protocol                 = "udp"
}

resource "aws_security_group_rule" "ssh-elb-to-bastion" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.bastion-qa-nurajn-com.id}"
  source_security_group_id = "${aws_security_group.bastion-elb-qa-nurajn-com.id}"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "ssh-external-to-bastion-elb-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.bastion-elb-qa-nurajn-com.id}"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_subnet" "us-west-1b-qa-nurajn-com" {
  vpc_id            = "${aws_vpc.qa-nurajn-com.id}"
  cidr_block        = "172.20.32.0/19"
  availability_zone = "us-west-1b"

  tags = {
    KubernetesCluster                     = "qa-nurajn.com"
    Name                                  = "us-west-1b.qa-nurajn.com"
    SubnetType                            = "Private"
    "kubernetes.io/cluster/qa-nurajn.com" = "owned"
    "kubernetes.io/role/internal-elb"     = "1"
  }
}

resource "aws_subnet" "us-west-1c-qa-nurajn-com" {
  vpc_id            = "${aws_vpc.qa-nurajn-com.id}"
  cidr_block        = "172.20.64.0/19"
  availability_zone = "us-west-1c"

  tags = {
    KubernetesCluster                     = "qa-nurajn.com"
    Name                                  = "us-west-1c.qa-nurajn.com"
    SubnetType                            = "Private"
    "kubernetes.io/cluster/qa-nurajn.com" = "owned"
    "kubernetes.io/role/internal-elb"     = "1"
  }
}

resource "aws_subnet" "utility-us-west-1b-qa-nurajn-com" {
  vpc_id            = "${aws_vpc.qa-nurajn-com.id}"
  cidr_block        = "172.20.0.0/22"
  availability_zone = "us-west-1b"

  tags = {
    KubernetesCluster                     = "qa-nurajn.com"
    Name                                  = "utility-us-west-1b.qa-nurajn.com"
    SubnetType                            = "Utility"
    "kubernetes.io/cluster/qa-nurajn.com" = "owned"
    "kubernetes.io/role/elb"              = "1"
  }
}

resource "aws_subnet" "utility-us-west-1c-qa-nurajn-com" {
  vpc_id            = "${aws_vpc.qa-nurajn-com.id}"
  cidr_block        = "172.20.4.0/22"
  availability_zone = "us-west-1c"

  tags = {
    KubernetesCluster                     = "qa-nurajn.com"
    Name                                  = "utility-us-west-1c.qa-nurajn.com"
    SubnetType                            = "Utility"
    "kubernetes.io/cluster/qa-nurajn.com" = "owned"
    "kubernetes.io/role/elb"              = "1"
  }
}

resource "aws_vpc" "qa-nurajn-com" {
  cidr_block           = "172.20.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    KubernetesCluster                     = "qa-nurajn.com"
    Name                                  = "qa-nurajn.com"
    "kubernetes.io/cluster/qa-nurajn.com" = "owned"
  }
}

resource "aws_vpc_dhcp_options" "qa-nurajn-com" {
  domain_name         = "us-west-1.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]

  tags = {
    KubernetesCluster                     = "qa-nurajn.com"
    Name                                  = "qa-nurajn.com"
    "kubernetes.io/cluster/qa-nurajn.com" = "owned"
  }
}

resource "aws_vpc_dhcp_options_association" "qa-nurajn-com" {
  vpc_id          = "${aws_vpc.qa-nurajn-com.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.qa-nurajn-com.id}"
}

terraform = {
  required_version = ">= 0.9.3"
}
