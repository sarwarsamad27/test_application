// ignore_for_file: file_names, avoid_types_as_parameter_names

import 'package:application/barrelView/barrlView.dart';

class CartController extends ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(CartItem item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(String id) {
    _cartItems.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  double get totalPrice => _cartItems.fold(0, (sum, item) => sum + item.price);

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
