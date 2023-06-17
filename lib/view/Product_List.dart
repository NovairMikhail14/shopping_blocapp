import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_blocapp/bloc/Cart_Bloc.dart';
import 'package:shopping_blocapp/bloc/Cart_Event.dart';
import 'package:shopping_blocapp/bloc/Cart_State.dart';
import 'package:shopping_blocapp/data/Product.dart';

class ProductList extends StatelessWidget {
int countind = 0;
  List<Product> getList() {
    List<Product> product = List<Product>.generate(50, (index) =>
        Product(id:index ,count: countind, color: Colors.primaries[index % Colors.primaries.length],
            name: "Product No. $index",
            checked: false));
    return product;
  }

  @override
  Widget build(BuildContext context) {
    return
      // BlocProvider(
      // create: (context) {
      //   return CartBloc();
      // },
      // child:
      BlocConsumer<CartBloc,CartState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ListView.builder(
            itemCount: getList().length,
            itemBuilder: (context, index) {
              return Container(
                child: ListTile(
                  title:Text(getList()[index].name),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(onPressed: (){
                          if(state.CartProduct.where((element) => element.id ==getList()[index].id).isEmpty){
                            print("------ NON value");
                          }
                          else{
                            Product lastprodcd = state.CartProduct.where((element) => element.id ==getList()[index].id).reduce((curr, next) => curr.count > next.count? curr: next);
                            if ((lastprodcd.count > 0 )) {
                              print(lastprodcd.count);
                              print(countind);
                              countind = lastprodcd.count-1;
                              print(countind);
                            } else {
                              countind = 0;
                              print("else red");
                            }
                            getList()[index].count = countind;
                            print("${ getList()[index].id}--${ getList()[index].count}");
                            context.read<CartBloc>().add(RemoveFromCart(product: lastprodcd));
                          }
                        },icon: Icon(Icons.remove_shopping_cart_outlined)),


                        IconButton(onPressed: (){
                          if(state.CartProduct.where((element) => element.id ==getList()[index].id).isEmpty){
                            countind = 1;
                            print("first add --- ${ getList()[index].id}--${ getList()[index].count}");
                            context.read<CartBloc>().add(AddToCart(product:getList()[index]));
                          }
                          else{
                            Product lastprodcd = state.CartProduct.where((element) => element.id ==getList()[index].id).reduce((curr, next) => curr.count > next.count? curr: next);
                            int count;
                            if ((lastprodcd.count > 0 )) {
                              count = countind= lastprodcd.count+1;
                            } else {
                              count = countind = 0+1;
                            }
                            getList()[index].count = count;
                            print("${ getList()[index].id}--${ getList()[index].count}");
                            context.read<CartBloc>().add(AddToCart(product:getList()[index]));
                          }

                        },icon: Icon(Icons.add_shopping_cart_outlined)),
                      ],
                    ),
                  ),
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
      // ),
    );
  }
}
