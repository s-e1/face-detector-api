const handleSignin = (req, res, db, bcrypt) => {
    // const handleSignin = (db, bcrypt) => (req, res) => {
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
}

module.exports = { handleSignin }