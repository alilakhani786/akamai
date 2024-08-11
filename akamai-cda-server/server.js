const express = require('express')
const cors = require('cors')
const {property_card} = require('./business_logic')
const {list_certs, create_cert, modify_cert} = require('./cert_business_logic')
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
app.get('/listcert', async(req, res) => {
    const inputId = req.query.id;
    if(true) {
        certs = await list_certs()
        res.send(certs)
    } else {
        res.status(400).json({error: "No switchkey provided"})
    }
});

app.get('/createcert', async(req, res) => {
    const inputId = req.query.id;
    if(true) {
        cert = await create_cert()
        console.log(cert)
        res.send(cert)
    } else {
        res.status(400).json({error: "No switchkey provided"})
    }
});

app.get('/modifycert', async(req, res) => {
    // get enrollmentId from path
    if(true) {
        res = await modify_cert(226941)
        console.log(res)
        res.send(res)
    } else {
        res.status(400).json({error: "No switchkey provided"})
    }
});

app.listen(3000, () => {
    console.log('Server listening on port 3000');
});