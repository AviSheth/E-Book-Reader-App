/*
import 'package:flutter/material.dart';


class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Intro.png',
                height: 150,
              ),
              SizedBox(height: 50),
              Text(
                'Keep reading,',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "You'll fall in love",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Colors.blueGrey,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "A library of bite-sized business EBooks on soft skills in various languages with an easy and simple monthly subscription and read anywhere, any devices.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blueGrey[700],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  //Navigator.pushNamed(context,'/home');
                  },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Start your journey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 20),
          CircleAvatar(
            backgroundColor: Colors.redAccent,
            radius: 20,
            child: IconButton(onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/LoginPage', (route) => false);

            },
              icon: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with TickerProviderStateMixin {
  late final AnimationController _imageController;
  late final AnimationController _textController;
  late final AnimationController _paragraphController;
  late final AnimationController _buttonController;
  late final AnimationController _iconController;

  late final Animation<double> _imageFade;
  late final Animation<Offset> _headlineSlide;
  late final Animation<double> _subheadingFade;
  late final Animation<double> _paragraphScale;
  late final Animation<Offset> _buttonSlide;
  late final Animation<double> _iconFade;

  @override
  void initState() {
    super.initState();

    // Image fade
    _imageController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _imageFade = Tween<double>(begin: 0.0, end: 1.0).animate(_imageController);

    // Headline slide from bottom
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _headlineSlide = Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero)
        .animate(CurvedAnimation(parent: _textController, curve: Curves.easeOut));
    _subheadingFade = Tween<double>(begin: 0.0, end: 1.0).animate(_textController);

    // Paragraph scale
    _paragraphController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _paragraphScale = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _paragraphController, curve: Curves.easeOut),
    );

    // Button slide from left
    _buttonController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _buttonSlide = Tween<Offset>(begin: const Offset(-1.5, 0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _buttonController, curve: Curves.easeOut));

    // Icon fade in
    _iconController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _iconFade = Tween<double>(begin: 0.0, end: 1.0).animate(_iconController);

    // Sequentially start animations with delays
    _startAnimations();
  }

  Future<void> _startAnimations() async {
    await _imageController.forward();
    await _textController.forward();
    await _paragraphController.forward();
    await _buttonController.forward();
    await _iconController.forward();
  }

  @override
  void dispose() {
    _imageController.dispose();
    _textController.dispose();
    _paragraphController.dispose();
    _buttonController.dispose();
    _iconController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView( // in case of small screens
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeTransition(
                  opacity: _imageFade,
                  child: Image.asset(
                    'assets/images/Intro.png',
                    height: 150,
                  ),
                ),
                const SizedBox(height: 50),

                SlideTransition(
                  position: _headlineSlide,
                  child: const Text(
                    'Keep reading,',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                FadeTransition(
                  opacity: _subheadingFade,
                  child: const Text(
                    "You'll fall in love",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                ScaleTransition(
                  scale: _paragraphScale,
                  child: Text(
                    "A library of bite-sized business EBooks on soft skills in various languages with an easy and simple monthly subscription and read anywhere, any devices.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blueGrey[700],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                SlideTransition(
                  position: _buttonSlide,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, '/home');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Start your journey',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                FadeTransition(
                  opacity: _iconFade,
                  child: CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    radius: 20,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/LoginPage', (route) => false);
                      },
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
