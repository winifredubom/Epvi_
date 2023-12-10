import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildExtendedFAB() => AnimatedContainer(
  duration: const Duration(milliseconds: 200),
  curve: Curves.linear,
  width: 250, height: 50,
  child:   FloatingActionButton.extended(
backgroundColor: Colors.purple,
      onPressed: (){},

    icon: const Icon(Icons.flight_land,

      color: Colors.white,

      size: 32,),

      label: Row(

        children: [

          const Text("SEARCH FOR FLIGHTS",

            style: TextStyle(

              fontSize: 20.0,

              color: Colors.white,

            ),),

          Container(

            padding: const EdgeInsets.symmetric(

                horizontal: 12, vertical: 8),

            width: 70,

            height: 30,

            decoration: const BoxDecoration(

                borderRadius: BorderRadius.all(Radius.circular(

                    26),),

                color: Colors.green

            ),

            child: const Text(

              'ON SALE',

              style: TextStyle(

                fontSize: 10,

                fontWeight: FontWeight.bold,

                color: Colors.white,

              ),

            ),

          ),

        ],

      ),



  ),
);