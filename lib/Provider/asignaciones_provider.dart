import 'package:flutter/material.dart';

class asignacionesProvider with ChangeNotifier{
  int indice = 0;
  
  int get getIndice => this.indice;

  set setIndice(int indice) {
    this.indice = indice;
    notifyListeners();
  }
   
}