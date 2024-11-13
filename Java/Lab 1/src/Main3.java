                             //Task 3

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Scanner;

public class Main3 {

	public static void main(String[] args) {

		        Scanner scanner = new Scanner(System.in);

		        
		        System.out.print("Enter the original price of the product: ");
		        double originalPrice = scanner.nextDouble();

		        System.out.print("Enter the discount percentage: ");
		        double discountPercentage = scanner.nextDouble();

		        
		        double discountAmount = originalPrice * (discountPercentage / 100);
		        double finalPrice = originalPrice - discountAmount;

		      
		        LocalDateTime currentDateTime = LocalDateTime.now();
		        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		        String formattedDateTime = currentDateTime.format(formatter);

		        

               System.out.println("Final price after discount: " + finalPrice);
		        System.out.println("Transaction date and time: " + formattedDateTime);

		       
		    }
		}
	