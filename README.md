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
[Installation](#installation) •
[Configuration](#configuration) •
[Integrations](#third-party-integrations)

</div>

## Getting started


| Rules | Behavior | Feature |
| ----- | -------- | ------- |
| ***Default Rule*** |                             |
|                    | **Origin server**           |
|                    | Cache Key Hostname          |  Incoming Host Header
|                    | Supports Gzip Compression   |  Yes                                                          
|                    | Send True Client IP Header  |  Yes                                                          
|                    | Forward Host Header         |  Incoming Host Header                                                          
|                    | Origin Server Hostname      |  {{user.PMUSER_ORIGINSERVER}}
|                    | HTTP Port                   |  80
|                    | HTTPS Port                  |  443                            
|                    | Use SNI TLS Extension       |  Yes   
|                    | Allow Clients To Set True Client IP Header |  No
|                    | True Client IP Header Name  |  True-Client-IP
| ----- | -------- | ------- |                                          