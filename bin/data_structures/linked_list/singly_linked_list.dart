class Node<T> {
  T value;
  Node<T>? next;

  Node(this.value);
}

class SinglyLinkedList<T> {
  Node<T>? head;
  Node<T>? tail;
  int _length = 0;

  // Get the length of the list
  int get length => _length;

  // Check if the list is empty
  bool get isEmpty => _length == 0;

  // Add a node to the end of the list
  void add(T value) {
    final newNode = Node(value);

    if (isEmpty) {
      head = newNode;
      tail = newNode;
    } else {
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
      // Insert at the beginning
      final newNode = Node(value);
      newNode.next = head;
      head = newNode;
      if (_length == 0) {
        tail = newNode;
      }
    } else if (index == _length) {
      // Insert at the end (same as add)
      add(value);
    } else {
      // Insert in the middle
      Node<T> current = head!;
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

    if (index == 0) {
      // Remove from the beginning
      final removedNode = head;
      head = head!.next;
      if (head == null) {
        tail = null;
      }
      _length--;
      return removedNode!.value;
    } else {
      // Remove from the middle or end
      Node<T> current = head!;
      for (int i = 0; i < index - 1; i++) {
        current = current.next!;
      }
      final removedNode = current.next;
      current.next = current.next!.next;
      if (removedNode == tail) {
        tail = current;
      }
      _length--;
      return removedNode!.value;
    }
  }

  // Get the value at a specific index
  T? getAt(int index) {
    if (index < 0 || index >= _length) {
      throw RangeError.index(index, this, 'index', 'Index out of bounds');
    }

    Node<T> current = head!;
    for (int i = 0; i < index; i++) {
      current = current.next!;
    }
    return current.value;
  }

  // Print the contents of the list
  void printList() {
    Node<T>? current = head;
    String output = "";
    while (current != null) {
      output += "${current.value} ";
      current = current.next;
    }
    print(output);
  }
}

void main() {
  final myList = SinglyLinkedList<int>();

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
