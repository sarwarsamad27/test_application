// ignore_for_file: file_names

import 'package:application/barrelView/barrlView.dart';

class InitializeProvider {
  static List<SingleChildWidget> createChangeNotifierProvider = [
    ChangeNotifierProvider(create: (_) => LoginController(AuthRepository())),
    ChangeNotifierProvider(create: (_) => HomescreenController()),
    ChangeNotifierProvider(
        create: (_) => ProductController(ProductRepository())),
    ChangeNotifierProvider(create: (context) => CartController()),
  ];
}
