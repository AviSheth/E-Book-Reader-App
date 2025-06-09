
import 'package:e_book_reader/Database/sharedPrefeHelper.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late SharedPrefHelper _sharedPrefHelper;
  late AnimationController _controller;
  late Animation<double> _animation;


  @override
  initState()  {
    super.initState();
    _checkLogin();

   _controller = AnimationController(
     duration: const Duration(seconds: 3),
     vsync: this,
   );

   _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
   _controller.forward();
  }

  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  Future<void> _checkLogin() async {
    _sharedPrefHelper = await SharedPrefHelper.getInstance();
    final isLoggedIn = _sharedPrefHelper.getIsLoggedIn();
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      if (isLoggedIn) {
        final userId = _sharedPrefHelper.getLoggedInUserId();
        if (userId != null) {
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          Navigator.pushReplacementNamed(context, '/introscreen');
        }
      } else {
        Navigator.pushReplacementNamed(context, '/introscreen');
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color : Colors.amber,
            padding: const EdgeInsets.symmetric(horizontal:10),
            child :FadeTransition(
                opacity: _animation,
              child: Image.asset(
                'assets/images/splash.png',
                //fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            )
          )
        ],
      ),
    );
  }
}
