var request = require("request");

var base_url = "http://<your public IP>:4000/"
var api_base_url = "http://<your public IP>:4000/api"


let Message = {
    status:'',
    message:''
 };

describe("API Exists", function() {
    describe("GET /api", function() {
        it("returns status code 200", function(done) {
            request.get(base_url, function(error, response, body) {
            expect(response.statusCode).toBe(200);
            done();
            });
        });
        it("API Response should be valid json", function(done) {
            request.get(api_base_url, function(error, response, body) {
                expect(() => {
                    JSON.parse(body);
                }).not.toThrow();
                done();
            });
        });
    });
});