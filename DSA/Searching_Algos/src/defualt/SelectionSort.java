package defualt;

public class SelectionSort {

	public static void main(String[] args) {
		
		int[] arr = {3,2,8,1,9,6,7};
		for(int i = 0; i<arr.length -1; i++) {
			int min = i;
			for(int j=i + 1; j<arr.length; j++) {
				if(arr[min] > arr[j]) {
					min = j;
				}
			}
			int swap = arr[i];
			arr[i] = arr[min];
			arr[min] = swap;
		}
		
		for(int j=0; j<arr.length; j++) {
			System.out.print(arr[j]);
			}
	}

}
