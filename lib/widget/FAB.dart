import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildFAB() =>  AnimatedContainer(
  duration: const Duration(milliseconds: 200),
  curve: Curves.linear, height: 60, width: 50,
  decoration: const BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.purple
  ),
  child:   FloatingActionButton.extended(
  backgroundColor: Colors.transparent,
      onPressed: (){},
  elevation: 0,
      icon: const Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: Icon(Icons.flight_land,

          color: Colors.white,

          size: 28,),
      ),
  
      label: const SizedBox(),
  )
);