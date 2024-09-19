import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop Attendant Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(color: Colors.deepPurple),
          bodyMedium: TextStyle(color: Colors.black),
        ),

        useMaterial3: true,
      ),

      home: const MyHomePage(title: 'Balex Shop Aid Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _productController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  String _totalPrice = '';

  void _calculateTotal() {
    double unitPrice = double.tryParse(_priceController.text) ?? 0;
    int quantity = int.tryParse(_quantityController.text) ?? 0;
    double totalPrice = unitPrice * quantity;

    setState(() {
      _totalPrice = totalPrice.toStringAsFixed(2);
    });
  }

  void _clearFields() {
    setState(() {
      _productController.clear();
      _priceController.clear();
      _quantityController.clear();
      _totalPrice = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            // Add a logo image (ensure the image is added to the project)
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/logo.png'), // Balex Avatar
            ),


            const SizedBox(height: 20),
            TextField(
              controller: _productController,
              decoration: InputDecoration(
                labelText: 'Product Name',
                labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                ),

              ),

            ),

            const SizedBox(height: 20),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(
                labelText: 'Unit Price',
                labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                ),

              ),

              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _quantityController,
              decoration: InputDecoration(
                labelText: 'Quantity',
                labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                ),

              ),

              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateTotal,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Calculate Total'),
            ),


            const SizedBox(height: 20),
            Text(
              _totalPrice.isEmpty ? 'Total: \UGX0.00' : 'Total: \$$_totalPrice',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _clearFields,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Clear'),
            ),

          ],
        ),
      ),
    );
  }
}
