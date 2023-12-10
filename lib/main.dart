import 'package:flutter/material.dart';
import 'package:test/model/card_model.dart';

void main() {
  runApp(const TestWidget());
}

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<CardModel> cards = [
    CardModel(
        cardImge: 'assets/img3.png',
        rating: 'Top 3',
        strokColor: Colors.purpleAccent,
        userImge: "assets/p2.jpg",
        userName: "Player 66"),
    CardModel(
        cardImge: 'assets/img1.png',
        rating: 'Top 2',
        strokColor: Colors.brown.withOpacity(0.5),
        userImge: "assets/p2.jpg",
        userName: "Player 44"),
    CardModel(
        ratingColor: Colors.cyan,
        cardImge: 'assets/img2.png',
        rating: 'Top 1',
        strokColor: Colors.amber,
        userImge: "assets/p2.jpg",
        userName: "Player 22")
  ];
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            TopCard(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                cardModel: cards[1]),
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: TopCard(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  cardModel: cards[2]),
            ),
            TopCard(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                cardModel: cards[0]),
          ]),
        ));
  }
}

class TopCard extends StatelessWidget {
  const TopCard({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.cardModel,
  });

  final double screenHeight;
  final double screenWidth;
  final CardModel cardModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        Card(
          color: Colors.black.withOpacity(0),
          borderOnForeground: false,
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(cardModel.cardImge), fit: BoxFit.fill)),
            height: screenHeight * 0.2,
            width: screenWidth * 0.28,
          ),
        ),
        Positioned(
          top: -40,
          child: Container(
            height: screenWidth * 0.25,
            width: screenWidth * 0.25,
            // color: Colors.yellow,
            decoration: BoxDecoration(
              border: Border.all(color: cardModel.strokColor, width: 3),
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(cardModel.userImge),
              ),
            ),
          ),
        ),
        Positioned(
          top: 75,
          child: Text(cardModel.rating,
              style: TextStyle(
                color: cardModel.ratingColor ?? Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )),
        ),
        Positioned(
          top: 110,
          child: Text(cardModel.userName,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
        ),
      ],
    );
  }
}
