package defualt;

import java.util.Arrays;

public class Main2 {

	public static void main(String[] args) {
		int arr[] = {1, 2, 2, 3, 4, 4, 5};
		int j = 0;
		
		for(int i=0; i<arr.length; i++) {
			if(arr[i] != arr[j]) {
				j++;
				arr[j] = arr[i];
				
			}
//			else {            //(check the index its skipping)
//				System.out.println("bonyik"+i+j);
//			}
		}
		for(int k=0; k <= j; k++) {
			System.out.print(arr[k] + " ");
		}
		
		
			
		
		
		

	}

}
