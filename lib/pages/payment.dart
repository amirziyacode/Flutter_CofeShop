import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import 'homepage.dart';

class Paymentpage extends StatefulWidget {
  const Paymentpage({Key? key}) : super(key: key);

  @override
  _PaymentpageState createState() => _PaymentpageState();
}

class _PaymentpageState extends State<Paymentpage>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.stop();
        }
      });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: we,
          height: he,
          child: Column(
            children: [
              Lottie.asset("images/98454-success.json",
                  width: 300, controller: _animation),
              SizedBox(
                height: he * 0.03,
              ),
              FadeIn(
                delay: const Duration(milliseconds: 600),
                child: Text(
                  "Your order has been successfully",
                  style: GoogleFonts.lato(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: he * 0.01,
              ),
              FadeIn(
                delay: const Duration(milliseconds: 800),
                child: const Text(
                    '         Thank you you ❤️\nget two start for your order'),
              ),
              Expanded(
                child: SizedBox(
                  height: he * 0.35,
                ),
              ),
              FadeIn(
                  delay: const Duration(milliseconds: 1000),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: const CoffeePage(),
                                  type: PageTransitionType.fade));
                        },
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF4FE581),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            padding: const EdgeInsets.symmetric(
                                vertical: 25, horizontal: 150)),
                        child: FadeIn(
                          delay: const Duration(milliseconds: 1200),
                          child: const Text(
                            "BACK :)",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
