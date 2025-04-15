package de;

public class LinkedList {
	Node head;
	
	public void insert(int data) {
		Node newNode = new Node(data);
		
		if(head == null){
			head = newNode;
		}
		else {
			Node n = head;
			while(n.next != null) {
				n = n.next;
			}
			n.next = newNode;	
			}	
		}
	public void printList() {
		Node current = head;
			while(current != null) {
				System.out.print(current.data+"->");
				current = current.next;
			}
			System.out.println("null");
		}
}
