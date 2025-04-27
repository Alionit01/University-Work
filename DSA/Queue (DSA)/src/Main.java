import java.util.LinkedList;
import java.util.PriorityQueue;
import java.util.Queue;

public class Main {

	public static void main(String[] args) {

		// queue = FIFO First In First Out
		// add = enqueue, offer()
        // remove = dequeue, poll()
		
		Queue queue = new PriorityQueue<String>();
		queue.offer("C");
		queue.offer("B");
		queue.offer("A");
		queue.offer("D");
		                        //   queue.peek() show the first person in queue
		                        //   queue.poll() removes first in queue
		                        //   queue.contains("Jim") checks true or false

		while(!queue.isEmpty()) {
			System.out.println(queue);
			break;
		}
		
	}

}



//Queue
// queue = FIFO First In First Out
// add = enqueue, offer()
// remove = dequeue, poll()

//Queue queue = new LinkedList<String>();
//queue.offer("Pam");
//queue.offer("Dwight");
//queue.offer("Jim");
//queue.offer("Micheal");
//                        //   queue.peek() show the first person in queue
//                        //   queue.poll() removes first in queue
//                        //   queue.contains("Jim") checks true or false
//
//System.out.println(queue);

