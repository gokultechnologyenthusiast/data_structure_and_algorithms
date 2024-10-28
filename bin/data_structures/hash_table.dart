void main() {
  // Create a Map (similar to a hash table)
  Map<String, int> myHashTable = {}; // Keys are Strings, values are integers

  // Insertion
  myHashTable['apple'] = 1;
  myHashTable['banana'] = 2;
  myHashTable['cherry'] = 3;

  // Accessing values
  print(myHashTable['banana']); // Output: 2

  // Checking if a key exists
  print(myHashTable.containsKey('grape')); // Output: false

  // Updating a value
  myHashTable['banana'] = 5;
  print(myHashTable['banana']); // Output: 5

  // Removing a key-value pair
  myHashTable.remove('banana');
  print(myHashTable.containsKey('banana')); // Output: false

  // Iterating through the hash table
  myHashTable.forEach((key, value) {
    print('$key: $value');
  });

  // Getting the size of the hash table
  print(myHashTable.length); // Output: 2
}
