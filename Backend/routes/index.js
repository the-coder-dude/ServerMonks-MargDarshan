const express = require("express");
const actions = require("../methods/actions");
//const search = require('../methods/search')
const router = express.Router();

router.get("/", (req, res) => {
  res.send("This API is working");
});

// Adding new user
// POST /adduser
router.post("/adduser", actions.addNew);

//Authenticate a user
// POST /authenticate
router.post("/authenticate", actions.authenticate);

// Get info on a user
// GET /getinfo
router.get("/getinfo", actions.getinfo);

module.exports = router;
