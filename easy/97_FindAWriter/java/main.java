import java.io.*;
import java.util.Arrays;

public class Main {
    public static void main (String[] args) throws IOException {
        File file = new File(args[0]);
        BufferedReader buffer = new BufferedReader(new FileReader(file));
        String line;
        while ((line = buffer.readLine()) != null) {
            line = line.trim();
            String[] messageAndCipher = line.split("\\| ");
            String[] encodedMessage = messageAndCipher[0].split("");
            String[] cipher = messageAndCipher[1].split(" ");
            String[] decodedMessage = new String[cipher.length];
            for(int i=0; i < cipher.length; i++)
            {
                int key = Integer.parseInt(cipher[i]);
                decodedMessage[i] = encodedMessage[key];
            }
            System.out.println(Arrays.toString(decodedMessage).replace("[", "").replace("]", "").replace(", ",""));
        }
    }
}

//public class FindAWriter {
//    private string encodedMessage = "";
//    private string cipher = "";
//    private string decodedMessage = "";
//
//    public FindAWriter(string encodedMessage, string cipher) {
//
//
//    }
//
//}