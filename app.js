if (process.env.NODE_ENV !== "production") {
  require("dotenv").config();
}

const express = require("express");
const path = require("path");
const ejsMate = require("ejs-mate");

const app = express();
app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));
app.engine("ejs", ejsMate);
app.use(express.static(path.join(__dirname, "public")));

// Routes
app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.get("/index", async (req, res) => {
  let news = await getNewsHome();
  res.render("./pages/index.ejs", {
    news: news.articles,
  });
});
// Categories Routes

app.get("/sports", async (req, res) => {
  let news = await getNewsCat("sports");
  res.render("./pages/index.ejs", {
    news: news.articles,
  });
});
app.get("/entertainment", async (req, res) => {
  let news = await getNewsCat("entertainment");
  res.render("./pages/index.ejs", {
    news: news.articles,
  });
});
app.get("/technology", async (req, res) => {
  let news = await getNewsCat("technology");
  res.render("./pages/index.ejs", {
    news: news.articles,
  });
});
app.get("/business", async (req, res) => {
  let news = await getNewsCat("business");
  res.render("./pages/index.ejs", {
    news: news.articles,
  });
});
app.get("/health", async (req, res) => {
  let news = await getNewsCat("health");
  res.render("./pages/index.ejs", {
    news: news.articles,
  });
});

app.get("/about", (req, res) => {
  res.render("./pages/about.ejs");
});
app.get("/owner", (req, res) => {
  res.render("./pages/owner.ejs");
});
app.get("/more", (req, res) => {
  res.render("./pages/more.ejs");
});

const getNewsHome = async () => {
  const url = `https://newsapi.org/v2/everything?domains=wsj.com&apiKey=${process.env.NEWS_API_KEY}`;
  const response = await fetch(url);
  const data = await response.json();
  return data;
};
const getNewsCat = async (category) => {
  const url = `https://newsapi.org/v2/top-headlines?country=us&category=${category}&apiKey=${process.env.NEWS_API_KEY}`;
  const response = await fetch(url);
  const data = await response.json();
  return data;
};

const PORT = 8080;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
