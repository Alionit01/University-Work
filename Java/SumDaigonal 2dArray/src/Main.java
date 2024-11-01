import java.util.Scanner;

public class Main {

	public static void main(String[] args) {

		int i, j, sum1 = 0, sum2 = 0;
        Scanner scanf = new Scanner(System.in);

        System.out.print("Enter the size of the matrix: ");
        int n = scanf.nextInt();

        int arr[][] = new int[n][n];
        System.out.println("Enter the elements of the matrix:");

        for (i = 0; i < n; i++) {
            for (j = 0; j < n; j++) {
                arr[i][j] = scanf.nextInt();
            }
        }

        System.out.println("Matrix:");
        for (i = 0; i < n; i++) {
            for (j = 0; j < n; j++) {
                System.out.print(arr[i][j] + " ");
            }
            System.out.println();
        }
 
        // Calculate the sums of the diagonals
        for (i = 0; i < n; i++) {
            if (i == i) { // i == j for left diagonal
                sum1 += arr[i][i];
            }
            sum2 += arr[i][n - i - 1]; // Right diagonal
        }

        System.out.println("Sum of left diagonal is " + sum1);
        System.out.println("Sum of right diagonal is " + sum2);

      
	}
	}