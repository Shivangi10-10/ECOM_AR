import 'package:flutter/material.dart';
import 'package:bhavya/items.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';
import 'item_details_screen.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Items> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Consumer<CartModel>(
        builder: (context, cartModel, child) {
          double totalPrice = cartModel.items.fold<double>(0, (a, b) => a + num.parse(b.itemPrice!));

          return Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: cartModel.items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(cartModel.items[index].itemName ?? 'Unknown name', overflow: TextOverflow.ellipsis),
                      subtitle: Text(cartModel.items[index].itemDescription ?? 'Unknown name', overflow: TextOverflow.ellipsis),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove_shopping_cart),
                        onPressed: () {
                          cartModel.removeItem(cartModel.items[index]);
                        },
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ItemDetailsScreen(clickedItemInfo: cartModel.items[index]),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Total: \$${totalPrice.toStringAsFixed(2)}'),
                    ElevatedButton(
                      onPressed: () {
                        // Handle the 'Pay Now' button press
                      },
                      child: Text('Pay Now'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
