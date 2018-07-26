import 'package:flutter/material.dart';
import 'blocs.dart';



class CartProvider extends InheritedWidget {

  final CartBloc bloc;




  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

  static CartBloc of (BuildContext context){
    return (context.inheritFromWidgetOfExactType(CartProvider) as CartProvider).bloc;
  }
  CartProvider({Key key, CartBloc bloc, Widget child})
      : bloc = CartBloc(),
        super(child: child, key: key);



}