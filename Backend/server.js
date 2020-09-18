const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.send("This API is working!");
});

const PORT = process.env.PORT || 3000;

app.listen(
  PORT,
  console.log(`Server running in ${process.env.NODE_ENV} mode on port ${PORT}`)
);
