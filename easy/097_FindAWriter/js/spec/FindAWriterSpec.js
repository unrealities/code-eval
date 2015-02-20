describe("Decode", function() {
    it("decodes a string give an array cypher of numbers to Stephen King 1947", function() {
        parse("osSE5Gu0Vi8WRq93UvkYZCjaOKeNJfTyH6tzDQbxFm4M1ndXIPh27wBA rLclpg| 3 35 27 62 51 27 46 57 26 10 46 63 57 45 15 43 53");
        expect(decode(str, num)).toEqual("Stephen King 1947");
    });
    it("decodes a string give an array cypher of numbers to Kyotaro Nishimura 1930", function() {
        parse("3Kucdq9bfCEgZGF2nwx8UpzQJyHiOm0hoaYP6ST1WM7Nks5XjrR4IltBeDLV vA| 2 26 33 55 34 50 33 61 44 28 46 32 28 30 3 50 34 61 40 7 1 31");
        expect(decode(str, num)).toEqual("Kyotaro Nishimura 1930");
    });
});