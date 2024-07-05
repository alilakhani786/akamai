const express = require("express");
const path = require('path');
const app = express();

app.use(express.static(path.join(__dirname, 'public')));
// const home = express.static(path.join(__dirname, 'views'));
app.set('view engine', 'pug')

// app.get('/', (req, res) => {
//     // res.render('home', {
//     //   title: 'Akamai CDA Portal',
//     // });
//     res.send("Hello from Akamai")
//   });

app.get('*', (req, res) => {
    res.sendFile(path.join(__dirname, 'public/index.html'))
})

const server = app.listen(process.env.PORT || 3001, () => {
    console.log(`CDA server started on port: ${server.address().port}`);
});