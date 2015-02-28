<?php
//new findWriters($argv[1]);

class findWriters {
    function __construct($file) {
        $fileToParse = fopen($file, 'r');
        while (!feof($fileToParse)) {
            $writer = new findAWriter(fgets($fileToParse));
            $writer->printDecodedMessage();
        }
    }
}

class findAWriter {
    private $inputString = '';
    private $encodedMessage = array();
    private $cipher = array();
    public $decodedMessage = '';

    function __construct($input) {
        $this->inputString = $input;
        $this->parseInput();
        $this->decode();
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