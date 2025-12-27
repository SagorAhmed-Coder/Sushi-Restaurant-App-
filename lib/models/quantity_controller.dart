import 'package:flutter/material.dart';

class QuantityController extends ChangeNotifier {
  int quantity = 0;

  void increment(){
    quantity++;
    notifyListeners();
  }
  void decrement(){
    quantity--;
    notifyListeners();
  }
}