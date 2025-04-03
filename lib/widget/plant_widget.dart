import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_application/const/constants.dart';
import 'package:plant_application/models/plant.dart';
import 'package:plant_application/screens/details_page.dart';

class NewPlantWidget extends StatelessWidget {
  final List<Plant> plantList;
  final int index;
  const NewPlantWidget({
    super.key,
    required this.plantList,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
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
                  child: Image.asset('assets/images/PriceUnit-green.png'),
                ),
                SizedBox(width: 5),
                Text(
                  plantList[index].price.toString(),
                  style: TextStyle(
                    color: Constants.primaryColor.withOpacity(0.8),
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
                    color: Constants.primaryColor.withOpacity(0.8),
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
                        style: TextStyle(fontFamily: 'yekan', fontSize: 13.0),
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
  }
}
