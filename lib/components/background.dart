import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Background extends StatefulWidget {
  final Widget child;
  final int type;

  const Background({
    Key? key,
    required this.child,
    required this.type,
  }) : super(key: key);

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height,
      child: ListView(
        children: [
          Container(
            height: size.height,

            child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: 25,
                right: 10,
                child: Container(
                  width: size.width* 0.35,
                  height: size.width* 0.35,
                    child: SvgPicture.asset(widget.type == 2 ? "assets/images/login.svg":(widget.type == 1 ? "assets/images/Welcome.svg" : "assets/images/Forgotpassword.svg")))
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Image.asset(
                  "assets/images/top2.png",
                  width: size.width,
                  color: Colors.pinkAccent,

                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  "assets/images/bottom1.png",
                  width: size.width,
                  color: Colors.pinkAccent,
                )
                ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  "assets/images/bottom2.png",
                  width: size.width,
                  color: Colors.pinkAccent,

                ),
              ),
              widget.child
            ],
        ),
          ),
      ]
      ),
    );
  }
}