const express = require("express");
const app = express();
const port = 3000;
const cors = require("cors");

const io = require("socket.io")(4000, {
  cors: {
    origin: "*",
  },
});

io.on("connection", (socket) => {
  console.log("connected from" + socket.id);
  socket.on("username", (username) => {
    console.log(username);
  });
  socket.on("score", (score) => {
    console.log(score);
  });
});

const categoriesRouter = require("./routes/categories");
const questionsRouter = require("./routes/questions");

app.use(cors());

app.use(express.json());
app.use(
  express.urlencoded({
    extended: true,
  })
);

app.use("/categories", categoriesRouter);
app.use("/questions", questionsRouter);

app.use((err, req, res, next) => {
  const statusCode = err.statusCode || 500;
  console.error(err.message, err.stack);
  res.status(statusCode).json({ message: err.message });
  return;
});
app.listen(port, () => {
  console.log(`Listening at http://localhost:${port}`);
});
