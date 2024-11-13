                         //Task 1
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        int score;
        Scanner scanf = new Scanner(System.in);
        System.out.println("Enter your score:");
        score = scanf.nextInt();
        
        if (score >= 50) {
            System.out.println("Pass");
        } else {
            System.out.println("Fail");
        }
        
       
    }
}

