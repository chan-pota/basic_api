import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class Workout extends StatefulWidget {
  
  final detail;
  const Workout({required this.detail});

  @override
  State<Workout> createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
      title: Text('Workout'),
        gradient: LinearGradient(colors: [Colors.blue, Colors.purple, Colors.red])
       ),
      body: ListView(
        children: [
          Text(widget.detail)
        ],
      )
    );
  }
}