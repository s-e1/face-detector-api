const express = require('express');
const bcrypt = require('bcrypt');
const cors = require('cors');
const db = require('knex')({
    client: 'pg',
    connection: {
        host: '127.0.0.1',
        user: 'postgres',
        password: 'test',
        database: 'face_detector'
    }
});
const app = express();
app.use(express.json());
app.use(cors());

const saltRounds = 10;

app.get('/', (req, res) => {
    res.send('success');
})

app.post('/signin', (req, res) => {
    db('login').select('email', 'hash')
        .where('email', '=', req.body.email)
        .then(data => {
            const isValid = bcrypt.compareSync(req.body.password, data[0].hash);
            if (isValid) {
                return db('users').select('*')
                    .where('email', '=', req.body.email)
                    .then(user => {
                        res.json(user[0])
                    })
                    .catch(() => res.status(400).json('unable to get user'))
            } else {
                res.status(400).json('wrong credentials')
            }
        })
        .catch(() => res.status(400).json('wrong credentials'))
})
app.post('/register', (req, res) => {
    const { email, name, password } = req.body;
    const hash = bcrypt.hashSync(password, saltRounds);
    db.transaction(trx => {
        trx
            .insert({ hash, email })
            .into('login')
            .returning('email')
            .then(loginEmail => {
                return trx('users')
                    .returning('*')
                    .insert({ email: loginEmail[0], name, joined: new Date() })
                    .then(user => {
                        res.json(user[0])
                    })
            })
            .then(trx.commit)
            .catch(trx.rollback)
    })
        .catch(() => res.status(400).json('unable to register'))
})
app.get('/profile/:id', (req, res) => {
    const { id } = req.params;
    db('users')
        .select('*').where({ id })
        .then(user => {
            if (user.length) {
                res.json(user[0])
            } else {
                res.status(400).json('Not found')
            }
        })
        .catch(() => res.status(400).json('Error getting user'))
})
app.put('/image', (req, res) => {
    const { id } = req.body;
    db('users')
        .where({ id })
        .increment('entries', 1)
        .returning('entries')
        .then(entries => {
            res.json(entries[0])
        })
        .catch(() => res.status(400).json('Unable to get entries'))
})

app.listen(3001, () => {
    console.log('app is running at port 3001');
})