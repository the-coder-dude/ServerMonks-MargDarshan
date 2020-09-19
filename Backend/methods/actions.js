var User = require("../models/user");
var jwt = require("jwt-simple");
var config = require("../config/dbconfig");

var functions = {
  addNew: function (req, res) {
    if (!req.body.email || !req.body.password) {
      res.json({ success: false, msg: "Enter all fields" });
    } else {
      var newUser = User({
        email: req.body.email,
        password: req.body.password,
      });
      newUser.save(function (err, newUser) {
        if (err) {
          res.json({ success: false, msg: "Failed to save" });
        } else {
          res.json({ success: true, msg: "Successfully saved" });
        }
      });
    }
  },
  authenticate: function (req, res) {
    User.findOne(
      {
        email: req.body.email,
      },
      function (err, user) {
        if (err) throw err;
        if (!user) {
          res.status(403).send({
            // when the student authentication is unauthorised
            success: false,
            msg: "Authentication Failed, User is not found",
          });
        } else {
          user.comparePassword(req.body.password, function (err, isMatch) {
            //mismatch in students password
            if (isMatch && !err) {
              var token = jwt.encode(user, config.secret);
              res.json({ success: true, token: token });
            } else {
              return res.status(403).send({
                success: false,
                msg: "Authentication failed, wrong password",
              });
            }
          });
        }
      }
    );
  },
  getinfo: function (req, res) {
    //generating login token
    if (
      req.headers.authorization &&
      req.headers.authorization.split(" ")[0] === "Bearer"
    ) {
      var token = req.headers.authorization.split(" ")[1];
      var decodedtoken = jwt.decode(token, config.secret);
      return res.json({ success: true, msg: "Hello " + decodedtoken.email }); //getting students email from database
    } else {
      return res.json({ success: false, msg: "No Headers" });
    }
  },
};

module.exports = functions;
