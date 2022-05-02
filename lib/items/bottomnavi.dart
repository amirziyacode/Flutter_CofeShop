import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';

enum Coffee {
  home,
  heart,
  apps,
}

class BottomNavigation extends StatefulWidget {
  BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  AnimationController? _controller;

  int selectedindex = 0;
  Coffee selected = Coffee.home;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller!)..addListener(() {
      setState(() {
        
      });
    });
    _controller!.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () {
                setState(() {
                  selected = Coffee.home;
                });
                _controller!.reset();
                _controller!.forward();
              },
              child: _buildWidgetcont(
                "images/icons8-home-144.png",
                23,
                23,
                selected == Coffee.home ? Colors.orange : Colors.black,
                selected == Coffee.home ? Colors.orange : Colors.white,
              )),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.23,
          ),
          GestureDetector(
              onTap: () {
                setState(() {
                  selected = Coffee.heart;
                });
                _controller!.reset();
                _controller!.forward();
              },
              child: _buildWidgetcont(
                "images/icons8-heart-100.png",
                25,
                25,
                selected == Coffee.heart ? Colors.orange : Colors.black,
                selected == Coffee.heart ? Colors.orange : Colors.white,
              )),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.23,
          ),
          GestureDetector(
              onTap: () {
                setState(() {
                  selected = Coffee.apps;
                });
                _controller!.reset();
                _controller!.forward();
              },
              child: _buildWidgetcont(
                "images/icons8-apps-64.png",
                22,
                22,
                selected == Coffee.apps ? Colors.orange : Colors.black,
                selected == Coffee.apps ? Colors.orange : Colors.white,
              )),
        ],
      ),
    );
  }

  Widget _buildWidgetcont(
    String image,
    double width,
    double height,
    Color coloricon,
    Color colorcircle,
  ) {
    return Column(
      children: [
        Image.asset(
          image,
          width: width,
          height: height,
          color: coloricon,
        ),
        const SizedBox(
          height: 10,
        ),
        FadeTransition(
          opacity: _animation,
          child: Container(
            width: 7,
            height: 7,
            decoration:
                BoxDecoration(color: colorcircle, shape: BoxShape.circle),
          ),
        )
      ],
    );
  }
}
