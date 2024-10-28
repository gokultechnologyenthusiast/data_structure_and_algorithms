import 'dart:collection';

class Graph {
  final Map<String, List<String>> _adjacencyList;

  Graph() : _adjacencyList = {};

  void addVertex(String vertex) {
    _adjacencyList[vertex] = [];
  }

  void addEdge(String source, String destination) {
    _adjacencyList[source]!.add(destination);
    _adjacencyList[destination]!.add(source); // For undirected graph
  }

  void removeVertex(String vertex) {
    _adjacencyList.remove(vertex);
    for (var neighbors in _adjacencyList.values) {
      neighbors.remove(vertex);
    }
  }

  void removeEdge(String source, String destination) {
    _adjacencyList[source]!.remove(destination);
    _adjacencyList[destination]!.remove(source); // For undirected graph
  }

  void dfs(String start) {
    Set<String> visited = {};
    _dfsHelper(start, visited);
  }

  void _dfsHelper(String vertex, Set<String> visited) {
    visited.add(vertex);
    print(vertex);

    for (String neighbor in _adjacencyList[vertex]!) {
      if (!visited.contains(neighbor)) {
        _dfsHelper(neighbor, visited);
      }
    }
  }

  void bfs(String start) {
    Set<String> visited = {};
    Queue<String> queue = Queue.of([start]);

    while (queue.isNotEmpty) {
      String current = queue.removeFirst();
      if (!visited.contains(current)) {
        visited.add(current);
        print(current);

        for (String neighbor in _adjacencyList[current]!) {
          if (!visited.contains(neighbor)) {
            queue.add(neighbor);
          }
        }
      }
    }
  }
}

void main() {
  Graph graph = Graph();
  graph.addVertex('A');
  graph.addVertex('B');
  graph.addVertex('C');
  graph.addVertex('D');
  graph.addVertex('E');

  graph.addEdge('A', 'B');
  graph.addEdge('A', 'C');
  graph.addEdge('B', 'D');
  graph.addEdge('C', 'E');

  print("DFS from A:");
  graph.dfs('A');

  print("\nBFS from A:");
  graph.bfs('A');
}
