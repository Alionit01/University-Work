import java.util.Scanner;
                      //Task 2
public class Main2 {

	public static void main(String[] args) {

        Scanner scanf = new Scanner(System.in);
        double day1,day2,day3,day4,day5,day6,day7;
		
		System.out.print("Enter how much you ran on monday: ");
		 day1 = scanf.nextDouble();
		 System.out.print("Enter how much you ran on tuesday: ");
		 day2 = scanf.nextDouble();
		 System.out.print("Enter how much you ran on wednesday: ");
		 day3 = scanf.nextDouble();
		 System.out.print("Enter how much you ran on thrusday: ");
		 day4 = scanf.nextDouble();
		 System.out.print("Enter how much you ran on friday: ");
		 day5 = scanf.nextDouble();
		 System.out.print("Enter how much you ran on saturday: ");
		 day6 = scanf.nextDouble();
		 System.out.print("Enter how much you ran on sunday: ");
		 day7 = scanf.nextDouble();
		 
		 double totalDistance = day1 + day2 + day3 + day4 + day5 + day6 + day7;
		 
		 System.out.print("Total distance run: " + totalDistance);
		 
		 
	}

}
