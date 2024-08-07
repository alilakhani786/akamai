const EdgeGrid = require('akamai-edgegrid');

var data = 'bodyData';

// Supply the path to your .edgerc file and name
// of the section with authorization to the client
// you are calling (default section is 'default')
const eg = new EdgeGrid({
  path: './.edgerc',
  section: 'default'
});

function list_contracts() {
  return new Promise((resolve, reject) => {
    eg.auth({
      path: '/papi/v1/contracts',
      method: 'GET',
      headers: {
        "Accept": "application/json",
      },
      qs: {
        "accountSwitchKey" : "B-V-43575RT:1-8BYUX"
        // "accountSwitchKey": inputId
      },

    })

    eg.send(function(error, response, body) {
      response = JSON.parse(body)
      // console.log(response)
      resolve(response)
    });

  })
}

function list_enrollments(id) {
    return new Promise((resolve, reject) => {
      eg.auth({
        path: '/cps/v2/enrollments',
        method: 'GET',
        headers: {
        //   "Accept": "application/vnd.akamai.cps.active-certificates.v1+json"
          "Accept": 'application/vnd.akamai.cps.enrollments.v11+json'
        },
        
        qs: {
          "accountSwitchKey" : "B-V-43575RT:1-8BYUX",
          "contractId": id 
        //   "contractId": "V-434SAU2"
          // "accountSwitchKey": inputId
        },
  
      })
  
      eg.send(function(error, response, body) {
        response = JSON.parse(body)
        // console.log(response)
        resolve(response)
      });
  
    })
  }

module.exports = {list_contracts, list_enrollments}

