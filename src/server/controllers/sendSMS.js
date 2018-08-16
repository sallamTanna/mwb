const sendSMS = (from, body, to, cb) => {
  const accountSid = process.env.accountSid;
  const authToken = process.env.authToken;
  const client = require('twilio')(accountSid, authToken);

  console.log('inputs', from, body || 'message unrecognizables', to || '+970567716309');
  client.messages
    .create({
      from,
      body,
      to,
    })
    .then(message => cb(null, message.sid))
    .catch(err => cb(err))
    .done();
};

module.exports = {
  sendSMS,
};
