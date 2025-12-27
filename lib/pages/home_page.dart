import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_restaurant/models/food.dart';
import 'package:sushi_restaurant/models/shop.dart';
import 'package:sushi_restaurant/pages/cart_page.dart';
import 'package:sushi_restaurant/pages/food_details_page.dart';
import 'package:sushi_restaurant/utils/food_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Food> food = context.watch<Shop>().food;
    List<Food> userCart = context.read<Shop>().userCart;

    void addToCart(Food food) {
      context.read<Shop>().addItemToCart(food);
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.green,
          title: Text(
            'Successfully Added to cart',
            style: GoogleFonts.aBeeZee(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
              },
              icon: Icon(Icons.done_all_outlined,color: Colors.white,),
            ),
          ],
        ),
      );
    }

    void goToFoodDetailsPage(int index) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FoodDetailsPage(
            food: food[index],
            onTap: () => addToCart(food[index]),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Tokyo'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu_open),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
            icon: Icon(Icons.shopping_cart,color: Colors.pink,),
          ),
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //promo code container
          Container(
            decoration: BoxDecoration(color: Colors.pink[800]),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Get 46% promo',
                      style: GoogleFonts.dmSerifDisplay(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.pink[100],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Text('Redeem'),
                          Icon(Icons.arrow_right_outlined),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Image.asset('assets/images/sushi(3).png', height: 100),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for sushi',
                  hintStyle: TextStyle(color: Colors.pink[600]),
                  contentPadding: EdgeInsets.only(top: 12),
                  border: InputBorder.none,
                  fillColor: Colors.pink[100],
                  filled: true,
                  prefixIcon: Icon(Icons.search, color: Colors.pink[900]),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text('Food Menu', style: GoogleFonts.aBeeZee(fontSize: 26)),
          ),
          Consumer<Shop>(
            builder: (context, value, child) {
              return SizedBox(
                height: 240,
                child: ListView.builder(
                  itemCount: food.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Food oneFood = food[index];
                    return FoodTile(
                      oneFood: oneFood,
                      onTap: () => goToFoodDetailsPage(index),
                    );
                  },
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Favourite', style: GoogleFonts.aBeeZee(fontSize: 26)),
                Text('See All', style: TextStyle(color: Colors.grey[600])),
              ],
            ),
          ),
          Expanded(
            child: Consumer<Shop>(
              builder: (context, value, child) {
                return SizedBox(
                  height: 400,
                  child: ListView.builder(
                    itemCount: food.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      Food twoFood = food[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.only(
                          left: 13,
                          right: 13,
                          bottom: 15,
                        ),
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Image.asset(twoFood.imagePath, height: 50),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  twoFood.name,
                                  style: GoogleFonts.aBeeZee(fontSize: 22),
                                ),
                                Text(
                                  "\$${twoFood.price}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(6),
                              ),
                              padding: EdgeInsets.all(5),
                              child: Icon(Icons.arrow_forward_ios),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
