import 'package:flutter/material.dart';
import 'package:sushi_restaurant/models/food.dart';

class Shop extends ChangeNotifier {
  //all food in one list
  final List<Food> _allFood  = [
    Food(name: 'Pikachu', price: '12.4', imagePath: 'assets/images/sushi(3).png', rating: '0.4'),
    Food(name: 'Salman', price: '26.4', imagePath: 'assets/images/sushi(2).png', rating: '0.3'),
    Food(name: 'Shag on', price: '33.4', imagePath: 'assets/images/sushi(1).png', rating: '0.1'),
    Food(name: 'Espresso', price: '13.4', imagePath: 'assets/images/sushi(4).png', rating: '0.2'),
    Food(name: 'Sugar it', price: '55.4', imagePath: 'assets/images/sushi(5).png', rating: '0.4'),
  ];
  //get all food
   List<Food> get food => _allFood;
  //user cart
   final List<Food> _userCart = [];
  //get user cart
   List<Food> get userCart => _userCart;
  //add a item on user cart
  void addItemToCart(Food food){
    _userCart.add(food);
    notifyListeners();
  }
  //remove a item form cart
  void removeItemFromCart(Food food){
    _userCart.remove(food);
    notifyListeners();
  }
}