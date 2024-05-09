import 'dart:io';

import 'package:flutter/material.dart';

class Shoe {
  final String image;
  final String name;
  final double price;

  Shoe(this.image, this.name, this.price);
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Sample shoe data
  final List<Shoe> shoes = [
    Shoe("https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/1c0c434c-9802-4556-89c7-a8600b2828d8/air-jordan-1-low-shoes-6Q1tFM.png", "Nike Air jordan", 8.795),
    Shoe("https://static.nike.com/a/images/t_prod_ss/w_640,c_limit,f_auto/9a6af1f9-9e6b-4c02-9b5b-c794e460fa99/women-s-air-peg-2k5-phantom-and-coconut-milk-fn7153-101-release-date.jpg", "Nike Air Pegasus 2005", 9.99),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Shoes"),
        ),
        body: ListView.builder(
          itemCount: shoes.length,
          itemBuilder: (context, index) {
            final shoe = shoes[index];
            return ShoeCard(shoe: shoe);
          },
        ),
      ),
    );
  }
}

class ShoeCard extends StatelessWidget {
  final Shoe shoe;

  ShoeCard({required this.shoe});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Add shoe to cart logic here (e.g., display dialog or navigate to cart screen)
        print("Selected shoe: ${shoe.name}");
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
               Image.network(
                shoe.image,
                width: 150,
                height: 150,
              ),
              SizedBox(width: 100),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shoe.name,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "\$${shoe.price.toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 18, color: Colors.green),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
