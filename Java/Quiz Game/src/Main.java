import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		
      Scanner scanf = new Scanner(System.in);
	  String[] usrInput = new String[3];	
	  String[] ansKey = {"d","a","c"};
	  int score = 0;
	   
	  	  System.out.println("Question 1: What is the capital of France?");
	        System.out.println("a. London");
	        System.out.println("b. Berlin");
	        System.out.println("c. Madrid");
	        System.out.println("d. Paris");
	        System.out.println();
	    
	      System.out.println("Question 2: Which of the following is a programming language?");
	        System.out.println("a. Java");
	        System.out.println("b. HTML");
	        System.out.println("c. CSS");	       
	        System.out.println("d. SQL");
	        System.out.println();
 
	      System.out.println("Question 3: What is the largest planet in our Solar System?");
	        System.out.println("a. Earth");
	        System.out.println("b. Mars");
	        System.out.println("c. Jupiter");
	        System.out.println("d. Saturn");
	        
	        
	      System.out.println("Enter your answers ");
	  	   
	  	     for (int i = 0; i < 3; i++) {
	  		    usrInput[i] = scanf.next();
	  	  }
	  	   for (int i = 0; i < 3; i++) {
	            if (usrInput[i].equals(ansKey[i]) ) {
	            	score ++;	            	 
	            }
   	  	   }
	  	 System.out.println("You got " + score + "/3");
	}
}
