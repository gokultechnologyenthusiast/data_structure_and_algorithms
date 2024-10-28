class Node<T> {
  T value;
  List<Node<T>> children;

  Node(this.value, [this.children = const []]);
}

class Tree<T> {
  Node<T>? root;

  // Check if the tree is empty
  bool get isEmpty => root == null;

  // Insert a node (assuming this is a general tree, not a binary tree)
  void insert(T value, {T? parentValue}) {
    final newNode = Node(value);

    if (isEmpty) {
      root = newNode;
      return;
    }

    if (parentValue == null) {
      // If no parentValue is provided, add as a child of the root
      root!.children.add(newNode);
      return;
    }

    // Find the parent node and add the new node as its child
    Node<T>? parentNode = _findNode(root, parentValue);
    if (parentNode != null) {
      parentNode.children.add(newNode);
    } else {
      print("Parent node with value '$parentValue' not found.");
    }
  }

  // Helper function to find a node by value
  Node<T>? _findNode(Node<T>? node, T targetValue) {
    if (node == null) return null;
    if (node.value == targetValue) return node;

    for (Node<T> child in node.children) {
      final foundNode = _findNode(child, targetValue);
      if (foundNode != null) return foundNode;
    }

    return null;
  }

  // Depth-First Traversal (Pre-order)
  void printPreorder(Node<T>? node) {
    if (node != null) {
      print(node.value);
      for (Node<T> child in node.children) {
        printPreorder(child);
      }
    }
  }

  // Breadth-First Traversal (Level order)
  void printLevelOrder() {
    if (isEmpty) return;

    List<Node<T>> queue = [root!];
    while (queue.isNotEmpty) {
      Node<T> current = queue.removeAt(0);
      print(current.value);
      queue.addAll(current.children);
    }
  }
}

void main() {
  final myTree = Tree<String>();

  myTree.insert("A");
  myTree.insert("B", parentValue: "A");
  myTree.insert("C", parentValue: "A");
  myTree.insert("D", parentValue: "B");
  myTree.insert("E", parentValue: "B");
  myTree.insert("F", parentValue: "C");

  print("Pre-order Traversal:");
  myTree.printPreorder(myTree.root);
  // Output: A B D E C F

  print("\nLevel-order Traversal:");
  myTree.printLevelOrder();
  // Output: A B C D E F
}
