package defualt;

//Task: Write a method that finds all pairs of numbers in an array that add up to a specified
//target sum. Return a list of pairs that meet the condition.
//For example, in the array [1, 2, 3, 4, 5] with a target sum of 6, the pairs would be
//(1, 5) and (2, 4).
// Example Output:
//Input: Array [1, 2, 3, 4, 5], Target 6
//Output: (1, 5), (2, 4)

public class Main3 {

	public static void main(String[] args) {
		int arr[] = {1, 2, 3, 4, 5};
		int target = 6;
		
	
		for(int i=1; i<arr.length; i++) {
			for(int j=0; j<i; j++) {
			if(arr[i] + arr[j] == target) {
				System.out.print(" (" + arr[j] +", "+ arr[i] + ")");
				}
			}
		}
		
		
		
		
		
//		for(int i=0; i<arr.length; i++) {
//			for(int j=i +1; j<arr.length; j++) {
//				if(arr[i] + arr[j] == target) {
//					System.out.print(" (" + arr[j] +", "+ arr[i] + ")");
//				}
//			}
//			
//		}
		
	}

}
