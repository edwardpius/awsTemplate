// Filename: api-routes.js
// Initialize express router
let router = require('express').Router();
// Set default API response
router.get('/', function (req, res) {
    res.json({
       message: 'Automation for the People',
       timestamp: new Date().getTime()
    });
});
// Export API routes
module.exports = router;