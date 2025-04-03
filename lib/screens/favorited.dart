import 'package:flutter/material.dart';
import 'package:plant_application/const/constants.dart';
import 'package:plant_application/models/plant.dart';
import 'package:plant_application/widget/plant_widget.dart';

class FavoritedPage extends StatefulWidget {
  final List<Plant> favoirtedPlants;
  const FavoritedPage({super.key, required this.favoirtedPlants});

  @override
  State<FavoritedPage> createState() => _FavoritedPageState();
}

class _FavoritedPageState extends State<FavoritedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
          widget.favoirtedPlants.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 130,
                      child: Image.asset('assets/images/favorited.png'),
                    ),
                    Text(
                      'ظاهرا بی چیزی علاقه نداشتی',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'lalezar',
                        color: Constants.blackColor,
                      ),
                    ),
                  ],
                ),
              )
              : Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: widget.favoirtedPlants.length,
                  itemBuilder: (context, index) {
                    return NewPlantWidget(
                      plantList: widget.favoirtedPlants,
                      index: index,
                    );
                  },
                ),
              ),
    );
  }
}
