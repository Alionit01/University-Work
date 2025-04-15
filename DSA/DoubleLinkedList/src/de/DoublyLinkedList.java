package de;

public class DoublyLinkedList {
	Node head;
	
	public void add(int data) {
		Node newNode = new Node(data);
		if(head == null) {
			head = newNode;
		}
		else {
			Node n = head;
			while(n.next != null) {
				n = n.next;
			}
			n.next = newNode;
			newNode.prev = n;
		}
	}
	
	public void print() {
		Node current = head;
		while(current != null) {
			System.out.print(current.data + " <-> ");
			current = current.next;
		}
		System.out.println("null");
	}
	
	public void reverse() {
		Node current = head;
		
		if(current == null) return;
		while(current.next != null) {
			current = current.next;
		}
		
		while(current != null) {
			System.out.print(current.data+" <-> ");
			current = current.prev;
		}
		System.out.println("null");
	}
	
}
