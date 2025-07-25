// ignore_for_file: file_names

import 'package:application/barrelView/barrlView.dart';

class AppPages {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      RoutesName.loginScreen: (context) => const Loginscreen(),
      RoutesName.homeScreen: (context) => const Homescreen(),
      RoutesName.addProductScreen: (context) => const AddProductScreen(),
      RoutesName.favouriteScreen: (context) => const FavouriteScreen(),
      RoutesName.productScreen: (context) => const ProductListScreen(),
    };
  }
}
