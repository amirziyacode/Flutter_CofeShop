import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:coffe/items/bottomnavi.dart';
import 'package:coffe/model/dataCoffee.dart';
import 'package:coffe/model/itemscoffee.dart';
import 'package:coffe/pages/sellpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeePage extends StatefulWidget {
  const CoffeePage({Key? key}) : super(key: key);

  @override
  _CoffeePageState createState() => _CoffeePageState();
}

class _CoffeePageState extends State<CoffeePage>
    with SingleTickerProviderStateMixin {
  late Animation<double> _volume;
  late Animation<double> _priceofcoffee;
  late AnimationController _controller;
  String icon = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _priceofcoffee = Tween(begin: 0.0, end: 0.5).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _volume = Tween(begin: 0.0, end: 0.7).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          FadeInDown(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage("images/Avatar.jpg"),
                    radius: 23,
                  ),
                  SizedBox(
                    width: we * 0.17,
                  ),
                  const Icon(
                    Icons.location_on_rounded,
                    color: Color(0xFFD09B6B),
                  ),
                  SizedBox(
                    width: we * 0.02,
                  ),
                  const Text(
                    "Lagos,",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const Text("Nigeria", style: TextStyle(color: Colors.black)),
                  SizedBox(
                    width: we * 0.27,
                  ),
                  const Icon(
                    Icons.notifications_none,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: SizedBox(
        width: we,
        height: he,
        child: Column(
          children: [
            SizedBox(
              height: he * 0.01,
            ),
            FadeInDown(
              child: Container(
                  width: we * 0.87,
                  height: he * 0.071,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    top: 5.0,
                  ),
                  // margin: const EdgeInsets.only(10.0),
                  child: Stack(
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: we * 0.68),
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Color(0xFFD09B6B), shape: BoxShape.circle),
                        child: const Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 30,
                        ),
                      )
                    ],
                  )),
            ),
            SizedBox(
              height: he * 0.01,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.only(left: 25),
                child: Text("Categories",
                    style: GoogleFonts.lato(
                      fontSize: 22,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              ),
            ),
            SizedBox(
              height: he * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FadeInRight(
                child: Container(
                  width: we * 2,
                  height: he * 0.054,
                  margin: const EdgeInsets.only(right: 10),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (c, i) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              icon = coffess[i].icocImage.toString();
                            });
                          },
                          child: Container(
                            width:
                                coffess[i].icocImage.length == 31 ? 180 : 140,
                            height: 78,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: icon == coffess[i].icocImage
                                    ? const Color(0xFFD59B6B)
                                    : Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(30)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    width: coffess[i].icocImage.length == 31
                                        ? 31
                                        : 20),
                                Image.asset(
                                  coffess[i].icocImage,
                                  color: icon == coffess[i].icocImage
                                      ? Colors.white
                                      : Colors.black,
                                  width: 30,
                                  height: 30,
                                ),
                                SizedBox(width: we * 0.02),
                                Expanded(
                                  child: Text(
                                    coffess[i].title,
                                    style: TextStyle(
                                        color: icon == coffess[i].icocImage
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: coffess.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: he * 0.57,
              child: Swiper(
                itemCount: items.length,
                scrollDirection: Axis.horizontal,
                viewportFraction: 0.8,
                onIndexChanged: (index) {
                  _controller.reset();
                  _controller.forward();
                },
                scale: 0.85,
                layout: SwiperLayout.DEFAULT,
                itemBuilder: (c, i) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Column(
                          children: <Widget>[
                            SizedBox(
                              height: he * 0.09,
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32)),
                              elevation: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFF613502),
                                          Color(0xFF3C1F0A)
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight),
                                    borderRadius: BorderRadius.circular(32)),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: he * 0.13,
                                      ),
                                      Text(
                                        items[i].name,
                                        style: const TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: he * 0.011,
                                      ),
                                      Container(
                                        width: 70,
                                        height: 40,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                              items[i].star.toString(),
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: he * 0.03,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Volume",
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.7)),
                                          ),
                                          SizedBox(
                                            width: we * 0.02,
                                          ),
                                          Text(
                                              "${(_volume.value * 229).round()} ml",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: he * 0.034,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            " \$ ${(_priceofcoffee.value * 40).round()}",
                                            style: const TextStyle(
                                                fontSize: 17,
                                                color: Colors.white),
                                          ),
                                          Expanded(
                                              flex: 1,
                                              child:
                                                  SizedBox(width: we * 0.28)),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  PageRouteBuilder(
                                                      pageBuilder: (c, a, b) =>
                                                          SellingPage(
                                                              itemCoffee:
                                                                  items[i])));
                                            },
                                            child: Container(
                                              width: 70,
                                              height: 70,
                                              decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle),
                                              child: const Icon(
                                                Icons.add,
                                                color: Colors.orangeAccent,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          left: 47,
                          child: Roulette(
                            delay: const Duration(milliseconds: 230),
                            child: Hero(
                              tag: items[i].image,
                              child: Image.asset(
                                items[i].image,
                                width: 200,
                                height: 200,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: FadeInUp(child: BottomNavigation()),
    );
  }
}
