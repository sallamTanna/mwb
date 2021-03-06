const update = require('../model/queries/update');
const select = require('../model/queries/select');
const { sendSMS } = require('./sendSMS');

const updateDeliveryTime = (req, res) => {
  const {
    newDeliveryTime,
  } = req.body;
  const id = req.body.orderId;

  update.updateDeliveryTime(newDeliveryTime, id, (err, result) => {
    if (err) return res.json({ status: false, error: err });

    select.selectOneUser(result.rows[0].user_id, (err, result1) => {
      if (err) return res.json({ status: false, error: err });
      const targetPhone = result1.rows[0].phone;

      const ChangedTime = result.rows[0].delivery_date;

      sendSMS('+17192203059', `your order date has changed to: ${ChangedTime}`, targetPhone, (err, done) => {
        if (err) return res.json({ status: false, error: err });

        res.send({
          status: true,
          message: 'the data was updated successfully',
          data: result,
          smsResult: done,
        });
      });
    });
  });
};

module.exports = {
  updateDeliveryTime,
};
