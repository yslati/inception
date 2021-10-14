const http = require('http');
const fs = require('fs');
const path = require('path');

const server = http.createServer((req, res) => {
	const filepath = path.join(__dirname, '.', 'index.html');
	const rslt = fs.readFileSync(filepath, { encoding: 'utf-8' });
	res.setHeader('Content-Type', 'text/html');
	res.writeHead(200).end(rslt);
});
server.listen(9000);
