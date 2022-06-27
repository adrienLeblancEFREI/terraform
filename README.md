### Adrien Leblanc
<br>

# TP4 Terraform

### Login in Azure portal
```ps
az login
```
### Initiating Terraform workspace
```ps
terraform init
```

### Displaying resources to create with terraform
```ps
terraform plan
```
### Applying the creation of ressources
```ps
adrien@DESKTOP-OUBL135:/mnt/c/Users/adrie/Videos/Captures/EFREI/M1 app/Devops/TP Terraform$ terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_linux_virtual_machine.myterraformvm will be created

  [...]

  Plan: 6 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

tls_private_key.example_ssh: Creating...
tls_private_key.example_ssh: Creation complete after 0s [id=cabea5c40f6fbf519706a833ae8818b5be1340ba]
azurerm_network_security_group.myterraformnsg: Creating...
azurerm_public_ip.myterraformpublicip: Creating...
azurerm_public_ip.myterraformpublicip: Creation complete after 1s [id=/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Network/publicIPAddresses/myPublicIP-20200813]
azurerm_network_interface.myterraformnic: Creating...
azurerm_network_interface.myterraformnic: Creation complete after 1s [id=/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Network/networkInterfaces/myNIC]
azurerm_linux_virtual_machine.myterraformvm: Creating...
azurerm_network_security_group.myterraformnsg: Creation complete after 3s [id=/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Network/networkSecurityGroups/myNetworkSecurityGroup-20200813]
azurerm_network_interface_security_group_association.example: Creating...
azurerm_network_interface_security_group_association.example: Creation complete after 1s [id=/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Network/networkInterfaces/myNIC|/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Network/networkSecurityGroups/myNetworkSecurityGroup-20200813]
azurerm_linux_virtual_machine.myterraformvm: Still creating... [10s elapsed]
azurerm_linux_virtual_machine.myterraformvm: Still creating... [20s elapsed]
azurerm_linux_virtual_machine.myterraformvm: Still creating... [30s elapsed]
azurerm_linux_virtual_machine.myterraformvm: Still creating... [40s elapsed]
azurerm_linux_virtual_machine.myterraformvm: Creation complete after 47s [id=/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Compute/virtualMachines/devops-20200813]

Apply complete! Resources: 6 added, 0 changed, 0 destroyed.

Outputs:

public_ip_adress = "##.###.##.##"
resource_groupe_name = "devops-TP2"
tls_private_key = <sensitive>
```
### extracting private key made in terraform into a file named id_rsa
```ps
adrien@DESKTOP-OUBL135:/mnt/c/Users/adrie/Videos/Captures/EFREI/M1 app/Devops/TP Terraform$ terraform output -raw tls_private_key > id_rsa
```
### grant rights to id_rsa
```ps
adrien@DESKTOP-OUBL135:/mnt/c/Users/adrie/Videos/Captures/EFREI/M1 app/Devops/TP Terraform$ sudo chmod 600 id_rsa
```

### testing the connection to the virtual virtual machine
```ps
adrien@DESKTOP-OUBL135:/mnt/c/Users/adrie/Videos/Captures/EFREI/M1 app/Devops/TP Terraform$ sudo ssh -i id_rsa devops@##.###.##.## cat /etc/os-release
The authenticity of host '##.###.##.## (##.###.##.##)' can't be established.
ECDSA key fingerprint is SHA256:pobz9nnVIvhvtQzNWZP7keRY8QYGkkYatXpjBDy2JJY.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '##.###.##.##' (ECDSA) to the list of known hosts.
NAME="Ubuntu"
VERSION="16.04.7 LTS (Xenial Xerus)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 16.04.7 LTS"
VERSION_ID="16.04"
HOME_URL="http://www.ubuntu.com/"
SUPPORT_URL="http://help.ubuntu.com/"
BUG_REPORT_URL="http://bugs.launchpad.net/ubuntu/"
VERSION_CODENAME=xenial
UBUNTU_CODENAME=xenial
```

### Advantages of using Terraform

It's a tool that allow creation, update and administration of the infrastructure. And it is fully automated.
It's an open source solution with a big community contributing to development of the tool.
Speed and security are also good advantages provided by terraform.
