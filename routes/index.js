var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.get('/projects', function(req, res, next) {
  res.render('projects', { title: 'Express' });
});

router.get('/projects/drum', function(req, res, next) {
  res.render('drum_description', { title: 'Express' });
});

router.get('/projects/drumgame', function(req, res, next) {
  res.render('drum_game', { title: 'Express' });
});

//router.get('/blog', function(req, res, next) {
//  res.render('blog', { title: 'Express' });
//});

module.exports = router;
