import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_restaurant/models/food.dart';
import 'package:sushi_restaurant/models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key,});

  @override
  Widget build(BuildContext context) {

    void removeFromCart(Food food){
      final user = context.read<Shop>();
      user.removeItemFromCart(food);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.pink,
          title: Text(
            'Successfully Delete From Cart cart',
            style: GoogleFonts.aBeeZee(color: Colors.white),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('My Cart'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[200],
      body: Expanded(
          child: Consumer<Shop>(
            builder: (context,value,child) {
              return ListView.builder(
                  itemCount: value.userCart.length,
                  itemBuilder: (context, index) {
                    final eachFood = value.userCart[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.only(left: 20,right: 20,top: 15),
                      child: Row(
                        children: [
                          Image.asset(eachFood.imagePath,height: 60,),
                          const SizedBox(width: 15,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(eachFood.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                              Text("\$${eachFood.price}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.grey[600]),),
                            ],
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () => removeFromCart(eachFood),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: EdgeInsets.all(12),
                              child: Icon(Icons.delete_forever_outlined,color: Colors.pink,),
                            ),
                          )
                        ],
                      ),
                    );
               }
             );
            }
          ),
      ),
    );
  }
}
