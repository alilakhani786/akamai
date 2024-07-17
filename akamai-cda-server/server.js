const express = require('express')
const cors = require('cors')
const {getUserProfile} = require('./akamai')
const app = express()
app.use(cors())

const EdgeGrid = require('akamai-edgegrid');

var data = 'bodyData';

// Supply the path to your .edgerc file and name
// of the section with authorization to the client
// you are calling (default section is 'default')
const eg = new EdgeGrid({
  path: './.edgerc',
  section: 'default'
});

app.get('/', (req, res) => {
    res.send('Hello, Lynette!');
});
app.get('/akamai', (req, res) => {
    getUserProfile().then(data => {
        res.send(data);
    })
    .catch(error => {
        console.error('Error fetching user profile:', error);
        res.json({ error: error.message });
    });
});


app.listen(3000, () => {
    console.log('Server listening on port 3000');
});