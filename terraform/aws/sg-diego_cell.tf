resource "aws_security_group" "pcf-diego-cell" {
    name = "pcf_diego_cell_security_group"
    description = "SG for Diego Cell PCF Instances"
    vpc_id = "${var.aws_vpc}"
    tags {
        Name = "${var.env_name}_pcf_diego_cell_security_group"
    }
}

resource "aws_security_group_rule" "allow_diego_cell_egress_diego_db" {
    description = "Outbound Diego DB Access"
    type = "egress"
    from_port = 4003
    to_port = 4003
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego-cell.id}"
    source_security_group_id = "${aws_security_group.pcf-diego.id}"
}

resource "aws_security_group_rule" "allow_diego_cell_egress_credhub" {
    description = "Outbound Credhub Access"
    type = "egress"
    from_port = 8844
    to_port = 8844
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego-cell.id}"
    source_security_group_id = "${aws_security_group.pcf-credhub.id}"
}

resource "aws_security_group_rule" "allow_cell_egress_loggregator" {
    description = "Outbound Loggregator Access"
    type = "egress"
    from_port = 8080
    to_port = 8088
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego-cell.id}"
    source_security_group_id = "${aws_security_group.pcf-loggregator.id}"
}

resource "aws_security_group_rule" "allow_cell_egress_nats" {
    description = "Outbound NATs Access"
    type = "egress"
    from_port = 4222
    to_port = 4222
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego-cell.id}"
    source_security_group_id = "${aws_security_group.pcf-nats.id}"
}

resource "aws_security_group_rule" "allow_cell_egress_diego_bbs" {
    description = "Outbound Diego BBS Access"
    type = "egress"
    from_port = 8889
    to_port = 8889
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego-cell.id}"
    source_security_group_id = "${aws_security_group.pcf-diego.id}"
}

resource "aws_security_group_rule" "allow_cell_egress_diego_locket" {
    description = "Outbound Diego Locket Access"
    type = "egress"
    from_port = 8891
    to_port = 8891
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego-cell.id}"
    source_security_group_id = "${aws_security_group.pcf-diego.id}"
}

resource "aws_security_group_rule" "allow_cell_egress_diego_cc_uploader" {
    description = "Outbound Diego CC Uploader Access"
    type = "egress"
    from_port = 9091
    to_port = 9091
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego-cell.id}"
    source_security_group_id = "${aws_security_group.pcf-diego.id}"
}

resource "aws_security_group_rule" "allow_cell_egress_diego_fileserver" {
    description = "Outbound Diego File Server Access"
    type = "egress"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego-cell.id}"
    source_security_group_id = "${aws_security_group.pcf-diego.id}"
}

resource "aws_security_group_rule" "allow_cell_egress_diego_fileserver1" {
    description = "Outbound Diego File Server Access"
    type = "egress"
    from_port = 8084
    to_port = 8084
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego-cell.id}"
    source_security_group_id = "${aws_security_group.pcf-diego.id}"
}

resource "aws_security_group_rule" "allow_cell_rep_ingress_diego" {
    description = "Inbound Rep Access"
    type = "ingress"
    from_port = 1801
    to_port = 1801
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego-cell.id}"
    source_security_group_id = "${aws_security_group.pcf-diego.id}"
}

resource "aws_security_group_rule" "allow_cell_ssh_container_ingress_diego" {
    description = "Inbound Container SSH Access"
    type = "ingress"
    from_port = 61001
    to_port = 65534
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego-cell.id}"
    source_security_group_id = "${aws_security_group.pcf-diego.id}"
}

resource "aws_security_group_rule" "allow_cell_egress_rds" {
    description = "Outbound RDS Access"
    type = "egress"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego-cell.id}"
    source_security_group_id = "${aws_security_group.pcf-rds.id}"
}

resource "aws_security_group_rule" "allow_cell_egress_uaa" {
    description = "Outbound UAA Access"
    type = "egress"
    from_port = 8443
    to_port = 8443
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego-cell.id}"
    source_security_group_id = "${aws_security_group.pcf-uaa.id}"
}

resource "aws_security_group_rule" "allow_cell_egress_cc" {
    description = "Outbound Cloud Controller Access"
    type = "egress"
    from_port = 9023
    to_port = 9023
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego-cell.id}"
    source_security_group_id = "${aws_security_group.pcf-cc.id}"
}

resource "aws_security_group_rule" "allow_cell_egress_rep" {
    description = "Outbound Diego Brain Rep Access"
    type = "egress"
    from_port = 1801
    to_port = 1801
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego-cell.id}"
    source_security_group_id = "${aws_security_group.pcf-diego.id}"
}

resource "aws_security_group_rule" "allow_cell_egress_silk" {
    description = "Outbound Silk Controller Access"
    type = "egress"
    from_port = 4103
    to_port = 4103
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego-cell.id}"
    source_security_group_id = "${aws_security_group.pcf-diego.id}"
}

resource "aws_security_group_rule" "allow_cell_all_internal_egress" {
    description = "Outbound Access to other cells for C2C networking"
    type = "egress"
    from_port = 61001
    to_port = 65534
    protocol = -1
    security_group_id = "${aws_security_group.pcf-diego-cell.id}"
    self = true
    count = "${var.cells_allow_all_internal}"
}

resource "aws_security_group_rule" "allow_cell_all_internal_ingress" {
    description = "Inbound Access from other cells for C2C networking"
    type = "ingress"
    from_port = 61001
    to_port = 65534
    protocol = -1
    security_group_id = "${aws_security_group.pcf-diego-cell.id}"
    self = true
    count = "${var.cells_allow_all_internal}"
}

resource "aws_security_group_rule" "allow_cell_container_ingress_router" {
    description = "Inbound Container SSH Access"
    type = "ingress"
    from_port = 61001
    to_port = 65534
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego-cell.id}"
    source_security_group_id = "${aws_security_group.pcf-router.id}"
}

resource "aws_security_group_rule" "allow_cell_egress_pas_api1" {
    description = "Outbound PAS API Access"
    type = "egress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego-cell.id}"
    cidr_blocks = "${var.pas_nlb_cidr_blocks}"
}

resource "aws_security_group_rule" "allow_cell_egress_pas_api" {
    description = "Outbound PAS API Access"
    type = "egress"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego-cell.id}"
    cidr_blocks = "${var.pas_nlb_cidr_blocks}"
}

resource "aws_security_group_rule" "allow_router_egress_cell_rmq3" {
    description = "Outbound RMQ Server Access"
    type = "egress"
    from_port = 15672
    to_port = 15674
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego-cell.id}"
    source_security_group_id = "${aws_security_group.pcf-tile-rmq.id}"
}

resource "aws_security_group_rule" "allow_router_egress_cell_rmq4" {
    description = "Outbound RMQ Server Access"
    type = "egress"
    from_port = 5671
    to_port = 5672
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego-cell.id}"
    source_security_group_id = "${aws_security_group.pcf-tile-rmq.id}"
}

resource "aws_security_group_rule" "allow_router_egress_cell_rmq5" {
    description = "Outbound RMQ Server Access"
    type = "egress"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego-cell.id}"
    source_security_group_id = "${aws_security_group.pcf-tile-rmq.id}"
}
