const express = require("express");
const router = express.Router();
const questions = require("../services/questions");

/* GET questions. */
router.get("/:name", async function (req, res, next) {
  try {
    res.json(await questions.getMultiple(req.params.name));
  } catch (err) {
    console.error(`Error while getting questions `, err.message);
    next(err);
  }
});

module.exports = router;
