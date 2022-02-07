variable "tenancy_ocid" {
    default = "ocid1.tenancy.oc1..aaaaaaaauyum2geq2ywvsnkni2yoiovux5tds4isw7qd5djneaee3k7cbe7q"
}

variable "user_ocid" {
    default = "ocid1.user.oc1..aaaaaaaaoay75zkabt3gru272pxoav6xgdmqxadcqxkp43cgrhwfp4hneaha"
}

variable "fingerprint" {
    default = "11:7c:98:7e:d8:db:39:96:aa:4c:b5:9b:8d:04:a9:f5"
}

variable "private_key_path" {
    default = "/home/sukharevva/.oci/oci_api_key.pem"
}

variable "ssh_public_key" {
    default = "/home/sukharevva/.ssh/id_rsa.pub"
}

variable "compartment_ocid" {
    default = "ocid1.tenancy.oc1..aaaaaaaauyum2geq2ywvsnkni2yoiovux5tds4isw7qd5djneaee3k7cbe7q"
}

variable "availability_domain" {
    default = "OaRL:EU-ZURICH-1-AD-1"
}

variable "region" {
    default = "eu-zurich-1"
}

variable "cidr_vcn" {
    default = "192.168.101.0/24"
}

variable "cidr_subnet" {
    default = "192.168.101.0/25"
}
