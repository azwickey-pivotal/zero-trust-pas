resource "aws_security_group" "pcf-diego" {
    name = "pcf_diego_security_group"
    description = "SG for Diego PCF Instances"
    vpc_id = "${var.aws_vpc}"
    tags {
        Name = "${var.env_name}_pcf_diego_security_group"
    }
}

resource "aws_security_group_rule" "allow_diego_egress_rds" {
    description = "Outbound RDS Access"
    type = "egress"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-rds.id}"
}

resource "aws_security_group_rule" "allow_diego_egress_cc" {
    description = "Outbound CC Access"
    type = "egress"
    from_port = 9022
    to_port = 9023
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-cc.id}"
}

resource "aws_security_group_rule" "allow_diego_egress_uaa" {
    description = "Outbound UAA Access"
    type = "egress"
    from_port = 8443
    to_port = 8443
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-uaa.id}"
}

resource "aws_security_group_rule" "allow_diego_ingress_cell" {
    description = "Inbound Diego Cell Access"
    type = "ingress"
    from_port = 4003
    to_port = 4003
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-diego-cell.id}"
}

resource "aws_security_group_rule" "allow_diego_ingress_celliso" {
    description = "Inbound Diego Cell Access"
    type = "ingress"
    from_port = 4003
    to_port = 4003
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-diego-celliso.id}"
}

resource "aws_security_group_rule" "allow_diego_egress_nats" {
    description = "Outbound CF NATS Access"
    type = "egress"
    from_port = 4222
    to_port = 4222
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-nats.id}"
}

resource "aws_security_group_rule" "allow_diego_ingress_cc" {
    description = "Inbound CC Access"
    type = "ingress"
    from_port = 8889
    to_port = 8889
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-cc.id}"
}

resource "aws_security_group_rule" "allow_diego_locket_ingress_cc" {
    description = "Inbound CC Locket Access"
    type = "ingress"
    from_port = 8891
    to_port = 8891
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-cc.id}"
}

resource "aws_security_group_rule" "allow_diego_egress_loggregator" {
    description = "Outbound Loggregator Access"
    type = "egress"
    from_port = 8080
    to_port = 8088
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-loggregator.id}"
}

resource "aws_security_group_rule" "allow_diego_locket_ingress_internal" {
    description = "Inbound Diego Internal Locket Access"
    type = "ingress"
    from_port = 8891
    to_port = 8891
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    self= true
}

resource "aws_security_group_rule" "allow_diego_bbs_ingress_internal" {
    description = "Inbound Diego Internal BBS Access"
    type = "ingress"
    from_port = 8889
    to_port = 8889
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    self= true
}

resource "aws_security_group_rule" "allow_diego_locket_egress_internal" {
    description = "Inbound Diego Internal Locket Access"
    type = "egress"
    from_port = 8891
    to_port = 8891
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    self= true
}

resource "aws_security_group_rule" "allow_diego_bbs_egress_internal" {
    description = "Inbound Diego Internal BBS Access"
    type = "egress"
    from_port = 8889
    to_port = 8889
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    self= true
}

resource "aws_security_group_rule" "allow_diego_locket_ingress_cell" {
    description = "Inbound Diego Cell Locket Access"
    type = "ingress"
    from_port = 8891
    to_port = 8891
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-diego-cell.id}"
}

resource "aws_security_group_rule" "allow_diego_locket_ingress_celliso" {
    description = "Inbound Diego Cell Locket Access"
    type = "ingress"
    from_port = 8891
    to_port = 8891
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-diego-celliso.id}"
}

resource "aws_security_group_rule" "allow_diego_bbs_ingress_cell" {
    description = "Inbound Diego Cell BBS Access"
    type = "ingress"
    from_port = 8889
    to_port = 8889
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-diego-cell.id}"
}

resource "aws_security_group_rule" "allow_diego_bbs_ingress_celliso" {
    description = "Inbound Diego Cell BBS Access"
    type = "ingress"
    from_port = 8889
    to_port = 8889
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-diego-celliso.id}"
}

resource "aws_security_group_rule" "allow_diego_cc_uploader_ingress_cell" {
    description = "Inbound Diego Cell CC Uploader Access"
    type = "ingress"
    from_port = 9091
    to_port = 9091
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-diego-cell.id}"
}

resource "aws_security_group_rule" "allow_diego_cc_uploader_ingress_celliso" {
    description = "Inbound Diego Cell CC Uploader Access"
    type = "ingress"
    from_port = 9091
    to_port = 9091
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-diego-celliso.id}"
}

resource "aws_security_group_rule" "allow_diego_fileserver_ingress_cell" {
    description = "Inbound Diego Cell File Server Access"
    type = "ingress"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-diego-cell.id}"
}

resource "aws_security_group_rule" "allow_diego_fileserver_ingress_celliso" {
    description = "Inbound Diego Cell File Server Access"
    type = "ingress"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-diego-celliso.id}"
}

resource "aws_security_group_rule" "allow_diego_fileserver_ingress_cell1" {
    description = "Inbound Diego Cell File Server Access"
    type = "ingress"
    from_port = 8084
    to_port = 8084
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-diego-cell.id}"
}

resource "aws_security_group_rule" "allow_diego_fileserver_ingress_celliso1" {
    description = "Inbound Diego Cell File Server Access"
    type = "ingress"
    from_port = 8084
    to_port = 8084
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-diego-celliso.id}"
}

resource "aws_security_group_rule" "allow_diego_egress_rep" {
    description = "Outbound Diego Cell Rep Access"
    type = "egress"
    from_port = 1801
    to_port = 1801
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-diego-cell.id}"
}

resource "aws_security_group_rule" "allow_diego_egress_rep_iso" {
    description = "Outbound Diego Cell Rep Access"
    type = "egress"
    from_port = 1801
    to_port = 1801
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-diego-celliso.id}"
}

resource "aws_security_group_rule" "allow_diego_egress_container_ssh" {
    description = "Outbound Diego Cell SSH Access (container) Access"
    type = "egress"
    from_port = 61001
    to_port = 65534
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-diego-cell.id}"
}

resource "aws_security_group_rule" "allow_diego_egress_container_ssh_iso" {
    description = "Outbound Diego Cell SSH Access (container) Access"
    type = "egress"
    from_port = 61001
    to_port = 65534
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-diego-celliso.id}"
}

resource "aws_security_group_rule" "allow_diego_ingress_internal" {
    description = "Inbound Diego Internal Access"
    type = "ingress"
    from_port = 9016
    to_port = 9016
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    self= true
}

resource "aws_security_group_rule" "allow_diego_egress_internal" {
    description = "Outbound Diego Internal Access"
    type = "egress"
    from_port = 9016
    to_port = 9016
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    self= true
}

resource "aws_security_group_rule" "allow_diego_ingress_rep" {
    description = "Inbound Diego Rep Access"
    type = "ingress"
    from_port = 1801
    to_port = 1801
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-diego-cell.id}"
}

resource "aws_security_group_rule" "allow_diego_ingress_rep_iso" {
    description = "Inbound Diego Rep Access"
    type = "ingress"
    from_port = 1801
    to_port = 1801
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-diego-celliso.id}"
}

resource "aws_security_group_rule" "allow_diego_ingress_silk" {
    description = "Inbound Silk Controller Access"
    type = "ingress"
    from_port = 4103
    to_port = 4103
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-diego-cell.id}"
}

resource "aws_security_group_rule" "allow_diego_iso_ingress_silk" {
    description = "Inbound Silk Controller Access"
    type = "ingress"
    from_port = 4103
    to_port = 4103
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-diego-celliso.id}"
}

resource "aws_security_group_rule" "allow_diego_ingress_network_policy" {
    description = "Inbound Network Policy Server Access"
    type = "ingress"
    from_port = 4002
    to_port = 4002
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-router.id}"
}

resource "aws_security_group_rule" "allow_diego_egress_cc1" {
    description = "Outbound CC Access"
    type = "egress"
    from_port = 9024
    to_port = 9024
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-cc.id}"
}

resource "aws_security_group_rule" "allow_diego_ingress_external_ssh" {
    description = "Inbound Diego Cell Container SSH Access"
    type = "ingress"
    from_port = 2222
    to_port = 2222
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    cidr_blocks = ["${var.router_ingress_cidr}"]
}
