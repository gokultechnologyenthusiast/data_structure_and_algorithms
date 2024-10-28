void main() {
  // Creating an array (List in Dart)
  List<int> numbers = [10, 20, 30, 40, 50];

  // Accessing elements
  print(numbers[0]); // Output: 10
  print(numbers[2]); // Output: 30

  // Modifying elements
  numbers[1] = 25;
  print(numbers); // Output: [10, 25, 30, 40, 50]

  // Getting the length of the array
  print(numbers.length); // Output: 5

  // Adding elements
  numbers.add(60); // Adds to the end
  print(numbers); // Output: [10, 25, 30, 40, 50, 60]

  numbers.insert(1, 15); // Inserts at index 1
  print(numbers); // Output: [10, 15, 25, 30, 40, 50, 60]

  // Removing elements
  numbers.remove(30); // Removes the value 30
  print(numbers); // Output: [10, 15, 25, 40, 50, 60]

  numbers.removeAt(2); // Removes the element at index 2
  print(numbers); // Output: [10, 15, 40, 50, 60]

  // Checking if an element exists
  print(numbers.contains(40)); // Output: true
  print(numbers.contains(30)); // Output: false

  // Iterating through the array
  for (int number in numbers) {
    print(number);
  }

  // Other useful methods
  print(numbers.indexOf(50)); // Output: 3 (index of value 50)
  numbers.sort(); // Sorts the array in ascending order
  print(numbers); // Output: [10, 15, 40, 50, 60]
  numbers.clear(); // Removes all elements
  print(numbers); // Output: []
}
