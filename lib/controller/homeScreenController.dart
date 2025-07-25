// ignore_for_file: file_names

import 'package:application/barrelView/barrlView.dart';

class HomescreenController with ChangeNotifier {
  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);
  num totalPrice = 0;
  List<Widget> bottomScreens = [
    const ProductListScreen(),
    const FavouriteScreen(),
  ];

  List<String> titles = [
    'Home',
    'Favorites',
  ];

  // List<ProductsModel> cartItems = [];

  // Change the selected bottom navigation index
  void changeBottom(int index) {
    currentIndex = index;
    pageController.jumpToPage(index);
    notifyListeners();
  }
}
