import 'package:flutter/material.dart';
import 'package:plant_application/const/constants.dart';
import 'package:plant_application/models/plant.dart';
import 'package:plant_application/widget/extensions.dart';

class DetailPage extends StatefulWidget {
  final int plantId;
  const DetailPage({super.key, required this.plantId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool toggleIsFavorit(bool isFavorites) {
    return !isFavorites;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> planList = Plant.plantList;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // AppBar
          Positioned(
            top: 50.0,
            left: 20.0,
            right: 20.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  // X Button
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Constants.primaryColor.withOpacity(0.15),
                    ),
                    child: Icon(Icons.close, color: Constants.primaryColor),
                  ),
                ),
                //like Button
                GestureDetector(
                  onTap: () {
                    setState(() {
                      bool favorited = toggleIsFavorit(
                        planList[widget.plantId].isFavorated,
                      );
                      planList[widget.plantId].isFavorated = favorited;
                    });
                  },
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Constants.primaryColor.withOpacity(0.15),
                    ),

                    child:
                        planList[widget.plantId].isFavorated == true
                            ? Icon(
                              Icons.favorite,
                              color: Constants.primaryColor,
                            )
                            : Icon(Icons.favorite_border),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 120,
            right: 0.0,
            left: 0.0,
            child: Container(
              width: size.width * 0.8,
              height: size.height * 0.9,
              color: Colors.white,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 10,
                    right: 0.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        PlantFutured(
                          title: 'اندازه‌گیاه',
                          plantFutured: planList[widget.plantId].size,
                        ),
                        PlantFutured(
                          title: 'رطوبت‌هوا',
                          plantFutured:
                              planList[widget.plantId].humidity
                                  .toString()
                                  .farsiNumber,
                        ),
                        PlantFutured(
                          title: 'دمای‌نگهداری',
                          plantFutured:
                              planList[widget.plantId].temperature
                                  .toString()
                                  .farsiNumber,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 30,
                    child: SizedBox(
                      height: 350,
                      child: Image.asset(planList[widget.plantId].imageURL),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0.0,
                    bottom: 0.0,
                    child: Container(
                      padding: EdgeInsets.only(top: 80, left: 20, right: 20),
                      height: size.height * 0.54,
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                        color: Constants.primaryColor.withOpacity(0.5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            planList[widget.plantId].plantName,
                            style: TextStyle(
                              fontFamily: 'Lalezar',
                              color: Constants.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    size: 30.0,
                                    color: Constants.primaryColor,
                                  ),
                                  Text(
                                    planList[widget.plantId].rating
                                        .toString()
                                        .farsiNumber,
                                    style: TextStyle(
                                      fontFamily: 'Lalezar',
                                      color: Constants.primaryColor,
                                      fontSize: 23.0,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 19.0,
                                    child: Image.asset(
                                      'assets/images/PriceUnit-green.png',
                                    ),
                                  ),
                                  const SizedBox(width: 10.0),
                                  Text(
                                    planList[widget.plantId].price
                                        .toString()
                                        .farsiNumber,
                                    style: TextStyle(
                                      fontFamily: 'Lalezar',
                                      color: Constants.blackColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 15.0),
                          Text(
                            planList[widget.plantId].decription,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontFamily: 'iranSans',
                              color: Constants.blackColor.withOpacity(0.7),
                              height: 1.6,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: size.width * 0.9,
        height: 50.0,
        child: Row(
          children: [
            Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                color: Constants.primaryColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(50.0),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0.0, 1.1),
                    blurRadius: 5.0,
                    color: Constants.primaryColor.withOpacity(0.3),
                  ),
                ],
              ),
              child: const Icon(Icons.shopping_cart, color: Colors.white),
            ),
            const SizedBox(width: 20.0),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Constants.primaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0.0, 1.1),
                      blurRadius: 5.0,
                      color: Constants.primaryColor.withOpacity(0.3),
                    ),
                  ],
                ),
                child: Center(
                  child: const Text(
                    'افزودن به سبد خرید',
                    style: TextStyle(
                      fontFamily: 'Lalezar',
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlantFutured extends StatelessWidget {
  final String title;
  final String plantFutured;
  const PlantFutured({
    super.key,
    required this.title,
    required this.plantFutured,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: EdgeInsets.only(right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Constants.blackColor,
                fontFamily: 'lalezar',
                fontSize: 18,
              ),
            ),
            Text(
              plantFutured,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Constants.primaryColor.withOpacity(0.95),
                fontFamily: 'lalezar',
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
