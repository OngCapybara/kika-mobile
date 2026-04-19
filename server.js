const http = require('http');
const { URL } = require('url');

const PORT = process.env.PORT || 3000;

const beaches = [
  {
    id: 1,
    name: 'Pantai Koka',
    location: 'Flores Timur',
    description: 'Pantai pasir putih dengan pemandangan bukit yang indah.'
  },
  {
    id: 2,
    name: 'Pantai Nihiwatu',
    location: 'Sumba Barat',
    description: 'Pantai eksotis dengan ombak yang cocok untuk surfing.'
  },
  {
    id: 3,
    name: 'Pantai Pink',
    location: 'Labuan Bajo',
    description: 'Pantai unik dengan pasir berwarna merah muda.'
  }
];

const users = [];

function parseJsonBody(req) {
  return new Promise((resolve, reject) => {
    let body = '';

    req.on('data', (chunk) => {
      body += chunk;
    });

    req.on('end', () => {
      if (!body) {
        return resolve({});
      }

      try {
        const parsed = JSON.parse(body);
        resolve(parsed);
      } catch (error) {
        reject(new Error('Body JSON tidak valid'));
      }
    });

    req.on('error', () => {
      reject(new Error('Gagal membaca body request'));
    });
  });
}

function sendJson(res, statusCode, data) {
  res.writeHead(statusCode, {
    'Content-Type': 'application/json; charset=utf-8',
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET,POST,OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type'
  });
  res.end(JSON.stringify(data));
}

const server = http.createServer(async (req, res) => {
  if (req.method === 'OPTIONS') {
    res.writeHead(204, {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET,POST,OPTIONS',
      'Access-Control-Allow-Headers': 'Content-Type'
    });
    return res.end();
  }

  const url = new URL(req.url, `http://${req.headers.host}`);

  if (req.method === 'GET' && url.pathname === '/') {
    return sendJson(res, 200, {
      message: 'Backend berjalan',
      endpoints: ['/api/health', '/api/beaches']
    });
  }

  if (req.method === 'GET' && url.pathname === '/api/health') {
    return sendJson(res, 200, {
      status: 'ok',
      serverTime: new Date().toISOString()
    });
  }

  if (req.method === 'GET' && url.pathname === '/api/beaches') {
    return sendJson(res, 200, beaches);
  }

  if (req.method === 'POST' && url.pathname === '/api/register') {
    try {
      const { name, email, password } = await parseJsonBody(req);

      if (!name || !email || !password) {
        return sendJson(res, 400, {
          message: 'Nama, email, dan password wajib diisi'
        });
      }

      const normalizedEmail = String(email).toLowerCase().trim();
      const existingUser = users.find((user) => user.email === normalizedEmail);

      if (existingUser) {
        return sendJson(res, 409, { message: 'Email sudah terdaftar' });
      }

      const newUser = {
        id: users.length + 1,
        name: String(name).trim(),
        email: normalizedEmail,
        password: String(password)
      };

      users.push(newUser);

      return sendJson(res, 201, {
        message: 'Registrasi berhasil',
        user: {
          id: newUser.id,
          name: newUser.name,
          email: newUser.email
        }
      });
    } catch (error) {
      return sendJson(res, 400, { message: error.message });
    }
  }

  if (req.method === 'POST' && url.pathname === '/api/login') {
    try {
      const { email, password } = await parseJsonBody(req);

      if (!email || !password) {
        return sendJson(res, 400, { message: 'Email dan password wajib diisi' });
      }

      const normalizedEmail = String(email).toLowerCase().trim();
      const user = users.find((item) => item.email === normalizedEmail);

      if (!user || user.password !== String(password)) {
        return sendJson(res, 401, { message: 'Email atau password salah' });
      }

      return sendJson(res, 200, {
        message: 'Login berhasil',
        user: {
          id: user.id,
          name: user.name,
          email: user.email
        }
      });
    } catch (error) {
      return sendJson(res, 400, { message: error.message });
    }
  }

  return sendJson(res, 404, { message: 'Endpoint tidak ditemukan' });
});

server.listen(PORT, () => {
  console.log(`Server backend berjalan di http://localhost:${PORT}`);
  console.log('Jalankan dengan command: node server.js');
});
