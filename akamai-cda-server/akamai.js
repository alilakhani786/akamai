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
      path: '/identity-management/v3/user-profile',
      method: 'GET',
      headers: {},
      body: data
    });

    eg.send(function(error, response, body) {
      if (error) {
        reject(error);
      } else {
        resolve(body)
      }
    });

  })
  
}

module.exports = {getUserProfile}

