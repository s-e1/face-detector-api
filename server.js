const express = require('express');
const bcrypt = require('bcrypt');
const cors = require('cors');
const { handleRegister } = require('./controllers/register');
const { handleSignin } = require('./controllers/signin');
const { handleProfile } = require('./controllers/profile');
const { handleImage } = require('./controllers/image');

const db = require('knex')({
    client: 'pg',
    connection: {
        host: '127.0.0.1',
        user: 'postgres',
        password: 'test',
        database: 'face_detector'
    }
});
const saltRounds = 10;

const app = express();
app.use(express.json());
app.use(cors());

app.get('/', (req, res) => res.json('success'));
app.post('/register', (req, res) => handleRegister(req, res, db, bcrypt, saltRounds));
// app.post('/signin', handleSignin(db, bcrypt) )
app.post('/signin', (req, res) => handleSignin(req, res, db, bcrypt));
app.get('/profile/:id', (req, res) => handleProfile(req, res, db));
app.put('/image', (req, res) => handleImage(req, res, db));

app.listen(3001, () => {
    console.log('app is running at port 3001');
})