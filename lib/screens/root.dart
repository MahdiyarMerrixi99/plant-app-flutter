import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_application/const/constants.dart';
import 'package:plant_application/models/plant.dart';
import 'package:plant_application/screens/cart_page.dart';
import 'package:plant_application/screens/favorited.dart';
import 'package:plant_application/screens/home_page.dart';
import 'package:plant_application/screens/profile_page.dart';
import 'package:plant_application/screens/scan_page.dart';

// ignore: must_be_immutable
class RootPage extends StatefulWidget {
  const RootPage({super.key});
  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<Plant> favorite = [];
  List<Plant> addToCart = [];
  int bootomIndex = 0;
  List<Widget> page() {
    return [
      HomePage(),
      FavoritedPage(favoirtedPlants: favorite),
      CartPage(addedToCartPlants: addToCart),
      ProfilePage(),
    ];
  }

  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];

  List<String> titleList = ['خانه', 'علاقه‌مندی‌ها', 'سبد‌خرید', 'پروفایل'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.notifications, color: Constants.blackColor, size: 30),
              Text(
                titleList[bootomIndex],
                style: TextStyle(
                  color: Constants.blackColor,
                  fontSize: 24,
                  fontFamily: 'lalezar',
                ),
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(index: bootomIndex, children: page()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.bottomToTop,
              child: ScanPage(),
            ),
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: Constants.primaryColor,
        child: Image.asset('assets/images/code-scan-two.png', height: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: bootomIndex,
        onTap: (index) {
          setState(() {
            bootomIndex = index;
            final List<Plant> favoritedPalnts = Plant.getFavoritedPlants();
            final List<Plant> addedToCartPalnts = Plant.addedToCartPlants();

            favorite = favoritedPalnts.toSet().toList();
            addToCart = addedToCartPalnts;
          });
        },
        splashColor: Constants.primaryColor,
        activeColor: Constants.primaryColor,
        inactiveColor: Constants.blackColor.withOpacity(0.5),
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
      ),
    );
  }
}
