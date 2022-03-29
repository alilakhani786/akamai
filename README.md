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
<p style="font-size: x-small">

```
Configuring Property
Fetching property ... [OK]
Fetching property rules ... [OK]
Fetching group ... [OK]
Fetching property version ... [OK]
Fetching product name ... [OK]
Fetching hostnames ... [OK]
Fetching contact details ... [OK]
Saving TF configurations ... [OK]
Property configuration completed

nlakhani@sin-mpewj ew.lakhanis.net % ls -lrta
total 48
drwxr-xr-x  9 nlakhani  staff   288 Mar 28 19:45 property-snippets
-rw-r--r--  1 nlakhani  staff   838 Mar 28 19:45 property.tf
-rw-r--r--  1 nlakhani  staff   104 Mar 28 19:45 versions.tf
-rw-r--r--  1 nlakhani  staff    40 Mar 28 19:45 variables.tf
-rw-r--r--  1 nlakhani  staff    99 Mar 28 19:45 import.sh
drwxr-xr-x  8 nlakhani  staff   256 Mar 28 19:49 .
-rw-r--r--@ 1 nlakhani  staff  6148 Mar 28 19:49 .DS_Store
drwx------  9 nlakhani  staff   288 Mar 28 19:49 ..
nlakhani@sin-mpewj ew.lakhanis.net %
```
</p>

</div>
