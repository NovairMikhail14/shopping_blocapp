import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_blocapp/bloc/Cart_Bloc.dart';
import 'package:shopping_blocapp/bloc/Cart_State.dart';
import 'package:shopping_blocapp/view/Product_List.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return CartBloc();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Shopping App"),
          actions: [
            Center(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                        label: Text("")),
                  ),
                  BlocConsumer<CartBloc,CartState>(builder:(context, state) {
                    return Positioned(
                        left: 30,
                        child: Container(
                          child: Text("${state.CartProduct.length}"),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                        ));
                  }, listener: (context, state) {},),

                ],
              ),
            )
          ],
        ),
        body: ProductList()
        ),
    );
  }
}
