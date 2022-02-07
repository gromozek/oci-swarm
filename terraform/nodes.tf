resource "oci_core_instance" "node" {
  count = 4
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_ocid
  display_name        = "node0${count.index+1}"
  shape               = "VM.Standard.A1.Flex"
  shape_config        {
        memory_in_gbs = 6
        ocpus = 1
        }
  create_vnic_details {
        assign_public_ip = true
        subnet_id        = oci_core_subnet.vcn-public-subnet.id
  }

  source_details {
    source_type = "image"
    source_id   = "ocid1.image.oc1.eu-zurich-1.aaaaaaaa4sbb4pkjghfxr5buwkokck6ofsna2lvg6pa3ff3wbif4qwhqroiq"
  }

  metadata = {
    ssh_authorized_keys = file(var.ssh_public_key)
  }
}
