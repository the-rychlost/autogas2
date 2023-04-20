// level.dart

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class GasLevel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('GAS LEVEL',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQue1HwZuH1_EFB6o3bd5h7ryL3lGmb4T2gnw&usqp=CAU',
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20.0),
              CircularPercentIndicator(
                radius: 120.0,
                lineWidth: 10.0,
                percent: 0.8,
                center: const Text(
                  '80%',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                progressColor: Colors.lightGreen,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
