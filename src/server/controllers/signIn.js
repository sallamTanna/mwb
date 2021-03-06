const bcrypt = require('bcrypt');
const dbQuery = require('../model/queries/genericQuery');

module.exports = (req, res) => {
  const { fullName, password, keepLogin } = req.body;
  if (!req.body.fullName
      || req.body.fullName === '') return res.send({ message: 'Please full in all the data fields' });
  if (!req.body.password
      || req.body.password === '') return res.send({ message: 'Please full in all the data fields' });

  const sql = {
    text: 'SELECT * FROM users WHERE full_name = $1',
    values: [fullName],
  };
  return dbQuery(sql).then((result) => {
    if (result.rows.length === 0) return res.send({ message: 'Invalid username or password' });
    if (result.rows[0].full_name !== fullName) return res.send({ message: 'Invalid username or password' });
    return bcrypt.compare(password, result.rows[0].password).then((comparison) => {
      if (!comparison) {
        res.clearCookie('session', { httpOnly: true, signed: true });
        return res.send({ message: 'invalid username or password' });
      }
      if (comparison) {
        if (keepLogin === 'on') {
          res.cookie(
            'session',
            {
              loggedIn: true,
              secretMessage: 'this cookie is now safely signed',
            },
            {
              httpOnly: true,
              signed: true,
              maxAge: 9999999,
            },
          );
        }
        if (keepLogin !== 'on') {
          res.cookie(
            'session',
            {
              loggedIn: true,
              secretMessage: 'this cookie is now safely signed',
            },
            {
              httpOnly: true,
              signed: true,
            },
          );
        }
      }
      return res.send({ message: 'login successful', user: result.rows[0].full_name, userId: result.rows[0].id });
    }).catch(comparisonError => res.send({ message: 'server error1', body: comparisonError }));
  }).catch((err) => {
    res.send({ message: 'server error2', body: err });
  });
};
