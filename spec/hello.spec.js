describe("Hello World Suite", function() {
    it("check if text is 'Hello World with Express'", function(done) {
        let text = "Hello World with Express";
        expect(text).toBe("Hello World with Express");
        done();
    });
   it("check if another text is 'Hello World'", function(done) {
        let text = "Hello World with Express";
        expect(text).toBe("Hello World with Express");
        done();
    });
});