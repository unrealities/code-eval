package com.github.unrealities;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.Ignore;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.junit.Before;
import org.junit.After;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.io.IOException;

public class TestFindAWriter {
    private final ByteArrayOutputStream outContent = new ByteArrayOutputStream();

    @Before
    public void setUpStreams() {
        System.setOut(new PrintStream(outContent));
    }

    @After
    public void cleanUpStreams() {
        System.setOut(null);
    }
    
    @Test
    public void TestMain() {
        try{
            FindAWriter.main(new String[]{"../test_input.txt"});
        }catch(IOException e){e.printStackTrace();}

        assertEquals("Stephen King 1947\nKyotaro Nishimura 1930\n", outContent.toString());
    }
}