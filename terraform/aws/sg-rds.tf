/*
  RDS Security groups
*/
resource "aws_security_group" "pcf-rds" {
    name = "pcf_rds_security_group"
    description = "Security Group for RDS"
    vpc_id = "${var.aws_vpc}"
    tags {
        Name = "${var.env_name}_pcf_rds_security_group"
    }
}

resource "aws_security_group_rule" "allow_om_ingress_rds" {
    description = "Inbound for OpsMan"
    type = "ingress"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-rds.id}"
    source_security_group_id = "${aws_security_group.pcf-opsman.id}"
}

resource "aws_security_group_rule" "allow_bosh_ingress_rds" {
    description = "Inbound for Bosh Director"
    type = "ingress"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-rds.id}"
    source_security_group_id = "${aws_security_group.pcf-bosh.id}"
}

resource "aws_security_group_rule" "allow_diego_ingress_rds" {
    description = "Inbound for Diego"
    type = "ingress"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-rds.id}"
    source_security_group_id = "${aws_security_group.pcf-diego.id}"
}

resource "aws_security_group_rule" "allow_uaa_ingress_rds" {
    description = "Inbound for UAA"
    type = "ingress"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-rds.id}"
    source_security_group_id = "${aws_security_group.pcf-uaa.id}"
}

resource "aws_security_group_rule" "allow_cc_ingress_rds" {
    description = "Inbound for CC"
    type = "ingress"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-rds.id}"
    source_security_group_id = "${aws_security_group.pcf-cc.id}"
}

resource "aws_security_group_rule" "allow_credhub_ingress_rds" {
    description = "Inbound for Credhub"
    type = "ingress"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-rds.id}"
    source_security_group_id = "${aws_security_group.pcf-credhub.id}"
}

resource "aws_security_group_rule" "allow_diego_cell_ingress_rds" {
    description = "Inbound for Diego Cells"
    type = "ingress"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-rds.id}"
    source_security_group_id = "${aws_security_group.pcf-diego-cell.id}"
}

resource "aws_security_group_rule" "allow_diego_celliso_ingress_rds" {
    description = "Inbound for Diego Cells"
    type = "ingress"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-rds.id}"
    source_security_group_id = "${aws_security_group.pcf-diego-celliso.id}"
}
