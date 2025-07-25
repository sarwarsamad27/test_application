// ignore_for_file: file_names

import 'package:application/barrelView/barrlView.dart';

class ProductRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addProduct({
    required String name,
    required String description,
    required double price,
  }) async {
    await _firestore.collection('products').add({
      'name': name,
      'description': description,
      'price': price,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}
