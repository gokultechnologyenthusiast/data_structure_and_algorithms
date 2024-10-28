class Node<T> {
  T? value; // Value can be null for the header node
  Node<T>? next;

  Node({this.value, this.next});
}

class HeaderLinkedList<T> {
  Node<T> header = Node<T>(); // Header node, initially with null value
  int _length = 0;

  int get length => _length;
  bool get isEmpty => _length == 0;

  // Add a node to the end of the list
  void add(T value) {
    Node<T> newNode = Node(value: value);
    Node<T> current = header;

    // Traverse to the last node
    while (current.next != null) {
      current = current.next!;
    }

    current.next = newNode;
    _length++;
  }

  // Insert a node at a specific index
  void insert(int index, T value) {
    if (index < 0 || index > _length) {
      throw RangeError.index(index, this, 'index', 'Index out of bounds');
    }

    Node<T> newNode = Node(value: value);
    Node<T> current = header;
    int currentIndex = -1; // Start from -1 to account for the header

    // Traverse to the node before the insertion point
    while (current.next != null && currentIndex < index - 1) {
      current = current.next!;
      currentIndex++;
    }

    newNode.next = current.next;
    current.next = newNode;
    _length++;
  }

  // Remove a node at a specific index
  T? removeAt(int index) {
    if (index < 0 || index >= _length) {
      throw RangeError.index(index, this, 'index', 'Index out of bounds');
    }

    Node<T> current = header;
    int currentIndex = -1;

    // Traverse to the node before the one to be removed
    while (current.next != null && currentIndex < index - 1) {
      current = current.next!;
      currentIndex++;
    }

    Node<T> nodeToRemove = current.next!;
    current.next = nodeToRemove.next;
    _length--;
    return nodeToRemove.value;
  }

  // Get the value at a specific index
  T? getAt(int index) {
    if (index < 0 || index >= _length) {
      throw RangeError.index(index, this, 'index', 'Index out of bounds');
    }

    Node<T> current = header.next!;
    int currentIndex = 0;

    while (current.next != null && currentIndex < index) {
      current = current.next!;
      currentIndex++;
    }

    return current.value;
  }

  // Print the contents of the list
  void printList() {
    Node<T>? current = header.next;
    String output = "";
    while (current != null) {
      output += "${current.value} ";
      current = current.next;
    }
    print(output);
  }
}

void main() {
  final myList = HeaderLinkedList<int>();

  myList.add(10);
  myList.add(20);
  myList.add(30);

  print("Length: ${myList.length}"); // Output: Length: 3
  myList.printList(); // Output: 10 20 30

  myList.insert(1, 15);
  print("Length: ${myList.length}"); // Output: Length: 4
  myList.printList(); // Output: 10 15 20 30

  myList.removeAt(2);
  print("Length: ${myList.length}"); // Output: Length: 3
  myList.printList(); // Output: 10 15 30

  print("Value at index 1: ${myList.getAt(1)}"); // Output: Value at index 1: 15
}
