const http = require('http');
const fs = require('fs');
const path = require('path');

// Configurações do servidor
const hostname = '127.0.0.1';
const port = 3000;

// Caminho base da pasta inicial (ATOS)
const baseDir = path.resolve(__dirname, '../');

// Criação do servidor
const server = http.createServer((req, res) => {
    const cleanUrl = req.url.split('?')[0];
    const filePath = path.join(baseDir, cleanUrl === '/' ? 'index.html' : cleanUrl);

    // Verifica se o arquivo solicitado está dentro da pasta inicial
    if (!filePath.startsWith(baseDir)) {
        res.writeHead(403, { 'Content-Type': 'text/plain' });
        res.end('403 - Acesso proibido');
        return;
    }

    // Lê o arquivo solicitado
    fs.readFile(filePath, (err, data) => {
        if (err) {
            if (err.code === 'ENOENT') {
                res.writeHead(404, { 'Content-Type': 'text/plain' });
                res.end('404 - Arquivo não encontrado');
            } else {
                res.writeHead(500, { 'Content-Type': 'text/plain' });
                res.end('500 - Erro interno do servidor');
            }
        } else {
            // Responde com o conteúdo do arquivo
            res.writeHead(200); // Sem especificar MIME, o navegador tratará automaticamente
            res.end(data);
        }
    });
});

// Inicia o servidor
server.listen(port, hostname, () => {
    console.log(`Servidor rodando em http://${hostname}:${port}/`);
});
