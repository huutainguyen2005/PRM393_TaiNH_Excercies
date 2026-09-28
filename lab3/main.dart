import 'dart:async';

// ==================================================
// EXERCISE 1 – PRODUCT MODEL & REPOSITORY
// ==================================================

class Product {
  final int id;
  final String name;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.price,
  });

  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: $price)';
  }
}

class ProductRepository {
  // Broadcast Stream allows multiple listeners.
  final StreamController<Product> _controller =
      StreamController<Product>.broadcast();

  // Return all existing products asynchronously.
  Future<List<Product>> getAll() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return [
      Product(id: 1, name: 'Laptop', price: 1200),
      Product(id: 2, name: 'Mouse', price: 25),
      Product(id: 3, name: 'Keyboard', price: 50),
    ];
  }

  // Return a Stream for real-time product updates.
  Stream<Product> liveAdded() {
    return _controller.stream;
  }

  // Add a new product to the Stream.
  void addProduct(Product product) {
    _controller.add(product);
  }

  // Close the StreamController when it is no longer needed.
  void dispose() {
    _controller.close();
  }
}

Future<void> exercise1() async {
  print('========== EXERCISE 1 ==========');

  final repository = ProductRepository();

  // Get all products using Future.
  final products = await repository.getAll();

  print('All products:');

  for (final product in products) {
    print(product);
  }

  // Listen for real-time product updates.
  final subscription = repository.liveAdded().listen((product) {
    print('New product received: $product');
  });

  // Simulate adding new products.
  repository.addProduct(
    Product(id: 4, name: 'Headphone', price: 80),
  );

  repository.addProduct(
    Product(id: 5, name: 'Monitor', price: 300),
  );

  // Give the Stream time to process the events.
  await Future.delayed(const Duration(milliseconds: 100));

  await subscription.cancel();
  repository.dispose();

  print('');
}

// ==================================================
// EXERCISE 2 – USER REPOSITORY WITH JSON
// ==================================================

class User {
  final String name;
  final String email;

  User({
    required this.name,
    required this.email,
  });

  // Create a User object from JSON data.
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
    );
  }

  @override
  String toString() {
    return 'User(name: $name, email: $email)';
  }
}

class UserRepository {
  // Simulate fetching JSON data from an API.
  Future<List<User>> fetchUsers() async {
    await Future.delayed(const Duration(milliseconds: 500));

    // Simulated JSON response.
    final List<Map<String, dynamic>> jsonData = [
      {
        'name': 'Tai',
        'email': 'tai@example.com',
      },
      {
        'name': 'John',
        'email': 'john@example.com',
      },
      {
        'name': 'Anna',
        'email': 'anna@example.com',
      },
    ];

    // Convert each JSON object into a User object.
    return jsonData.map((json) => User.fromJson(json)).toList();
  }
}

Future<void> exercise2() async {
  print('========== EXERCISE 2 ==========');

  final repository = UserRepository();

  // Fetch and parse users asynchronously.
  final users = await repository.fetchUsers();

  print('Users from simulated API:');

  for (final user in users) {
    print(user);
  }

  print('');
}

// ==================================================
// EXERCISE 3 – ASYNC + MICROTASK DEBUGGING
// ==================================================

Future<void> exercise3() async {
  print('========== EXERCISE 3 ==========');

  print('1. Start');

  // Microtask is added to the microtask queue.
  scheduleMicrotask(() {
    print('3. Microtask executed');
  });

  // Future creates an event callback.
  Future(() {
    print('4. Future event executed');
  });

  print('2. End');

  // Wait for both queues to finish.
  await Future.delayed(const Duration(milliseconds: 100));

  print('');
}

// ==================================================
// EXERCISE 4 – STREAM TRANSFORMATION
// ==================================================

Future<void> exercise4() async {
  print('========== EXERCISE 4 ==========');

  // Create a Stream containing numbers 1 to 5.
  final numberStream = Stream.fromIterable([1, 2, 3, 4, 5]);

  print('Numbers: 1, 2, 3, 4, 5');

  // map() transforms each number into its square.
  // where() keeps only even square values.
  final transformedStream = numberStream
      .map((number) => number * number)
      .where((square) => square % 2 == 0);

  print('Even squares:');

  // Listen to each emitted value.
  await transformedStream.forEach((value) {
    print(value);
  });

  print('');
}

// ==================================================
// EXERCISE 5 – FACTORY CONSTRUCTORS & CACHE
// ==================================================

class Settings {
  // Private static instance used as the singleton.
  static final Settings _instance = Settings._internal();

  // Private constructor.
  Settings._internal();

  // Factory constructor returns the same instance.
  factory Settings() {
    return _instance;
  }

  String theme = 'light';
  String language = 'en';
}

void exercise5() {
  print('========== EXERCISE 5 ==========');

  // Both variables use the factory constructor.
  final settings1 = Settings();
  final settings2 = Settings();

  print('Settings 1 theme: ${settings1.theme}');
  print('Settings 2 theme: ${settings2.theme}');

  // Check whether both variables refer to the same object.
  print('Are they the same instance? ${identical(settings1, settings2)}');

  // Change the value through the first object.
  settings1.theme = 'dark';

  // The second object sees the same change.
  print('Settings 2 theme after change: ${settings2.theme}');

  print('');
}

// ==================================================
// MAIN
// ==================================================

Future<void> main() async {
  print('========== ADVANCED DART PRACTICE LAB ==========\n');

  await exercise1();
  await exercise2();
  await exercise3();
  await exercise4();
  exercise5();

  print('========== ALL EXERCISES COMPLETED ==========');
}