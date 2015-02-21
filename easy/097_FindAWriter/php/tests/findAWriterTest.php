<?php
class findAWriterTest extends PHPUnit_Framework_TestCase {
    public function testFindWriters() {
        $fileToParse = fopen('../test_input.txt', 'r');
        $i = 0;
        $writerResults = array();
        $expects = array("Stephen King 1947", "Kyotaro Nishimura 1930");
        
        while (!feof($fileToParse)) {
            $writer = new findAWriter(fgets($fileToParse));
            $writerResults[$i] = $writer->decodedMessage;
            $i++;
        }

        foreach ($expects as $key => $val) {
            $this->assertEquals($expects[$key], $writerResults[$key]);
        }
    }
}