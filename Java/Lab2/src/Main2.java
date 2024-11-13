
public class Main2 {

	public static void main(String[] args) {
 
		int sum = 0;
		 
        for (int i = 1; i <= 100; i++) {
          
            if (i % 2 == 0) {
                sum += i;  
            }
        }

        // Print the total sum of even numbers
        System.out.println("The sum of all even numbers " + sum);
	}

}
