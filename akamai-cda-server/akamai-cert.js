const EdgeGrid = require('akamai-edgegrid');

var data = 'bodyData';

// Supply the path to your .edgerc file and name
// of the section with authorization to the client
// you are calling (default section is 'default')
const eg = new EdgeGrid({
  path: './.edgerc',
  section: 'default'
});

function list_contracts(switchkey) {
  return new Promise((resolve, reject) => {
    eg.auth({
      path: '/papi/v1/contracts',
      method: 'GET',
      headers: {
        "Accept": "application/json",
      },
      qs: {
        // "accountSwitchKey": "B-V-43575RT:1-8BYUX"
        "accountSwitchKey": switchkey
      },

    })

    eg.send(function (error, response, body) {
      response = JSON.parse(body)
      // console.log(response)
      resolve(response)
    });

  })
}

function list_enrollments(switchkey, contractid) {
  return new Promise((resolve, reject) => {
    eg.auth({
      path: '/cps/v2/enrollments',
      method: 'GET',
      headers: {
        "Accept": 'application/vnd.akamai.cps.enrollments.v11+json'
      },

      qs: {
        // "accountSwitchKey": "B-V-43575RT:1-8BYUX",
        "contractId": contractid,
        //   "contractId": "V-434SAU2"
        "accountSwitchKey": switchkey
      },

    })
    eg.send(function (error, response, body) {
      if (error) {
        console.log("Error occurred: ", error)
      }
      response = JSON.parse(body)
      // console.log(response)
      resolve(response)
    });

  })
}

function create_enrollment(switchkey, contractid) {
  return new Promise((resolve, reject) => {
    eg.auth({
      path: '/cps/v2/enrollments',
      method: 'POST',
      headers: {
        "Content-Type": "application/vnd.akamai.cps.enrollment.v12+json",

        "Accept": "application/vnd.akamai.cps.enrollment-status.v1+json"
      },
      body: {
        "certificateType": "san",
        "changeManagement": false,
        "enableMultiStackedCertificates": false,
        "networkConfiguration": {
          "geography": "core",
          "quicEnabled": false,
          "secureNetwork": "standard-tls",
          "sniOnly": true,
          "disallowedTlsVersions": [
            "TLSv1",
            "TLSv1_1"
          ],
          "dnsNameSettings": {
            "cloneDnsNames": true,
            "dnsNames": ["woocommerce.yinpok.com"]
          },
        },

        "ra": "lets-encrypt", // lets-encrypt 
        "csr": {
        "c": "US",
        "cn": "woocommerce.yinpok.com",
        "l": "Cambridge",
        "o": "Akamai",
        "ou": "WebEx",
        "preferredTrustChain": "dst-root-ca-x3",
        "st": "MA",
        "sans": [
            "woocommerce.yinpok.com",
        ]
    },
        "validationType": "dv",
        "signatureAlgorithm":"SHA-256",
        "pendingChanges": [
          {
            "changeType": "new-certificate",
            "location": "/cps/v2/enrollments/10001/changes/10002"
          },
        ],
        "org": {
          "addressLineOne": "1 Raffles Place",
          "addressLineTwo": null,
          "city": "Singapore",
          "country": "SG",
          "name": "Akamai Technologies",
          "phone": "89312702",
          "postalCode": "048616",
          "region": "MA",
        },
        "adminContact": {
          "addressLineOne": "1 Raffles Place",
          "addressLineTwo": null,
          "city": "Singapore",
          "country": "SG",
          "email": "lynetteleesy@gmail.com",
          "firstName": "Lynette",
          "lastName": "Lee",
          "organizationName": "Akamai",
          "phone": "89312702",
          "postalCode": "048616",
          "region": "MA",
          "title": "Adminstrator"
        },
        "techContact": {
          "addressLineOne": "1 Raffles Place",
          "addressLineTwo": null,
          "city": "Singapore",
          "country": "SG",
          "email": "lleesiyi@akamai.com",
          "firstName": "Lynette",
          "lastName": "Lee",
          "organizationName": "Akamai",
          "phone": "89312702",
          "postalCode": "048616",
          "region": "MA",
          "title": "Solution Engineer"
        },
      },
      qs: {
        "accountSwitchKey": switchkey,
        "contractId": contractid
        //   "contractId": "V-434SAU2"
        // "accountSwitchKey": inputId
      },

    })
    eg.send(function (error, response, body) {
      if (error) {
        console.log("Error occurred: ", error)
      }
      response = JSON.parse(body)
      resolve(response)
    });

  })
}

function update_enrollment(switchkey, enrollmentId) {
  return new Promise((resolve, reject) => {
    eg.auth({
      path: `/cps/v2/enrollments/${enrollmentId}`,
      method: 'PUT',
      headers: {
        "Content-Type": "application/vnd.akamai.cps.enrollment.v12+json",

        "Accept": "application/vnd.akamai.cps.enrollment-status.v1+json"
      },
      body: {
        "certificateType": "san",
        "changeManagement": false,
        "enableMultiStackedCertificates": false,
        "networkConfiguration": {
          "geography": "core",
          "quicEnabled": false,
          "secureNetwork": "standard-tls",
          "sniOnly": true,
          "disallowedTlsVersions": [
            "TLSv1",
            "TLSv1_1"
          ],
          "dnsNameSettings": {
            "cloneDnsNames": true,
            "dnsNames": ["woocommerce.yinpok.com"]
          },
        },

        "ra": "lets-encrypt", // lets-encrypt 
        "csr": {
        "c": "US",
        "cn": "woocommerce.yinpok.com",
        "l": "Cambridge",
        "o": "Akamai",
        "ou": "WebEx",
        "preferredTrustChain": "dst-root-ca-x3",
        "st": "MA",
        "sans": [
            "woocommerce.yinpok.com",
        ]
    },
        "validationType": "dv",
        "signatureAlgorithm":"SHA-256",
        "pendingChanges": [
          {
            "changeType": "new-certificate",
            "location": "/cps/v2/enrollments/10001/changes/10002"
          },
        ],
        "org": {
          "addressLineOne": "1 Raffles Place",
          "addressLineTwo": null,
          "city": "Singapore",
          "country": "SG",
          "name": "Akamai Technologies",
          "phone": "89312702",
          "postalCode": "048616",
          "region": "MA",
        },
        "adminContact": {
          "addressLineOne": "35 Prince George's Park",
          "addressLineTwo": null,
          "city": "Singapore",
          "country": "SG",
          "email": "lynetteleesy@gmail.com",
          "firstName": "Si Ying",
          "lastName": "Lee",
          "organizationName": "Akamai",
          "phone": "89312702",
          "postalCode": "048616",
          "region": "MA",
          "title": "Adminstrator"
        },
        "techContact": {
          "addressLineOne": "1 Raffles Place",
          "addressLineTwo": null,
          "city": "Singapore",
          "country": "SG",
          "email": "lleesiyi@akamai.com",
          "firstName": "Lynette",
          "lastName": "Lee",
          "organizationName": "Akamai",
          "phone": "89312702",
          "postalCode": "048616",
          "region": "MA",
          "title": "Solution Engineer"
        },
      },
      qs: {
        "accountSwitchKey": switchkey,
        "allow-staging-bypass": true,
        "allow-cancel-pending-changes": true,
        "force-renewal": false
        // "accountSwitchKey": inputId
      },
    })
    eg.send(function (error, response, body) {
      if (error) {
        console.log("Error occurred: ", error)
      }
      response = JSON.parse(body)
      resolve(response)
    });

  })
}

function delete_enrollment(switchkey, enrollmentId) {
  return new Promise((resolve, reject) => {
    eg.auth({
      path: `/cps/v2/enrollments/${enrollmentId}`,
      method: 'DELETE',
      headers: {
        "Accept": "application/vnd.akamai.cps.enrollment-status.v1+json"
      },
      qs: {
        "accountSwitchKey": switchkey,
        "allow-cancel-pending-changes": true,
        // "accountSwitchKey": inputId
      },
    })
    eg.send(function (error, response, body) {
      if (error) {
        console.log("Error occurred: ", error)
      }
      response = JSON.parse(body)
      console.log(response)
      resolve(response)
    });

  })
}

module.exports = { list_contracts, list_enrollments, create_enrollment, update_enrollment, delete_enrollment }

