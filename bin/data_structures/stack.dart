class Stack<T> {
  final List<T> _items = [];

  // Push an item onto the stack
  void push(T item) {
    _items.add(item);
  }

  // Pop an item from the stack
  T? pop() {
    if (isEmpty) {
      return null; // Or throw an exception if you prefer
    }
    return _items.removeLast();
  }

  // Peek at the top item without removing it
  T? peek() {
    if (isEmpty) {
      return null; // Or throw an exception
    }
    return _items.last;
  }

  // Check if the stack is empty
  bool get isEmpty => _items.isEmpty;

  // Get the number of items in the stack
  int get length => _items.length;

  // Print the contents of the stack
  void printStack() {
    print(_items);
  }
}

void main() {
  final myStack = Stack<int>();

  myStack.push(10);
  myStack.push(20);
  myStack.push(30);

  print("Stack: ");
  myStack.printStack(); // Output: [10, 20, 30]

  print("Popped: ${myStack.pop()}"); // Output: Popped: 30
  print("Peek: ${myStack.peek()}"); // Output: Peek: 20

  print("Stack: ");
  myStack.printStack(); // Output: [10, 20]

  print("Is empty? ${myStack.isEmpty}"); // Output: Is empty? false
  print("Length: ${myStack.length}"); // Output: Length: 2
}
