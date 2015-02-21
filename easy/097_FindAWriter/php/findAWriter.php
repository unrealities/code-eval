<?php
findWriters($argv[1]);

function findWriters($file) {
    $fileToParse = fopen($file, 'r');
    while (!feof($fileToParse)) {
        new findAWriter(fgets($fileToParse));
    }
}

class findAWriter {
    private $inputString = '';
    private $encodedMessage = array();
    private $cipher = array();
    private $decodedMessage = '';

    function __construct($input) {
        $this->inputString = $input;
        $this->parseInput();
        $this->decode();
        $this->printDecodedMessage();
    }

    function parseInput() {
        $splitInput = explode('|', $this->inputString);
        $this->encodedMessage = str_split($splitInput[0]);
        $this->cipher = explode(' ', $splitInput[1]);
    }
    
    function decode() {
        foreach ($this->cipher as $msg) {
            $this->decodedMessage .= $this->encodedMessage[intval($msg)-1];
        }
    }
    
    function printDecodedMessage() {
        echo $this->decodedMessage . "\n";
    }
}
