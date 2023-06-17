import 'package:shopping_blocapp/data/Product.dart';

abstract class CartEvent{
}

class AddToCart extends CartEvent{
  Product product;
  AddToCart({required this.product});
}
class RemoveFromCart extends CartEvent{
  Product product;
  RemoveFromCart({required this.product});
}