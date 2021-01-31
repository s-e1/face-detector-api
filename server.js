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

// const database = {
//     users: [
//         {
//             id: 123,
//             name: 'John',
//             email: 'john@gmail.com',
//             password: 'cookies',
//             entries: 0,
//             joined: new Date()
//         },
//         {
//             id: 124,
//             name: 'Sally',
//             email: 'sally@gmail.com',
//             password: 'bananas',
//             entries: 0,
//             joined: new Date()
//         }
//     ],
//     login: [
//         {
//             id: 987,
//             hash: '$2b$10$JRYHH.CgsgAQVtjrQ0BJGebyK1O9GxFXWAyBVcHeW91fMtfZ9GW8.',
//             email: 'john@gmail.com'
//         }
//     ]
// }
app.get('/', (req, res) => {
    res.send('success')
    // console.log(database.users);
    // res.send(database.users);
})
// bcrypt.compare('apples', '$2b$10$JRYHH.CgsgAQVtjrQ0BJGebyK1O9GxFXWAyBVcHeW91fMtfZ9GW8.', function (err, result) {
//     // result == true
//     console.log('true', result);
// });
// bcrypt.compare('cookies', '$2b$10$JRYHH.CgsgAQVtjrQ0BJGebyK1O9GxFXWAyBVcHeW91fMtfZ9GW8.', function (err, result) {
//     // result == false
//     console.log('false', result);
// });
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

    // bcrypt.compare(myPlaintextPassword, hash, function (err, result) {
    //     // result == true
    //     console.log('true', result);
    // });
    // bcrypt.compare(someOtherPlaintextPassword, hash, function (err, result) {
    //     // result == false
    //     console.log('false', result);
    // });
    // if (req.body.email === database.users[0].email &&
    //     req.body.password === database.users[0].password
    // ) {
    //     res.json(database.users[0]);
    //     // res.json('success');
    // } else {
    //     res.status(400).json('error logging in');
    // }
})
app.post('/register', (req, res) => {
    const { email, name, password } = req.body;
    const hash = bcrypt.hashSync(password, saltRounds);
    // console.log('hash', hash);
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
                        // })
                    })
            })
            .then(trx.commit)
            .catch(trx.rollback)
    })
        .catch(() => res.status(400).json('unable to register'))

    // db('users')
    //     .returning('*')
    //     .insert({ email, name, joined: new Date() })
    //     .then(user => {
    //         res.json(user[0])
    //     })
    //     .catch(() => res.status(400).json('unable to register'))
    // database.users.push({
    //     id: 125, name, email, password, entries: 0, joined: new Date()
    // })
    // res.json(database.users[database.users.length - 1]);
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
    // const id = parseInt(req.params.id);
    // var found = database.users.find(user => id === user.id);
    // res.json(found || 'no such user');
})
app.put('/image', (req, res) => {
    const { id } = req.body;
    db('users')
        .where({ id })
        // .where('id', '=', id)
        .increment('entries', 1)
        .returning('entries')
        .then(entries => {
            res.json(entries[0])
        })
        .catch(() => res.status(400).json('Unable to get entries'))

    // const id = parseInt(req.body.id);
    // var found = database.users.find(user => id === user.id);
    // if (found) {
    //     found.entries++;
    //     res.json(found.entries);
    // } else {
    //     res.status(404).json('no such user');
    // }
})

app.listen(3001, () => {
    console.log('app is running at port 3001');
})