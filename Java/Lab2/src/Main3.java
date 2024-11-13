import java.util.Scanner;

public class Main3 {

	public static void main(String[] args) {
		
		        Scanner scanner = new Scanner(System.in);

		        System.out.print("Enter the current temperature in Celsius: ");
		        int temperature = scanner.nextInt();
		        scanner.nextLine();  

		        System.out.print("Is it raining or sunny? (Enter 'rainy' or 'sunny'): ");
		        String weatherCondition = scanner.nextLine().toLowerCase();

		        if (temperature < 0) {
		            if (weatherCondition.equals("rainy")) {
		                System.out.println("Wear a heavy coat and take an umbrella.");
		            } else if (weatherCondition.equals("sunny")) {
		                System.out.println("Wear a heavy coat and sunglasses.");
		            }
		        } else if (temperature >= 0 && temperature <= 10) {
		            if (weatherCondition.equals("rainy")) {
		                System.out.println("Wear a warm jacket and take an umbrella.");
		            } else if (weatherCondition.equals("sunny")) {
		                System.out.println("Wear a warm jacket and sunglasses.");
		            }
		        } else if (temperature >= 11 && temperature <= 20) {
		            if (weatherCondition.equals("rainy")) {
		                System.out.println("Wear a light jacket and take an umbrella.");
		            } else if (weatherCondition.equals("sunny")) {
		                System.out.println("Wear a light jacket and sunglasses.");
		            }
		        } else {
		            if (weatherCondition.equals("rainy")) {
		                System.out.println("Wear light clothing and take an umbrella.");
		            } else if (weatherCondition.equals("sunny")) {
		                System.out.println("Wear light clothing and sunglasses.");
		            }
		        }

		    }
		}
