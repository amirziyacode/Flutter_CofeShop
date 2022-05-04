import 'package:another_transformer_page_view/another_transformer_page_view.dart';
import 'package:coffe/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TransformerPageController controller = TransformerPageController();

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: we,
        height: he,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/background-coffee.jpeg"),
                fit: BoxFit.cover)),
        child: Stack(alignment: Alignment.center, children: [
          TransformerPageView(
            physics: const BouncingScrollPhysics(),
              transformer: ScaleAndFadeTransformer(),
              pageController: controller,
              itemBuilder: (c, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: he * 0.12,
                    ),
                    Text(
                        "Enjoy quality brew \n with the finest of \n          flavors 🔥",
                        style: GoogleFonts.lato(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            color: Colors.white)),
                    SizedBox(height: he * 0.5),
                    const Text(
                      "The best of its kind you can ever get with \n           exquisite and quality flavors",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                );
              },
              itemCount: 3),
          Positioned(
            left: we * 0.42,
            top: he * .84,
            child: SmoothPageIndicator(
              count: 3,
              effect: const ExpandingDotsEffect(
                  activeDotColor: Colors.orangeAccent,
                  dotHeight: 9.5,
                  dotWidth: 9.5,
                  dotColor: Colors.white),
              controller: controller,
            ),
          ),
          SizedBox(
            height: he * 0.01,
          ),
          Positioned(
            left: we * 0.12,
            top: he * 0.89,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: const CoffeePage(), type: PageTransitionType.fade));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent,
                    padding:  EdgeInsets.symmetric(
                        horizontal: we * 0.3, vertical: 25),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
                child: const Text("Get Started",
                    style: TextStyle(color: Colors.white))),
          ),
        ]),
      ),
    );
  }
}

class ScaleAndFadeTransformer extends PageTransformer {
  final double _scale;
  final double _fade;

  ScaleAndFadeTransformer({double fade: 0.2, double scale: 0.8})
      : _fade = fade,
        _scale = scale;

  @override
  Widget transform(Widget item, TransformInfo info) {
    double? position = info.position;
    // double scaleFactor = (1 - position!.abs()) * (1 - _scale);
    // double fadeFactor = (1 - position!.abs()) * (1 - _fade);
    double opacity = (1 - position!.abs()) * 1;
    // double scale = _scale + scaleFactor;
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 800),
      opacity: opacity,
      child: item,
    );
  }
}
