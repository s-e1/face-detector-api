const handleRegister = (req, res, db, bcrypt, saltRounds) => {
    const { email, name, password } = req.body;
    if (!email || !name || !password) {
        return res.status(400).json('fill all fields')
    }
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
}
module.exports = {
    handleRegister
}