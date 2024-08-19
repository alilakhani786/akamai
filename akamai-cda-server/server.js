const express = require('express')
const cors = require('cors')
const {property_card} = require('./business_logic')
const {list_certs, create_cert, modify_cert, delete_cert} = require('./cert_business_logic')
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
    if(inputId) {
        certs = await list_certs(inputId)
        res.send(certs)
    } else {
        res.status(400).json({error: "No switchkey provided"})
    }
});

app.get('/createcert', async(req, res) => {
    const inputId = req.query.id;
    if(inputId) {
        cert = await create_cert(inputId)
        res.send(cert)
    } else {
        res.status(400).json({error: "No switchkey provided"})
    }
});

app.get('/modifycert', async(req, res) => {
    const inputId = req.query.id;
    const enrollmentId = req.query.enrollmentId;
    if(enrollmentId) {
        changes = await modify_cert(inputId, enrollmentId)
        console.log(res.statusCode, ": ", changes)
        res.send(changes)
    } else {
        res.status(400).json({error: "Switchkey or EnrollmentId is not provided"})
    }
});

app.get('/deletecert', async(req, res) => {
    const inputId = req.query.id;
    const enrollmentId = req.query.enrollmentId;
    if(enrollmentId) {
        changes = await delete_cert(inputId, enrollmentId)
        res.send(changes)
    } else {
        res.status(400).json({error: "Switchkey or EnrollmentId is not provided"})
    }
});

app.listen(3000, () => {
    console.log('Server listening on port 3000');
});