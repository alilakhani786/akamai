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
Built for Akamai, with Love!

[Getting started](#getting-started) •
[Self servive](#self-service) •
[Terraform templates](#terraform-templates) •
[Integrations](#third-party-integrations)

</div>

<div align="left">

## Getting started

 * Before you can use API/Terraform, you need to [Create authentication credentials.](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials) Also check: [Setup Akamai Develoment Enviroment](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials)
 * You need to determine the IDs for your contracts and groups prior to using this API. Both operations are available through the [Property Manager API](https://techdocs.akamai.com/property-mgr/reference/api) (PAPI) using its [List contracts](https://techdocs.akamai.com/property-mgr/reference/get-contracts) and [List groups](https://techdocs.akamai.com/property-mgr/reference/get-groups) resources.
 * Ensure Ceritificate is provisioned and capture enrollment ID

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
</div>
