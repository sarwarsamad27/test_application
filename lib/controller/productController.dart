// ignore_for_file: file_names, use_build_context_synchronously

import 'package:application/repository/productRepository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductController extends ChangeNotifier {
  final ProductRepository _repo;

  ProductController(this._repo);

  final nameController = TextEditingController();
  final descController = TextEditingController();
  final priceController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool isLoading = false;

  void _showDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  Future<void> addProduct(BuildContext context) async {
    final name = nameController.text.trim();
    final desc = descController.text.trim();
    final price = double.tryParse(priceController.text.trim());

    if (name.isEmpty || desc.isEmpty || price == null) {
      _showDialog(
          context, "Invalid Input", "Please fill all fields correctly.");
      return;
    }

    isLoading = true;
    notifyListeners();

    try {
      await _repo.addProduct(name: name, description: desc, price: price);
      nameController.clear();
      descController.clear();
      priceController.clear();

      _showDialog(context, "Success", "Product added successfully!");

      Navigator.pop(context);

      // Delay pop after showing dialog
      Future.delayed(const Duration(milliseconds: 100), () {
        Navigator.pop(context); // Closes AddProductScreen
      });
    } catch (e) {
      _showDialog(context, "Error", "Something went wrong: ${e.toString()}");
    }

    isLoading = false;
    notifyListeners();
  }

  Stream<QuerySnapshot> getProductsStream() {
    return _firestore
        .collection('products')
        .orderBy('createdAt', descending: true)
        .snapshots();
  }
}
