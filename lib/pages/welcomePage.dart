import 'package:flutter/material.dart';
import 'package:food_delivery/Animation/FadeAnimation.dart';
import 'package:food_delivery/pages/homePage.dart';
import 'package:page_transition/page_transition.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _animation;

  bool _textVisible = true;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));

    _animation =
        Tween<double>(begin: 1.0, end: 35.0).animate(_animationController);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  void _onTap() {
    setState(() {
      _textVisible = false;
    });

    _animationController.forward().then((f) => Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.fade, child: const HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage(
                    "/Users/mersad/Desktop/Flutter/Flutter-Food-Delivery/food_delivery/lib/assets/images/one.jpg"),
                fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [
            Colors.black.withOpacity(0.9),
            Colors.black.withOpacity(0.8),
            Colors.black.withOpacity(0.3)
          ])),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const FadeAnimation(
                    0.5,
                    Text(
                      "Taking Order For Faster Delivery",
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                const SizedBox(
                  height: 20,
                ),
                const FadeAnimation(
                    0.8,
                    Text(
                      "See Restaurants nearby by adding your Location",
                      style: TextStyle(fontSize: 20, color: Colors.white54),
                    )),
                const SizedBox(
                  height: 100,
                ),
                FadeAnimation(
                    1,
                    ScaleTransition(
                      scale: _animation,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: const LinearGradient(colors: [
                              Colors.yellow,
                              Colors.amber,
                              Colors.orange
                            ])),
                        child: AnimatedOpacity(
                          opacity: _textVisible ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 50),
                          child: MaterialButton(
                            onPressed: () => _onTap(),
                            minWidth: double.infinity,
                            child: const Text(
                              "Start",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 30,
                ),
                FadeAnimation(
                    1.5,
                    AnimatedOpacity(
                      opacity: _textVisible ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 50),
                      child: const Align(
                        child: Text(
                          "Now Deliver To Your Door 24/7",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
