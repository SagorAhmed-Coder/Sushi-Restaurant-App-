import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_restaurant/models/food.dart';
import 'package:sushi_restaurant/models/quantity_controller.dart';
import 'package:sushi_restaurant/models/shop.dart';

class FoodDetailsPage extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  const FoodDetailsPage({super.key, required this.food,required this.onTap});

  @override
  Widget build(BuildContext context) {

    final howMuch = context.read<QuantityController>();
    final shop = context.read<Shop>();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Image.asset(food.imagePath, height: 200)),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow, size: 40),
                        Text(
                          food.rating,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      food.name,
                      style: GoogleFonts.bebasNeue(fontSize: 40),
                    ),
                    Text(
                      'Description',
                      style: GoogleFonts.aBeeZee(fontSize: 30),
                    ),
                    Text(
                      food.description,
                      style: TextStyle(color: Colors.grey[600], height: 2),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.pink),
            child: Consumer<QuantityController>(
              builder: (context,value,child) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.pink[800],
                              borderRadius: BorderRadius.circular(5),
                            ),
                              padding: EdgeInsets.all(10),
                              child: Text("\$${food.price}",style: TextStyle(fontSize: 24,color: Colors.white),)),
                        ),
                        Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.pink.shade200,
                                    shape: BoxShape.circle
                                ),
                                margin: EdgeInsets.all(12),
                                padding: EdgeInsets.all(5),
                                child: IconButton(onPressed: howMuch.decrement, icon: Icon(Icons.remove,color: Colors.white,))),
                            Center(child: SizedBox(width: 40,child: Text(howMuch.quantity.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 27),))),
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.pink.shade200,
                                    shape: BoxShape.circle
                                ),
                                margin: EdgeInsets.all(12),
                                padding: EdgeInsets.all(5),
                                child: IconButton(onPressed: howMuch.increment, icon: Icon(Icons.add,color: Colors.white,))),
                          ],
                        )
                      ],
                    ),
                   InkWell(
                     onTap:onTap,
                     child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.pink[400],
                            borderRadius: BorderRadius.circular(18),
                          ),
                          padding: EdgeInsets.all(13),
                          margin: EdgeInsets.all(10),
                          child: Center(child: Text('Add to cart',style: TextStyle(color: Colors.white,fontSize: 20),)),
                        ),
                   ),
                  ],
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
