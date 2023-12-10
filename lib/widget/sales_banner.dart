import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class sales_banner extends StatelessWidget {
  const sales_banner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 12, vertical: 10),
      width: 70,
      height: 30,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20),),
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
    );
  }
}


