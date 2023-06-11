import 'package:shopping_blocapp/data/Product.dart';

abstract class CartEvent{
  Product product;
  CartEvent({required this.product});
}
class AddToCart extends CartEvent{
  AddToCart({required super.product});
}
class RemoveToCart extends CartEvent{
  RemoveToCart({required super.product});
}