var mongoose = require("mongoose");
var Schema = mongoose.Schema;

var mentorSchema = new Schema({
  name: {
    type: String,
    require: true,
  },
  college: {
    type: String,
    require: true,
  },
  gender: {
    type: String,
    require: true,
  },
});
module.exports = mongoose.model("Mentor", mentorSchema);
