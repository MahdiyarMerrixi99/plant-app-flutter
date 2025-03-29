import 'package:flutter/material.dart';
import 'package:plant_application/const/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20, right: 20),
            child: InkWell(
              onTap: () {},
              child: Text(
                'رد کردن',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontFamily: 'lalezar',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          PageView(
            controller: pageController,
            reverse: false,
            onPageChanged: (int page) {
              setState(() {
                currentPage = page;
              });
            },
            children: <Widget>[
              CreatePage(
                title: Constance.titleOne,
                description: Constance.descriptionOne,
                image: 'assets/images/plant-one.png',
              ),
              CreatePage(
                title: Constance.titleTwo,
                description: Constance.descriptionTwo,
                image: 'assets/images/plant-two.png',
              ),
              CreatePage(
                title: Constance.titlethree,
                description: Constance.titlethree,
                image: 'assets/images/plant-three.png',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CreatePage extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  const CreatePage({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 350, width: 350, child: Image.asset(image)),
        SizedBox(height: 20),
        Text(
          textAlign: TextAlign.center,
          title,
          style: TextStyle(
            fontFamily: 'yekan',
            fontSize: 25,

            color: Constance.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 70, maxWidth: 300),
          child: Text(
            textAlign: TextAlign.center,
            description,
            style: TextStyle(
              fontFamily: 'iransans',
              fontSize: 20,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
