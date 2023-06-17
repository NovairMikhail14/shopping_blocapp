import 'package:shopping_blocapp/data/Product.dart';

abstract class CartState{
List<Product> CartProduct;
CartState({required this.CartProduct});
}

class CartItemLoading extends CartState{
  // make superclass  null if call this class
  CartItemLoading():super(CartProduct: []);
}

class CartEmpty extends CartState{
  CartEmpty():super(CartProduct: []);
}

class ProductAdd extends CartState{
  List<Product> AddItem;
  ProductAdd({required this.AddItem}):super(CartProduct: AddItem);
}

class ProductRemove extends CartState{
  List<Product> RemoveItem;
  ProductRemove({required this.RemoveItem}):super(CartProduct: RemoveItem);
}