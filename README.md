<!-- markdownlint-configure-file {
  "MD013": {
    "code_blocks": false,
    "tables": false
  },
  "MD033": false,
  "MD041": false
} -->

<div align="center">

# Welcome to Ali Lakhani's Repo
Built for Akamai

[Getting started](#getting-started) •
[Terraform templates](#terraform-templates) •
[References](#References)

</div>

<div align="left">

## Getting started

 * Before you can use API/Terraform, you need to [Create authentication credentials.](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials) Also check: [Setup Akamai Develoment Enviroment](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials)
 * You need to determine the IDs for your contracts and groups prior to using this API. Both operations are available through the [Property Manager API](https://techdocs.akamai.com/property-mgr/reference/api) (PAPI) using its [List contracts](https://techdocs.akamai.com/property-mgr/reference/get-contracts) and [List groups](https://techdocs.akamai.com/property-mgr/reference/get-groups) resources.
 * Ensure Ceritificate is provisioned and capture enrollment ID


## References

* [Akamai Terraform Provider](https://registry.terraform.io/providers/akamai/akamai/latest/docs)
* [Akamai CLi](https://github.com/akamai/cli)
* [Akamai Docker](https://github.com/akamai/akamai-docker)
* [Introduction to Akamai Developer Tools](https://techdocs.akamai.com/developer/docs/welcome-to-the-akamai-developer-documentation-hub)

## Terraform templates

* [Terraform Template for ION](https://github.com/alilakhani786/akamai/tree/main/terraform/templates/template-ion)
* [Terraform Template for DSA](https://github.com/alilakhani786/akamai/tree/main/terraform/templates/template-dsa)
* [Terraform Template for App & API Protection (AAP+ASM)](https://github.com/alilakhani786/akamai/tree/main/terraform/templates/template-AAP%2BASM)

<!---
## Self service

### Export delivery configuration into a working terraform project

```
akamai terraform --section <section_name> create-property <property_name>
```
Example output :
```
Configuring Property
...
Saving TF configurations ... [OK]
```
-->

</div>
