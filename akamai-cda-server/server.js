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
    const inputId = req.query.id;
    if(inputId) {
        getUserProfile(inputId).then(data => {
            res.send(data);
        })
    } else {
        res.status(400).json({error: "No switchkey provided"})
    }
});


app.listen(3000, () => {
    console.log('Server listening on port 3000');
});