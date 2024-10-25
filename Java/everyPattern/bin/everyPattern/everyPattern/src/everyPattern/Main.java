package everyPattern;

public class Main {
	public static void main(String[] args) {
		int i,j;
		int n = 5;
		//*************************************
		System.out.println("Left-Hand traingle");
		for(i = 1; i <= n; i++) {
			for(j = 1; j <= i; j++) {
				System.out.print("*");
			}
			System.out.println("");
		}
		//*************************************
		System.out.println("Left-Hand downward traingle");
		for(i = 1; i <= n; i++) {
			for(j = i; j <= n; j++) {
				System.out.print("*");
			}
			System.out.println("");
		}
		//*************************************
		System.out.println("Right-Hand traingle");
		for(i = 1; i <= n; i++) {
			for(j = i; j <= n; j++) {
						System.out.print(" ");
			}
			for(j = 1; j <= i; j++) {
				System.out.print("*");
	}
			
			System.out.println("");
		}
		//*************************************
		System.out.println("Right-Hand downward traingle");
		for(i = 1; i <= n; i++) {
			for(j = 1; j <= i; j++) {
			System.out.print(" ");
					}
			for(j = i; j <= n; j++) {
			System.out.print("*");
			}
					
			System.out.println("");
		}
		//*************************************
				System.out.println("Pyramid traingle");
				for(i = 1; i <= n; i++) {
					for(j = i; j <= n; j++) {
					System.out.print(" ");
					}
					for(j = 1; j < i; j++) {
						System.out.print("*");
			}
					for(j = 1; j <= i; j++) {
						System.out.print("*");}
					
					System.out.println("");
				}
				//*************************************
				System.out.println("Reverse Pyramid traingle");
				for(i = 1; i <= n; i++) {
					for(j = 1; j <= i; j++) {
					System.out.print(" ");
					}
					for(j = i; j < n; j++) {
						System.out.print("*");
			}
					for(j = i; j <= n; j++) {
						System.out.print("*");}
					
					System.out.println("");
				}
				
				//*************************************
				System.out.println("Diamond traingle");
				for(i = 1; i < n; i++) {
					for(j = i; j <= n; j++) {
					System.out.print(" ");
					}
					for(j = 1; j < i; j++) {
						System.out.print("*");
			}
					for(j = 1; j <= i; j++) {
						System.out.print("*");}
					
					System.out.println("");
				}
				
				for(i = 1; i <= n; i++) {
					for(j = 1; j <= i; j++) {
					System.out.print(" ");
					}
					for(j = i; j < n; j++) {
						System.out.print("*");
			}
					for(j = i; j <= n; j++) {
						System.out.print("*");}
					
					System.out.println("");
				}
		
				
				//*************************************
				System.out.println("Left-Hand Pascal traingle");
				for(i = 1; i < n; i++) {
					for(j = 1; j <= i; j++) {
						System.out.print("*");
						
					}
					System.out.println("");
				}
				for(i = 1; i <= n; i++) {
					for(j = i; j <= n; j++) {
						System.out.print("*");
					}
					System.out.println("");
				}
				
				
				//*************************************
				System.out.println("Right-Hand Pascal traingle");
				for(i = 1; i < n; i++) {
					for(j = i; j <= n; j++) {
								System.out.print(" ");
					}
					for(j = 1; j <= i; j++) {
						System.out.print("*");
			}
					
					System.out.println("");
				}
				for(i = 1; i <= n; i++) {
					for(j = 1; j <= i; j++) {
					System.out.print(" ");
							}
					for(j = i; j <= n; j++) {
					System.out.print("*");
					}
							
					System.out.println("");
				}		
	}
}
