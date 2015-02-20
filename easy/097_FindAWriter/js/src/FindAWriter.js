var fs  = require("fs");
fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line !== "") {
        parse(line);
        console.log(decode(str, num));
    }
});

function parse(input) {
    var split = input.split("| ");
    str = split[0].split("");
    num = split[1].split(" ");
}

function decode(str, num) {
    var msg = "";
    for (var i = 0; i < num.length; i++) {
        msg += str[num[i]-1];
    }
    return msg;
}
