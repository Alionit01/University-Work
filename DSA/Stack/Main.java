

public class Main
{
	public static void main(String[] args) {
        Stack stack = new Stack(4);
        stack.push(2);
        stack.push(10);
        stack.push(20);
        stack.push(30);
        stack.display();
        stack.pop();
        stack.display();
	}
}