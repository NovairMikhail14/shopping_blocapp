import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_blocapp/bloc/Cart_Event.dart';
import 'package:shopping_blocapp/bloc/Cart_State.dart';
import 'package:shopping_blocapp/data/Product.dart';

class CartBloc extends Bloc<CartEvent,CartState>{
  List<Product> _items = [];
  List<Product> get items => _items;

  CartBloc():super(CartEmpty()){
    on<AddToCart>((event, emit){
      _items.add(event.product);
      emit(ProductAdd(AddItem: _items));
    });

    on<RemoveFromCart>((event, emit) {
      _items.removeWhere((element) => element.id == event.product.id && element.count == event.product.count ,);
      emit(ProductRemove(RemoveItem: _items));
    });
  }

}