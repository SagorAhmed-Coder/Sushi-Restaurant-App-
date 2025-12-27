import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_restaurant/models/food.dart';

class FoodTile extends StatelessWidget {
 final Food oneFood;
 final void Function()? onTap;
  const FoodTile({super.key,required this.oneFood,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 15,top: 5,bottom: 5),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(oneFood.imagePath,height: 110,),
            const SizedBox(height: 6,),
            Text(oneFood.name,style: GoogleFonts.actor(
              fontSize: 25,
            ),),
            Spacer(),
            Row(
              children: [
                Text("\$${oneFood.price}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                const SizedBox(width: 30,),
                Row(
                  children: [
                    Icon(Icons.star,color: Colors.yellow,),
                    Text(oneFood.rating,style: TextStyle(color: Colors.grey[600]),),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
