<!-- markdownlint-configure-file {
  "MD013": {
    "code_blocks": false,
    "tables": false
  },
  "MD033": false,
  "MD041": false
} -->

# ION Template

## Description

ION-Template is a Terraform project which enables you to automate onboarding of Akamai Property Manager under product: ION.

## How to use this template?

### Before you begin
 * Before you can use API/Terraform, you need to [Create authentication credentials.](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials) Also check: [Setup Akamai Develoment Enviroment](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials)
 * You need to determine the IDs for your contracts and groups prior to using this API. Both operations are available through the [Property Manager API](https://techdocs.akamai.com/property-mgr/reference/api) (PAPI) using its [List contracts](https://techdocs.akamai.com/property-mgr/reference/get-contracts) and [List groups](https://techdocs.akamai.com/property-mgr/reference/get-groups) resources.
 * Ensure Ceritificate is provisioned and capture enrollment ID

 ## What rules will be created?

Following rules will be created with Need to [propertyManager](https://github.com/alilakhani786/akamai/tree/main/terraform/propertyManager) terraform project.

| Rules | Behavior | Feature |
| ----- | -------- | ------- |
| ***Default Rule*** |                             |
|                    | **Origin server**           |
|                    | Cache Key Hostname          |  Incoming Host Header
|                    | Supports Gzip Compression   |  Yes                                                          
|                    | Send True Client IP Header  |  Yes                                                          
|                    | Forward Host Header         |  Incoming Host Header                                                          
|                    | Origin Server Hostname      |  Origin Server
|                    | HTTP Port                   |  80
|                    | HTTPS Port                  |  443                            
|                    | Use SNI TLS Extension       |  Yes   
|                    | Allow Clients To Set True Client IP Header |  No
|                    | True Client IP Header Name  |  True-Client-IP
</div>
</div>