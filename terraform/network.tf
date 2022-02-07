resource "oci_core_vcn" "vcn" {

  # Required Inputs
  compartment_id = var.compartment_ocid

  #Optional
  cidr_block = var.cidr_vcn
  display_name = "gromozek"
  dns_label = "gromozek"
  is_ipv6enabled = false
}

resource "oci_core_internet_gateway" "internet_gateway" {
  compartment_id = var.compartment_ocid
  display_name   = "InternetGateway"
  vcn_id         = oci_core_vcn.vcn.id
}

resource "oci_core_default_route_table" "default_route_table" {
  manage_default_resource_id = oci_core_vcn.vcn.default_route_table_id
  display_name               = "defaultRouteTable"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.internet_gateway.id
  }
}

resource "oci_core_subnet" "vcn-public-subnet"{

  # Required
  compartment_id = var.compartment_ocid
  vcn_id = oci_core_vcn.vcn.id
  cidr_block = var.cidr_subnet

  # Optional
  display_name = "public-subnet"
}

resource "oci_core_default_security_list" "security-list"{

# Required
  manage_default_resource_id = oci_core_vcn.vcn.default_security_list_id

# Optional

  egress_security_rules {
      stateless = false
      destination = "0.0.0.0/0"
      destination_type = "CIDR_BLOCK"
      protocol = "all"
  }

  ingress_security_rules {
      stateless = false
      source = "0.0.0.0/0"
      source_type = "CIDR_BLOCK"
      protocol = "6"
      tcp_options {
          min = 22
          max = 22
      }
    }

  ingress_security_rules {
      stateless = false
      source = "0.0.0.0/0"
      source_type = "CIDR_BLOCK"
      protocol = "6"
      tcp_options {
          min = 3000
          max = 3000
      }
    }

  ingress_security_rules {
      stateless = false
      source = "0.0.0.0/0"
      source_type = "CIDR_BLOCK"
      protocol = "6"
      tcp_options {
          min = 8080
          max = 8080
      }
    }

  ingress_security_rules {
      stateless = false
      source = "0.0.0.0/0"
      source_type = "CIDR_BLOCK"
      protocol = "6"
      tcp_options {
          min = 9090
          max = 9100
      }
    }

  ingress_security_rules {
      stateless = false
      source = "0.0.0.0/0"
      source_type = "CIDR_BLOCK"
      protocol = "1"

      icmp_options {
        type = 3
        code = 4
      }
    }

  ingress_security_rules {
      stateless = false
      source = "192.168.101.0/25"
      source_type = "CIDR_BLOCK"
      protocol = "all"
    }
}
