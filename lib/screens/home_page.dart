import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_application/const/constants.dart';
import 'package:plant_application/models/plant.dart';
import 'package:plant_application/screens/details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final List<Plant> plantList = Plant.plantList;
  bool toggleIsFavorit(bool isFavorites) {
    return !isFavorites;
  }

  final List<String> _plantTypes = [
    '| پیشنهادی |',
    '| آپارتمانی |',
    '| محل‌کار |',
    '| گل باغچه‌ایی |',
    '| گل سمی |',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //search box
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Container(
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.mic),
                      Expanded(
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextField(
                            textAlign: TextAlign.start,
                            showCursor: false,
                            decoration: InputDecoration(
                              hintText: 'جست‌و‌جو...',
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            style: TextStyle(
                              fontFamily: 'iransans',
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Icon(Icons.search),
                    ],
                  ),
                ),
              ),
            ),

            //category
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 18.0,
                vertical: 10.0,
              ),
              height: 70.0,
              width: size.width,
              child: ListView.builder(
                reverse: true,
                scrollDirection: Axis.horizontal,
                itemCount: _plantTypes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Text(
                        _plantTypes[index],
                        style: TextStyle(
                          fontFamily: 'iranSans',
                          fontSize: 16.0,
                          fontWeight:
                              selectedIndex == index
                                  ? FontWeight.bold
                                  : FontWeight.w300,
                          color:
                              selectedIndex == index
                                  ? Constants.primaryColor
                                  : Constants.blackColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            //products
            SizedBox(
              height: size.height * 0.3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: plantList.length,
                reverse: false,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.bottomToTop,
                          child: DetailPage(plantId: plantList[index].plantId),
                        ),
                      );
                    },
                    child: Container(
                      width: 180,
                      margin: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Constants.primaryColor.withOpacity(0.5),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10,
                            right: 20,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    bool isFavorited = toggleIsFavorit(
                                      plantList[index].isFavorated,
                                    );
                                    plantList[index].isFavorated = isFavorited;
                                  });
                                },
                                icon: Icon(
                                  plantList[index].isFavorated == true
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color: Constants.primaryColor,
                                  size: 20.0,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 50.0,
                            right: 50.0,
                            top: 50.0,
                            bottom: 50.0,
                            child: Image.asset(plantList[index].imageURL),
                          ),
                          Positioned(
                            bottom: 15.0,
                            left: 20.0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                                vertical: 2.0,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Text(
                                r'$' + plantList[index].price.toString(),
                                style: TextStyle(
                                  color: Constants.primaryColor,
                                  fontSize: 16.0,
                                  fontFamily: 'Lalezar',
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 15.0,
                            right: 20.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  plantList[index].category,
                                  style: const TextStyle(
                                    fontFamily: 'YekanBakh',
                                    color: Colors.white70,
                                    fontSize: 14.0,
                                  ),
                                ),
                                Text(
                                  plantList[index].plantName,
                                  style: const TextStyle(
                                    fontFamily: 'YekanBakh',
                                    color: Colors.white70,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 18, top: 10, bottom: 15),
              child: Text(
                'گیاهان جدید',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: 'lalezar',
                ),
              ),
            ),

            //products2
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: size.height * 0.3,
              child: ListView.builder(
                itemCount: plantList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.bottomToTop,
                          child: DetailPage(plantId: plantList[index].plantId),
                        ),
                      );
                    },
                    child: Container(
                      height: 80,
                      margin: EdgeInsets.only(bottom: 10, top: 10),
                      padding: EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 20,
                                child: Image.asset(
                                  'assets/images/PriceUnit-green.png',
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                plantList[index].price.toString(),
                                style: TextStyle(
                                  color: Constants.primaryColor.withOpacity(
                                    0.8,
                                  ),
                                  fontSize: 20,
                                  fontFamily: 'lalezar',
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Constants.primaryColor.withOpacity(
                                    0.8,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                right: 5,
                                left: 5,
                                child: SizedBox(
                                  height: 75,
                                  child: Image.asset(plantList[index].imageURL),
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                right: 70,

                                child: Column(
                                  children: [
                                    Text(
                                      plantList[index].category,
                                      style: TextStyle(
                                        fontFamily: 'yekan',
                                        fontSize: 13.0,
                                      ),
                                    ),
                                    Text(
                                      plantList[index].plantName,
                                      style: TextStyle(
                                        fontFamily: 'yekan',
                                        fontSize: 18.0,
                                        color: Constants.blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
