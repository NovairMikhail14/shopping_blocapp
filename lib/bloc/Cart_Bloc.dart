import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_blocapp/bloc/Cart_Event.dart';
import 'package:shopping_blocapp/bloc/Cart_State.dart';
import 'package:shopping_blocapp/data/Product.dart';

class CartBloc extends Bloc<CartEvent,CartState>{
  List<Product> _items = [];
  List<Product> get items => _items;
  set items(List<Product> value) {
    _items = value;
  }

  CartBloc():super(CartEmpty()){
    on<AddToCart>((event, emit)  {
      items.add(event.product);
      emit(ProductAdd(AddItem: items));
    });

    on<RemoveToCart>((event, emit) {
      items.remove(event.product);
      emit(ProductRemove(RemoveItem: items));
    });
  }

}