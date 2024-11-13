
                      //Task 1

import java.util.Scanner;

public class Main {
             
	public static void main(String[] args) {

		Scanner scanf = new Scanner(System.in);
		
		System.out.print("Enter your first name: ");
		 String firstName = scanf.nextLine();
		 
		 System.out.print("Enter your first name: ");
		 String lastName = scanf.nextLine();
		 
		 System.out.print("Enter your age: ");
		 int name = scanf.nextInt();
		 
		 int name2 = name + 5;
		 System.out.println("Welcome "+ firstName+ " " + lastName+ " your age in 5 years "+ name2);
	}

}
