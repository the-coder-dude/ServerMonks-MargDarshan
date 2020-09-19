const app = require("express")();
const http = require("http").createServer(app);
const io = require("socket.io")(http);

app.get("/", (req, res) => {
  res.send("This API is working");
});

io.on("connection", (socket) => {
  //joining the student with mentor
  chatID = socket.handshake.query.chatID;
  socket.join(chatID);

  //closing socket when student/mentor leaves
  socket.on("disconnect", () => {
    socket.leave(chatID);
  });

  //Sending message from mentor to student or vice-versa
  socket.on("send_message", (message) => {
    receiverChatID = message.receiverChatID;
    senderChatID = message.senderChatID;
    content = message.content;

    //Sending message inside one room
    socket.in(receiverChatID).emit("receive_message", {
      content: content,
      senderChatID: senderChatID,
      receiverChatID: receiverChatID,
    });
  });
});

http.listen(8080);
