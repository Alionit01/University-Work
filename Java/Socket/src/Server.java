import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

public class Server {

	public static void main(String[] args) {

		try {
			System.out.println("Waiting for clients! ");
			ServerSocket serverSocket = new ServerSocket(9806);
			Socket socket = serverSocket.accept();
			System.out.println("Connection Establish");
			BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));//takes input from server 
            String msg = in.readLine();
			PrintWriter out = new PrintWriter(socket.getOutputStream(),true);
            out.println("Server: "+msg);
			
		} 
		catch (IOException e) {
			e.printStackTrace();
		}
	}

}
