const express = require('express')
const cors = require('cors')
const {property_card} = require('./business_logic')
const {list_certs} = require('./cert_business_logic')
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
        card_details = await property_card(inputId)
        //res.send might send multiple card details in future
        res.send(card_details)
    } else {
        res.status(400).json({error: "No switchkey provided"})
    }
});
app.get('/test', async(req, res) => {
    const inputId = req.query.id;
    if(true) {
        contracts = await list_certs()
        console.log(contracts)
        //res.send might send multiple card details in future
        res.send(contracts)
    } else {
        res.status(400).json({error: "No switchkey provided"})
    }
});

app.listen(3000, () => {
    console.log('Server listening on port 3000');
});