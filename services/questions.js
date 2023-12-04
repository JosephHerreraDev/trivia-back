const db = require("./db");
const helper = require("../helper");
const config = require("../config");

async function getMultiple(category = "Ciencia") {
  const rows = await db.query(
    `select * from pregunta_respuestas where nombre = ` + "'" + category + "'"
  );

  return {
    rows,
  };
}

module.exports = {
  getMultiple,
};
