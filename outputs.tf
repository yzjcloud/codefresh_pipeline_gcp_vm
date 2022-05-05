output "vm_id" {
    value = google_compute_instance.vm1.id
}

output "instance_id" {
    value = google_compute_instance.vm1.instance_id
}

output "vm_selflink" {
    value = google_compute_instance.vm1.self_link
}

output "vm_internal_ipaddress" {
    value = google_compute_instance.vm1.network_interface.0.network_ip
}

# output "vm_external_ipaddress" {
#     value = google_compute_instance.vm1.network_interface.0.access_config.0.nat_ip
# }

output "vm_serviceaccount" {
    value = google_service_account.vm1_serviceaccount.email
}