import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_blocapp/bloc/Cart_Bloc.dart';
import 'package:shopping_blocapp/bloc/Cart_State.dart';
import 'package:shopping_blocapp/data/Product.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  List<Product> getList() {
    List<Product> product = List<Product>.generate(50, (index) =>
        Product(color: Colors.primaries[index % Colors.primaries.length],
            name: "Product No. $index",
            checked: false));
    return product;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return CartBloc();
      },
      child: BlocConsumer<CartBloc,CartState>(listener: (context, state) {},
        builder: (context, state) {
          return ListView.builder(
            itemCount: getList().length,
            itemBuilder: (context, index) {
              return Container(
                child: ListTile(
                  title:Text(getList()[index].name),
                  trailing: IconButton(onPressed: (){

                  },icon: Icon(Icons.add_shopping_cart_outlined)),
                  leading: Container(
                    width: 30,
                    height: 30,
                    child: Placeholder(
                      strokeWidth: 2,
                      fallbackWidth: 2,
                      color:getList()[index].color ,
                    ),
                  ),
                ),
              );
            },);
        },
      ),
    );
  }
}
