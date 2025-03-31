import 'package:flutter/material.dart';
import 'package:plant_application/const/constants.dart';
import 'package:plant_application/models/plant.dart';

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
                  return Container(
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
                              onPressed: () {},
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
