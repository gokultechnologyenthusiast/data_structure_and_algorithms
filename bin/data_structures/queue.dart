class Queue<T> {
  final List<T> _items = [];

  // Enqueue: Add an item to the back of the queue
  void enqueue(T item) {
    _items.add(item);
  }

  // Dequeue: Remove and return the item at the front of the queue
  T? dequeue() {
    if (isEmpty) {
      return null; // Or throw an exception if you prefer
    }
    return _items.removeAt(0);
  }

  // Peek: Get the item at the front of the queue without removing it
  T? peek() {
    if (isEmpty) {
      return null; // Or throw an exception
    }
    return _items.first;
  }

  // Check if the queue is empty
  bool get isEmpty => _items.isEmpty;

  // Get the number of items in the queue
  int get length => _items.length;

  // Print the contents of the queue
  void printQueue() {
    print(_items);
  }
}

void main() {
  final myQueue = Queue<int>();

  myQueue.enqueue(10);
  myQueue.enqueue(20);
  myQueue.enqueue(30);

  print("Queue: ");
  myQueue.printQueue(); // Output: [10, 20, 30]

  print("Dequeued: ${myQueue.dequeue()}"); // Output: Dequeued: 10
  print("Peek: ${myQueue.peek()}"); // Output: Peek: 20

  print("Queue: ");
  myQueue.printQueue(); // Output: [20, 30]

  print("Is empty? ${myQueue.isEmpty}"); // Output: Is empty? false
  print("Length: ${myQueue.length}"); // Output: Length: 2
}
