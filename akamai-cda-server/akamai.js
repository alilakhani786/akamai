const EdgeGrid = require('akamai-edgegrid');

var data = 'bodyData';

// Supply the path to your .edgerc file and name
// of the section with authorization to the client
// you are calling (default section is 'default')
const eg = new EdgeGrid({
  path: './.edgerc',
  section: 'default'
});

function getUserProfile() {
  return new Promise((resolve, reject) => {
    eg.auth({
      path: '/contract-api/v1/reportingGroups/',
      method: 'GET',
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      qs: {
        "accountSwitchKey" : "B-V-43575RT:1-8BYUX"
      },

    })

    eg.send(function(error, response, body) {
      // if (error) {
      //   reject(error);
      // } else {
      //   resolve(body)
      // }
      // console.log(JSON.stringify(JSON.parse(body), null, 2))
      response = JSON.parse(body)
      console.log(response)
      active = []

      for (const item in response) {
        if (response[item].status == "active") {
          active.push(response[item])
        }
      }
      // console.log(active)
      // // console.log(JSON.stringify(JSON.parse(active), null, 2))
      resolve(active)
    });

  })
  
}

module.exports = {getUserProfile}

