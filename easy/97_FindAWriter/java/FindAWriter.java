import java.io.*;
import java.util.Arrays;

public class FindAWriter {
    private String[] encodedMessage;
    private String[] cipher;
    private String message;

    public FindAWriter(String input) {
        ParseInput(input);
        DecodeMessage();
    }
    
    public void outputResult() {
        System.out.println(message);
    }

    private void ParseInput(String input) {
        String[] messageAndCipher = input.split("\\| ");
        encodedMessage = messageAndCipher[0].split("");
        cipher = messageAndCipher[1].split(" ");
    }

    private void DecodeMessage() {
        String[] decodedMessage = new String[cipher.length];
        for(int i=0; i < cipher.length; i++)
        {
            int key = Integer.parseInt(cipher[i]);
            decodedMessage[i] = encodedMessage[key];
        }
        message = arrayToStringPretty(decodedMessage);
    }

    private String arrayToStringPretty(String[] arr) {
        return Arrays.toString(arr).replace("[", "").replace("]", "").replace(", ","");
    }
    
    public static void main (String[] args) throws IOException {
        File file = new File(args[0]);
        BufferedReader buffer = new BufferedReader(new FileReader(file));
        String line;
        while ((line = buffer.readLine()) != null) {
            FindAWriter writer = new FindAWriter(line.trim());
            writer.outputResult();
        }
    }
}
