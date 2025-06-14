public class Stack
{
    int stack[];
    int size;
    int top;
    
    Stack(int size){
        this.size = size;
        this.stack = new int[size];
        this.top = -1;
    }
    
    public void push(int value){
        if(isFull()){
            System.out.println("stack is full");
            return;
        }
        stack[++top] = value;
    }
    
    public int pop(){
        if(isEmpty()){
            System.out.println("stack is empty");
            return -1;
        }
        return stack[top--];
    }
    
    public boolean isFull(){
       return top == size - 1;
    }
    
    public boolean isEmpty(){
       return top == -1;
    }
    
      public int peek() {
        if (isEmpty()) {
            System.out.println("Stack is empty.");
            return -1;
        }
        return stack[top];
    }
    
    public void display(){
        if(isEmpty()){
            System.out.println("stack is empty");
        }
        else {
            for (int i = 0; i <= top; i++){
                   System.out.print(stack[i] + " ");
        }
        System.out.println();
        }
    }
    
}