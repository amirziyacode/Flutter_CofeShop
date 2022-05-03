import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:coffe/model/itemscoffee.dart';
import 'package:coffe/pages/payment.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

enum Size {
  Small,
  Medium,
  Large,
}

class SellingPage extends StatefulWidget {
  ItemCoffee itemCoffee;
  SellingPage({Key? key, required this.itemCoffee}) : super(key: key);

  @override
  _SellingPageState createState() => _SellingPageState();
}

class _SellingPageState extends State<SellingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _priceofcoffee;

  Size selectedSize = Size.Small;
  int number = 40;
  double price = 0.5;
  int numercount = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _priceofcoffee = Tween(begin: 0.0, end: price).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    Timer(const Duration(milliseconds: 850), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        width: we,
        height: he,
        child: Stack(
          children: [
            Container(
              width: we * 12,
              height: he * 0.38,
              padding: EdgeInsets.only(bottom: we * 0.4),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70),
                    bottomRight: Radius.circular(65)),
                gradient: LinearGradient(
                    colors: [Color(0xFF613502), Color(0xFF3C1F0A)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                  ),
                  SizedBox(
                    width: we * 0.65,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: he * 0.47),
              child: Column(
                children: [
                  FadeIn(
                    delay: const Duration(milliseconds: 400),
                    child: Container(
                      width: 70,
                      height: 40,
                      margin: EdgeInsets.only(right: we * 0.75),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 16,
                          ),
                          SizedBox(
                            width: we * 0.02,
                          ),
                          Text(
                            widget.itemCoffee.star.toString(),
                            style: const TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: we * 0.04),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: he * 0.07,
                        ),
                        FadeIn(
                          delay: const Duration(milliseconds: 700),
                          child: Text(
                            widget.itemCoffee.name,
                            style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 32,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: we * 0.6,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: FadeIn(
                            delay: const Duration(milliseconds: 850),
                            child: Text(
                              "\$ ${(_priceofcoffee.value * number).round()}",
                              style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: he * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: we * .7),
                    child: FadeIn(
                      delay: const Duration(milliseconds: 950),
                      child: const Text(
                        "Coffe size",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: he * 0.012,
                  ),
                  FadeInRight(
                    delay: const Duration(seconds: 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = Size.Small;
                                numercount = 1;
                                number = 40;
                              });
                              _controller.reset();
                              _controller.forward();
                            },
                            child: _buildsized(
                                "Small",
                                selectedSize == Size.Small
                                    ? const Color(0xFFD59B6B)
                                    : Colors.grey.withOpacity(0.1),
                                selectedSize == Size.Small
                                    ? Colors.white
                                    : Colors.black)),
                        SizedBox(
                          width: we * 0.04,
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = Size.Medium;
                                numercount = 1;
                                number = 50;
                              });
                              _controller.reset();
                              _controller.forward();
                            },
                            child: _buildsized(
                                "Medium",
                                selectedSize == Size.Medium
                                    ? const Color(0xFFD59B6B)
                                    : Colors.grey.withOpacity(0.1),
                                selectedSize == Size.Medium
                                    ? Colors.white
                                    : Colors.black)),
                        SizedBox(
                          width: we * 0.04,
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = Size.Large;
                                numercount = 1;
                                number = 60;
                              });
                              _controller.reset();
                              _controller.forward();
                            },
                            child: _buildsized(
                                "Large",
                                selectedSize == Size.Large
                                    ? const Color(0xFFD59B6B)
                                    : Colors.grey.withOpacity(0.1),
                                selectedSize == Size.Large
                                    ? Colors.white
                                    : Colors.black)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: he * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: we * .77),
                    child: FadeIn(
                      delay: const Duration(milliseconds: 1500),
                      child: const Text(
                        "About",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: he * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: we * .27),
                    child: FadeIn(
                      delay: const Duration(milliseconds: 2000),
                      child: Text(
                          "${widget.itemCoffee.name}’s silky magic is\nbeyond the grasp of home baristas.It’s\njust too delicate"),
                    ),
                  ),
                  SizedBox(
                    height: he * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: we * 0.05,
                      ),
                      FadeIn(
                        delay: const Duration(milliseconds: 2500),
                        child: const Text(
                          "Volume",
                          style: TextStyle(fontSize: 17, color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        width: we * 0.02,
                      ),
                      FadeIn(
                        delay: const Duration(milliseconds: 2600),
                        child: Text(
                          "160 ml",
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      FadeInRight(
                        delay: const Duration(milliseconds: 2800),
                        child: Container(
                          width: 110,
                          margin: EdgeInsets.only(left: we * 0.32),
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(width: 2, color: Colors.grey)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  if (numercount > 1) {
                                    setState(() {
                                      numercount--;
                                      number ~/= 2;
                                    });
                                    _controller.reset();
                                    _controller.forward();
                                  }
                                },
                                child: const Icon(
                                  Icons.remove,
                                  size: 18,
                                ),
                              ),
                              SizedBox(
                                width: we * 0.04,
                              ),
                              Text(
                                numercount.toString(),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: we * 0.04,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    numercount++;
                                    number *= 2;
                                  });
                                  _controller.reset();
                                  _controller.forward();
                                },
                                child: const Icon(
                                  Icons.add,
                                  size: 18,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: SizedBox(height: he * 0.04)),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 19),
                    child: Row(
                      children: [
                        SizedBox(
                          width: we * 0.04,
                        ),
                        FadeIn(
                          delay: const Duration(milliseconds: 3000),
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 2,
                                    color: Colors.grey.withOpacity(0.2))),
                            child: const Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: we * 0.04,
                        ),
                        FadeIn(
                          delay: const Duration(milliseconds: 3200),
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    PageTransition(
                                        child: const Paymentpage(),
                                        type: PageTransitionType.fade));
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: const Color(0xFFD59B6B),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 22, horizontal: 110)),
                              child: FadeIn(
                                delay: const Duration(milliseconds: 3500),
                                child: const Text(
                                  "Buy now",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              left: 50,
              top: 90,
              child: Container(
                decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                    spreadRadius: 3,
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(2, 10),
                    blurRadius: 60,
                  )
                ]),
                child: Hero(
                  tag: widget.itemCoffee.image,
                  child: Image.asset(
                    widget.itemCoffee.image,
                    width: 300,
                    height: 300,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildsized(String text, Color coloricon, Color colortxt) {
    return Container(
      width: 105,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: coloricon, borderRadius: BorderRadius.circular(40)),
      child: Text(
        text,
        style: TextStyle(color: colortxt),
      ),
    );
  }
} //
