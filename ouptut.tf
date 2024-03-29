output "resource_groupe_name"{
    value = data.azurerm_resource_group.tp4.name
}

output "public_ip_adress" {
    value = azurerm_linux_virtual_machine.myterraformvm.public_ip_address
}

output "tls_private_key" {
    value = tls_private_key.example_ssh.private_key_pem
    sensitive = true
}