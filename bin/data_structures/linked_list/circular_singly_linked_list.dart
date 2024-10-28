class Node<T> {
  T value;
  Node<T>? next;

  Node(this.value);
}

class CircularSinglyLinkedList<T> {
  Node<T>? tail; // Points to the last node (tail)
  int _length = 0;

  // Get the length of the list
  int get length => _length;

  // Check if the list is empty
  bool get isEmpty => _length == 0;

  // Add a node to the end of the list
  void add(T value) {
    final newNode = Node(value);

    if (isEmpty) {
      // If the list is empty, the new node becomes both head and tail
      tail = newNode;
      newNode.next = newNode; // Point to itself
    } else {
      // Insert after the current tail
      newNode.next = tail!.next;
      tail!.next = newNode;
      tail = newNode;
    }

    _length++;
  }

  // Insert a node at a specific index
  void insert(int index, T value) {
    if (index < 0 || index > _length) {
      throw RangeError.index(index, this, 'index', 'Index out of bounds');
    }

    if (index == 0) {
      // Insert at the beginning (same as adding, but update tail)
      add(value);
      tail = tail!.next; // Update tail to the newly added node
    } else if (index == _length) {
      // Insert at the end (same as regular add)
      add(value);
    } else {
      // Insert in the middle
      Node<T> current = tail!.next!; // Start from the head
      for (int i = 0; i < index - 1; i++) {
        current = current.next!;
      }
      final newNode = Node(value);
      newNode.next = current.next;
      current.next = newNode;
    }

    _length++;
  }

  // Remove a node at a specific index
  T? removeAt(int index) {
    if (index < 0 || index >= _length) {
      throw RangeError.index(index, this, 'index', 'Index out of bounds');
    }

    if (isEmpty) {
      return null; // Nothing to remove
    }

    Node<T>? removedNode;

    if (_length == 1) {
      // Removing the only node
      removedNode = tail;
      tail = null;
    } else if (index == 0) {
      // Removing the head (special case)
      removedNode = tail!.next;
      tail!.next = removedNode!.next;
    } else {
      // Removing from the middle or end
      Node<T> current = tail!.next!;
      for (int i = 0; i < index - 1; i++) {
        current = current.next!;
      }
      removedNode = current.next;
      current.next = removedNode!.next;

      if (removedNode == tail) {
        // If removing the tail, update the tail reference
        tail = current;
      }
    }

    _length--;
    return removedNode!.value;
  }

  // Get the value at a specific index
  T? getAt(int index) {
    if (index < 0 || index >= _length) {
      throw RangeError.index(index, this, 'index', 'Index out of bounds');
    }

    Node<T> current = tail!.next!; // Start from the head
    for (int i = 0; i < index; i++) {
      current = current.next!;
    }
    return current.value;
  }

  // Print the contents of the list
  void printList() {
    if (isEmpty) {
      print("List is empty");
      return;
    }

    Node<T>? current = tail!.next; // Start from the head
    String output = "";

    do {
      output += "${current!.value} ";
      current = current.next;
    } while (current != tail!.next);

    print(output);
  }
}

void main() {
  final myList = CircularSinglyLinkedList<int>();

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
