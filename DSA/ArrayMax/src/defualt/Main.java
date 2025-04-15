package defualt;

public class Main {

	public static void main(String[] args) {
		
		int[] arr = {0, 1, 0, 3, 12};
		int i, temp;
		int nonZeroIndex = 0;
		for(i=0; i<arr.length; i++) {
			if(arr[i] != 0) {
				temp = arr[i];
				arr[i] = arr[nonZeroIndex];
				arr[nonZeroIndex] = temp;
				nonZeroIndex++;
			}
			
		}
	
		for(int num : arr) {
			System.out.print(num+" ");
		}
	}

}









//int[] arr = {10, 20, 5, 8, 30};
//int max = arr[0];
//int secondMax = arr[0];
//for(int i=0; i<arr.length; i++) {
//	if(max < arr[i]) {
//		max = arr[i];
//	}	
//}
//System.out.println(max);
//for(int i=0; i<arr.length; i++) {
//	if(secondMax < arr[i] && arr[i] != max) {
//		secondMax = arr[i];
//	}	
//}
//System.out.println(secondMax);
//