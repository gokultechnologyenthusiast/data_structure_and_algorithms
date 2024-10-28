class Heap<T extends Comparable> {
  final List<T> _heap;
  final bool _isMinHeap;

  Heap({bool isMinHeap = true})
      : _heap = [],
        _isMinHeap = isMinHeap;

  // Helper methods to get parent, left child, and right child indices
  int _parent(int index) => (index - 1) ~/ 2;
  int _leftChild(int index) => 2 * index + 1;
  int _rightChild(int index) => 2 * index + 2;

  // Helper method to swap elements at two indices
  void _swap(int i, int j) {
    T temp = _heap[i];
    _heap[i] = _heap[j];
    _heap[j] = temp;
  }

  // Heapify up: Maintain heap property from a given index upwards
  void _heapifyUp(int index) {
    while (index > 0 && _compare(_heap[index], _heap[_parent(index)]) < 0) {
      _swap(index, _parent(index));
      index = _parent(index);
    }
  }

  // Heapify down: Maintain heap property from a given index downwards
  void _heapifyDown(int index) {
    while (_leftChild(index) < _heap.length) {
      int smallerChildIndex = _leftChild(index);
      if (_rightChild(index) < _heap.length &&
          _compare(_heap[_rightChild(index)], _heap[smallerChildIndex]) < 0) {
        smallerChildIndex = _rightChild(index);
      }

      if (_compare(_heap[index], _heap[smallerChildIndex]) < 0) {
        break;
      }

      _swap(index, smallerChildIndex);
      index = smallerChildIndex;
    }
  }

  // Comparison function (adjust for min-heap or max-heap)
  int _compare(T a, T b) {
    return _isMinHeap ? a.compareTo(b) : b.compareTo(a);
  }

  // Insert an element into the heap
  void insert(T value) {
    _heap.add(value);
    _heapifyUp(_heap.length - 1);
  }

  // Get the top element (min or max) without removing it
  T? get peek {
    if (_heap.isEmpty) {
      return null;
    }
    return _heap[0];
  }

  // Extract and return the top element (min or max)
  T? extract() {
    if (_heap.isEmpty) {
      return null;
    }
    T root = _heap[0];
    _heap[0] = _heap.last;
    _heap.removeLast();
    _heapifyDown(0);
    return root;
  }

  // Check if the heap is empty
  bool get isEmpty => _heap.isEmpty;

  // Get the size of the heap
  int get size => _heap.length;
}

void main() {
  // Example usage:
  var minHeap = Heap<int>(); // Create a min-heap of integers
  minHeap.insert(5);
  minHeap.insert(3);
  minHeap.insert(8);
  minHeap.insert(1);

  print("Min Heap:");
  while (!minHeap.isEmpty) {
    print(minHeap.extract()); // Output: 1 3 5 8
  }

  var maxHeap = Heap<String>(isMinHeap: false); // Create a max-heap of strings
  maxHeap.insert("apple");
  maxHeap.insert("banana");
  maxHeap.insert("orange");

  print("\nMax Heap:");
  while (!maxHeap.isEmpty) {
    print(maxHeap.extract()); // Output: orange banana apple
  }
}
