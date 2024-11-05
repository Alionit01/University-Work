import java.io.IOException;
import java.net.Socket;
import java.io.*;
public class Client {

		public static void main(String[] args) {

			System.out.println("Client started");
			try {
				Socket socket = new Socket("localhost",9806);
				BufferedReader userInput = new BufferedReader(new InputStreamReader(System.in));//takes input in string 
				System.out.println("Enter a message");
				String msg = userInput.readLine();
				PrintWriter out = new PrintWriter(socket.getOutputStream(),true);
				out.println(msg);
				BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));// 
	            System.out.println(in.readLine());
				
			} catch (IOException e) {
				e.printStackTrace();
			} 
			
		}

	}

