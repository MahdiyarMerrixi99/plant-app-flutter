import 'package:flutter/material.dart';
import 'package:plant_application/const/constants.dart';

// import 'package:plant_application/screens/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _HomePageState();
}

class _HomePageState extends State<SplashScreen> {
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      height: 10.0,
      width: isActive ? 20.0 : 8.0,
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        color: Constants.primaryColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 3; i++) {
      if (currentPage == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }

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
                title: Constants.titleOne,
                description: Constants.descriptionOne,
                image: 'assets/images/plant-one.png',
              ),
              CreatePage(
                title: Constants.titleTwo,
                description: Constants.descriptionTwo,
                image: 'assets/images/plant-two.png',
              ),
              CreatePage(
                title: Constants.titlethree,
                description: Constants.titlethree,
                image: 'assets/images/plant-three.png',
              ),
            ],
          ),
          Positioned(
            bottom: 80,
            left: 30,
            child: Row(children: _buildIndicator()),
          ),
          Positioned(
            right: 30,
            bottom: 60,
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Constants.primaryColor,
              ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if (currentPage < 2) {
                      currentPage++;
                      if (currentPage < 3) {
                        pageController.nextPage(
                          duration: Duration(seconds: 1),
                          curve: Curves.easeIn,
                        );
                      }
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Login();
                          },
                        ),
                      );
                    }
                  });
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar());
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
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 80),
      child: Column(
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
              color: Constants.primaryColor,
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
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
