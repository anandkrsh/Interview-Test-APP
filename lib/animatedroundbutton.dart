import 'dart:math' as math;

import 'package:flutter/material.dart';
typedef callback = void Function(int);

class AnimatedRoundExpandableButton extends StatefulWidget {

  callback? calbackevent;
  Widget? mainviewwidget;
  AnimatedRoundExpandableButton({Key? key, this.calbackevent ,this.mainviewwidget}) : super(key: key);

  @override
  tempanimated_fabstate createState() =>  tempanimated_fabstate();
}

class tempanimated_fabstate extends State<AnimatedRoundExpandableButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  final double expandedSize = 180.0;
  final double hiddenSize = 20.0;
  Offset? position ;

  @override
  void initState() {
    super.initState();
    position = Offset(0.0, 100);

    _animationController =  AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));

  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return dragfloatbutton();

  }
  Widget dragfloatbutton(){
    return  SizedBox(
      width: expandedSize,
      height: expandedSize,
      child:  AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget? child) {
          return  Stack(
            alignment: Alignment.center,
            children: <Widget>[
              _buildExpandedBackground(),
              _buildOption(Icons.send, 0.0,1,"En"),
              _buildOption(Icons.save_alt, -math.pi / 2,2,""),
              _buildOption(Icons.volunteer_activism, math.pi ,3,"Sp"),
              _buildFabCore(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildOption(IconData icon, double angle, int index ,String count) {
    if (_animationController.isDismissed) {
      return Container();
    }
    double iconSize = 0.0;
    if (_animationController.value > 0.8) {
      iconSize = 30.0 * (_animationController.value - 0.8) * 5;
    }
    return Transform.rotate(
      angle: angle,
      child:  Align(
        alignment: Alignment.topCenter,
        child:  Padding(
          padding:  EdgeInsets.only(top: 8.0),
          child: count == "" ?  IconButton(
            onPressed:(){
              _onIconClick(index);
            },
            icon:  Transform.rotate(
              angle: -angle,
              child:  Icon(
                icon,
                color: Colors.white,
              ),
            ),
            iconSize: iconSize,
            alignment: Alignment.center,
            padding:  EdgeInsets.all(0.0),
          ) : GestureDetector(
            onTap: (){
              _onIconClick(index);
            },
            child:  Transform.rotate(
              angle: angle,
              child: Text(count , style: TextStyle(fontSize: iconSize-2 , color: Colors.white),),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExpandedBackground() {
    double size =
        hiddenSize + (expandedSize - hiddenSize) * _animationController.value;
    return  Container(
      height: size,
      width: size,
      decoration:  BoxDecoration(shape: BoxShape.circle, color: Colors.black54),
    );
  }

  Widget _buildFabCore() {
    double scaleFactor = 2 * (_animationController.value - 0.5).abs();
    return  FloatingActionButton(
      heroTag: null,
      onPressed: _onFabTap,
      child:  Transform(
        alignment: Alignment.center,
        transform:  Matrix4.identity()..scale(1.0, scaleFactor),
        child:  AnimatedIcon(
          //_animationController.value > 0.5 ? Icons.close : Icons.filter_list,
          color: Colors.white,
          size: 36.0, icon: AnimatedIcons.menu_close, progress: _animationController,
        ),
      ),
      backgroundColor: Colors.black54,
    );
  }

  open() {
    if (_animationController.isDismissed) {
      _animationController.forward();
    }
  }

  close() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
    }
  }

  _onFabTap() {
    if (_animationController.isDismissed) {
      open();
    } else {
      close();
    }
  }

  _onIconClick(int index) {
    widget.calbackevent!(index);
    close();
  }
}
