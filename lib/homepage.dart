import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlantInfoScreen extends StatefulWidget {
  @override
  _PlantInfoScreenState createState() => _PlantInfoScreenState();
}

class _PlantInfoScreenState extends State<PlantInfoScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 8),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onWaterDropButtonPressed() {
    _controller.forward(from: 0.0);
    print("Watering starts");
  }

  void _onReverseButtonPressed() {
    _controller.reverse();
    print("watering stops");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'image/plant5.png', // Add your plant image here
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 30,),
          Positioned(
            top:510,
            bottom:20,
            left:150,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: _onWaterDropButtonPressed,
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                  ),
                  child: Icon(Icons.water_drop_sharp, size: 30),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _onReverseButtonPressed,
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                  ),
                  child: Icon(Icons.stop_rounded, size: 30),
                ),
              ],
            ),
          ),
          IgnorePointer(
            child: SlideTransition(
              position: _slideAnimation,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.lightBlueAccent.withOpacity(0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
