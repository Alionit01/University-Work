package defualt;

//Home Task 1: Array Rotation
//1. Objective: Practice manipulating elements in an array by rotating it.
//2. Task: Write a method to rotate the elements of an array by k positions to the right. For
//example, rotating [1, 2, 3, 4, 5] by 2 positions should yield [4, 5, 1, 2, 3].
//o Use the modulo operator to handle rotations greater than the array size.
//3. Example Output:
//o Input: [1, 2, 3, 4, 5], k = 2

public class Main {
    public static void main(String[] args) {
        int[] arr = {1, 2, 3, 4, 5};
        int k = 2;

        for (int i = 0; i < k; i++) {// i=0,1
            int temp = arr[arr.length - 1]; // temp=5,4
            for (int j = arr.length - 1; j > 0; j--) { //(1st loop)j=4,3,2,1,0 , (2nd loop)j=4,3,2,1,0
                arr[j] = arr[j - 1]; // {1,2,3,4,4},{1,2,3,3,4},{1,2,2,3,4},{1,1,2,4,4} (2nd) {5,1,2,3,3},  {5,1,2,2,3}, {5,1,1,2,3}, {5,5,1,2,3},        
            }
            arr[0] = temp; // {5,1,2,3,4}, {4,5,1,2,3},  
        } 

        for (int i : arr) {
            System.out.print(i + " ");
        }
    }
}
