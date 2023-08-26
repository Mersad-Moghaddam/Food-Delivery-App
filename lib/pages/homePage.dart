import 'package:flutter/material.dart';
import 'package:food_delivery/Animation/FadeAnimation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = ["Pizza", "Burgers", "Kebab", "Desert", "Salad"];
  List<dynamic> foods = [
    {
      "image":
          "/Users/mersad/Desktop/Flutter/Flutter-Food-Delivery/food_delivery/lib/assets/images/pizza1.jpg",
      "isFavorite": false,
    },
    {
      "image":
          "/Users/mersad/Desktop/Flutter/Flutter-Food-Delivery/food_delivery/lib/assets/images/pizza2.jpg",
      "isFavorite": false,
    },
    {
      "image":
          "/Users/mersad/Desktop/Flutter/Flutter-Food-Delivery/food_delivery/lib/assets/images/pizza3.jpg",
      "isFavorite": false,
    }
  ];

  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "/Users/mersad/Desktop/Flutter/Flutter-Food-Delivery/food_delivery/lib/assets/images/three.jpg"),
                      fit: BoxFit.cover),
                  color: Colors.white54,
                ),
                child: Text(
                  "",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.home_outlined,
                  color: Colors.black,
                ),
                title: const Text(
                  "Home",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.settings_outlined,
                  color: Colors.black,
                ),
                title: const Text(
                  "Setting",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.fastfood_outlined,
                  color: Colors.black,
                ),
                title: const Text(
                  "Food",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                onTap: () {},
              )
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          elevation: 0,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FadeAnimation(
                  1,
                  Icon(
                    Icons.shopping_basket_outlined,
                    color: Colors.grey[800],
                    size: 25,
                  )),
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(
                        1,
                        Text(
                          "Food Delivery",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.grey[80]),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) => FadeAnimation(
                              1,
                              makeCategory(
                                  title: categories[index], index: index))),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              FadeAnimation(
                  1,
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "Free Delivery",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800]),
                    ),
                  )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foods.length,
                  itemBuilder: (context, index) => FadeAnimation(
                      1,
                      makeItem(
                          image: foods[index]["image"],
                          isFavorite: foods[index]["isFavorite"],
                          index: index)),
                ),
              )),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ));
  }

  Widget makeCategory({title, index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = index;
        });
      },
      child: AnimatedContainer(
        width: 120,
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color:
              selectedCategory == index ? Colors.yellow[700] : Colors.grey[300],
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color:
                    selectedCategory == index ? Colors.black : Colors.grey[700],
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  Widget makeItem({image, isFavorite, index}) {
    return AspectRatio(
      aspectRatio: 1 / 1.5,
      child: GestureDetector(
        child: Container(
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              )),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient:
                    LinearGradient(begin: Alignment.bottomCenter, stops: const [
                  .2,
                  .9
                ], colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.3),
                ])),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        foods[index]["isFavorite"] =
                            !foods[index]["isFavorite"];
                      });
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                width: 1.5,
                                color: isFavorite
                                    ? Colors.red
                                    : Colors.transparent,
                              )),
                          child: isFavorite
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                )),
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "\$ 15.00",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Vegetarian Pizza",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
