

const connect = require('../db_connect.js');

exports.updateOrderStatus = (status, id, cb) => {
  const sql = `UPDATE orders SET status = '${status}' WHERE id=${id}`;

  connect.query(sql, (err, result) => {
    if (err) return cb(new Error(err));
    cb(result);
  });
};


exports.updateDeliveryTime = (deliveryTime, id, cb) => {
  const sql = `UPDATE orders SET deliveryTime = '${deliveryTime}' WHERE id=${id}`;

  connect.query(sql, (err, result) => {
    if (err) return cb(new Error(err));
    cb(result);
  });
};
