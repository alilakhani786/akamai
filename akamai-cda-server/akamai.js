const EdgeGrid = require('akamai-edgegrid');

var data = 'bodyData';

// Supply the path to your .edgerc file and name
// of the section with authorization to the client
// you are calling (default section is 'default')
const eg = new EdgeGrid({
  path: './.edgerc',
  section: 'default'
});

function property_hostname(inputId) {
  return new Promise((resolve, reject) => {
    eg.auth({
      path: '/papi/v1/hostnames',
      method: 'GET',
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      qs: {
        "accountSwitchKey": inputId
      },

    })

    eg.send(function(error, response, body) {
      response = JSON.parse(body)
      // console.log(response)
      resolve(response)
    });

  })
}

function appsec_config(inputId) {
  return new Promise((resolve, reject) => {
    eg.auth({
      path: '/appsec/v1/configs',
      method: 'GET',
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      qs: {
        "accountSwitchKey": inputId
      },

    })

    eg.send(function(error, response, body) {
      response = JSON.parse(body)
      // console.log(response)
      resolve(response)
    });

  })
}

module.exports = {property_hostname, appsec_config}

