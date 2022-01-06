# ServiceNow/Terraform Cloud Integration

*This repository is supposed to be triggered by ServiceNow instance using the Terraform connector.*

This repository contains the Terraform files needed for the Deployment of a VM in Azure considering the next points:
- Already exists one *Resource Group*, one *VNet* and one *Subnet*
- There must exist three variables in TFC(these ones will be created in the TFC Workspace by ServiceNow). 
- The VM and NIC will contain 3 mandatory tags (Sentinel).


In case there is no integration with SNow yet, do the following:

### TFC Set up
- Configure VCS in Terraform Cloud.
- Create a workspace in TFC specifying the respository which contains this code.
- Create Environment variables for Authentication to Azure.
- Create Terraform variables for the ones that are used in the TF files.



