class Node<T> {
  T value;
  Node<T>? prev;
  Node<T>? next;

  Node(this.value);
}

class DoublyLinkedList<T> {
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
      newNode.prev = tail;
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
      if (head != null) {
        head!.prev = newNode;
      }
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
      newNode.prev = current;
      if (current.next != null) {
        current.next!.prev = newNode;
      }
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
      if (head != null) {
        head!.prev = null;
      } else {
        tail = null;
      }
      _length--;
      return removedNode!.value;
    } else if (index == _length - 1) {
      // Remove from the end
      final removedNode = tail;
      tail = tail!.prev;
      if (tail != null) {
        tail!.next = null;
      } else {
        head = null;
      }
      _length--;
      return removedNode!.value;
    } else {
      // Remove from the middle
      Node<T> current = head!;
      for (int i = 0; i < index; i++) {
        current = current.next!;
      }
      current.prev!.next = current.next;
      current.next!.prev = current.prev;
      _length--;
      return current.value;
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

  // Print the contents of the list (from head to tail)
  void printList() {
    Node<T>? current = head;
    String output = "";
    while (current != null) {
      output += "${current.value} ";
      current = current.next;
    }
    print(output);
  }

  // Print the contents of the list in reverse (from tail to head)
  void printListReverse() {
    Node<T>? current = tail;
    String output = "";
    while (current != null) {
      output += "${current.value} ";
      current = current.prev;
    }
    print(output);
  }
}

void main() {
  final myList = DoublyLinkedList<int>();

  myList.add(10);
  myList.add(20);
  myList.add(30);

  print("Length: ${myList.length}"); // Output: Length: 3
  myList.printList(); // Output: 10 20 30
  myList.printListReverse(); // Output: 30 20 10

  myList.insert(1, 15);
  print("Length: ${myList.length}"); // Output: Length: 4
  myList.printList(); // Output: 10 15 20 30

  myList.removeAt(2);
  print("Length: ${myList.length}"); // Output: Length: 3
  myList.printList(); // Output: 10 15 30

  print("Value at index 1: ${myList.getAt(1)}"); // Output: Value at index 1: 15
}
