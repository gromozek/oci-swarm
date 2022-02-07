# Outputs for the vcn module

output "vcn_id" {
  description = "OCID of the VCN that is created"
  value = oci_core_vcn.vcn.id
}

# Outputs for public subnet

output "public-subnet-name" {
  value = oci_core_subnet.vcn-public-subnet.display_name
}
output "public-subnet-OCID" {
  value = oci_core_subnet.vcn-public-subnet.id
}


# Outputs for compute instance

output "public-ip-for-compute-instance" {
  value = [for instance in oci_core_instance.node: instance.public_ip]
}
