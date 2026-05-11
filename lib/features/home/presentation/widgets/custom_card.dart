import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),

      child: Stack(
        children: [
          Positioned(top: 8, left: 40, child: Text('dndnnd')),
          Positioned(
            right: 10,
            top: 15,
            child: CircleAvatar(radius: 30, child: Icon(Icons.favorite)),
          ),

          Positioned(bottom: 30, left: 40, child: Text('snnsss,ms')),
          Positioned(bottom: 15, left: 40, child: Text('snnsss,ms')),
        ],
      ),
    );
  }
}
