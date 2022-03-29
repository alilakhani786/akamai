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

 * You need to have API access<br />
 [Create authentication credentials](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials) | [Setup Akamai Develoment Enviroment](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials)
 * Setup .edgerc file with your credentials (^)
 * Determine the IDs for your contracts, groups prior to using the API's. Both operations are available through the [Property Manager API](https://techdocs.akamai.com/property-mgr/reference/api) (PAPI) using its [List contracts](https://techdocs.akamai.com/property-mgr/reference/get-contracts) and [List groups](https://techdocs.akamai.com/property-mgr/reference/get-groups) resources.
 * Ensure you have a valid certificate provisioned on Akamai Control Center
 * Ensure you have a development enviroment setup. Minimum: Akamai CLi, Visual Studio Code, Terraform, Git.

 ### Thereafter

* ``` Git clone https://github.com/alilakhani786/akamai.git ``` and open the project in VSCode <br />
<img
  src="img/vs01.png"
  alt=""
  title="Project tree"
  style="display: inline-block; margin: 0 auto; width:200px;">


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