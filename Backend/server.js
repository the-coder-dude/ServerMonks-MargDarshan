const express = require("express");
const morgan = require("morgan");
const cors = require("cors");
const connectDB = require("./config/db");
const passport = require("passport");
const bodyParser = require("body-parser");
const routes = require("./routes/index");
var Mentor = require("./models/mentors");

connectDB();

const app = express();

if (process.env.NODE_ENV === "development") {
  app.use(morgan("dev"));
}

app.use(cors());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(routes);
app.use(passport.initialize());
require("./config/passport")(passport);

require("dotenv").config();

app.get("/", (req, res) => {
  res.send("This API is working!");
});

app.get("/search/:college", async (req, res) => {
  //const searchedField = req.query.name;

  var regex = new RegExp(req.params.college, "i"); // enter college name, both big and small alphabets are acceptable
  await Mentor.find({ college: regex }) //searching in mentor database
    .then((data) => {
      res.status(200).json(data); //displaying the data of mentors based on college
      console.log(data);
    })
    .catch((e) => console.error(e));
});

app.post("/sendrequest", async (req, res) => {
  const accountSid = process.env.TWILIO_ACC;
  const authToken = process.env.TWILIO_AUTH;
  const client = require("twilio")(accountSid, authToken);

  client.messages
    .create({
      body:
        "Dear Mentor, there is a student request pending, please give a reply ASAP on MargDarshan App",
      from: "+13345085019",
      to: "+919039365952",
    })
    .then((message) => res.status(500).send("SMS sent!"));
});

const PORT = process.env.PORT || 3000;

app.listen(
  PORT,
  console.log(`Server running in ${process.env.NODE_ENV} mode on port ${PORT}`)
);
