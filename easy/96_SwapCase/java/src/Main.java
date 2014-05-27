import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.lang.Character;

public class Main implements Runnable {

    private String fileName;

    public Main (String fileName) {
        this.fileName = fileName;
    }

    @Override
    public void run() {
        try {
            processFile();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void processFile() throws IOException {
        BufferedReader br = new BufferedReader(
                new FileReader(fileName));
        String line = "";
        while ((line = br.readLine()) != null) {
            processLine(line);
        }
        br.close();
    }

    private char[] characterArray(String sentence) {
        char[] charArray = new char[sentence.length()];

        for (int i=0; i < sentence.length(); i++) {
            charArray[i] = sentence.charAt(i);
        }

        return charArray;
    }

    private char swapCharacter(char swapCharacter) {
        if (Character.isUpperCase(swapCharacter)) {
            return Character.toLowerCase(swapCharacter);
        }
        else {
            return Character.toUpperCase(swapCharacter);
        }
    }

    private char[] swapCharacterArray(char[] charArrayToSwap) {
        char[] swappedCharArray = new char[charArrayToSwap.length];

        for (int i=0; i < charArrayToSwap.length; i++) {
            swappedCharArray[i] =   swapCharacter(charArrayToSwap[i]);
        }

        return swappedCharArray;
    }

    private void processLine(String line) {
        char[] lineCharArray = characterArray(line);
        char[] newLineCharArray = swapCharacterArray(lineCharArray);
        String swappedSentence = new String(newLineCharArray);
        System.out.println(swappedSentence);
    }

    public static void main(String[] args) {
        new Main(args[0]).run();
    }

}