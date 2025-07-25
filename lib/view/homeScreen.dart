// ignore_for_file: file_names

import 'package:application/barrelView/barrlView.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomescreenController>(context);
    return Scaffold(
      body: PageView(
        controller: provider.pageController,
        onPageChanged: provider.changeBottom,
        children: provider.bottomScreens,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: const <Widget>[
          Icon(
            Icons.explore,
            color: Colors.white,
          ),
          Icon(
            Icons.favorite,
            color: Colors.white,
          ),
        ],
        index: provider.currentIndex,
        height: 60.0,
        color: const Color(0xffdf762e),
        // buttonBackgroundColor: Colors.black26,
        backgroundColor: const Color(0xffdf762e),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: provider.changeBottom,
        letIndexChange: (index) => true,
      ),
    );
  }
}
