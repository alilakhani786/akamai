const express = require('express')
const cors = require('cors')
const {count_property, property_details} = require('./business_logic')
const app = express()
app.use(cors())


// Supply the path to your .edgerc file and name
// of the section with authorization to the client
// you are calling (default section is 'default')
app.get('/', (req, res) => {
    res.send('Hello, Lynette!');
});
app.get('/akamai', async(req, res) => {
    const inputId = req.query.id;
    if(inputId) {
        // count_property(inputId).then(data => {
        //     res.send(data);
        // })
        card_details = await count_property(inputId)
        res.send({card_details})
    } else {
        res.status(400).json({error: "No switchkey provided"})
    }
});


app.listen(3000, () => {
    console.log('Server listening on port 3000');
});