//server.js
const app = require('./app.js');

app.set('port', process.env.PORT || 8080);

const server = app.listen(app.get('port'), () => {
    console.log(`Product service is listening on 
    ${server.address().port}`);
});