import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shivangi/items.dart';
import 'package:provider/provider.dart';
import 'package:upi_payment_flutter/upi_payment_flutter.dart';
import 'cart_model.dart';
import 'item_details_screen.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Items> selectedItems = [];
  final upiPaymentHandler = UpiPaymentHandler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Consumer<CartModel>(
          builder: (context, cartModel, child) {
            double totalPrice = cartModel.items.fold<double>(0, (a, b) => a + num.parse(b.itemPrice!));

            return Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: cartModel.items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(cartModel.items[index].itemName ?? 'Unknown name', overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.grey)),
                        subtitle: Text(cartModel.items[index].itemDescription ?? 'Unknown name', overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.grey)),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove_shopping_cart, color: Colors.grey),
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
                      Text(
                        'Total: Rs${totalPrice.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.grey),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            bool success = await upiPaymentHandler.initiateTransaction(
                              payeeVpa: '7488321540@paytm',
                              payeeName: 'Shivangi Suyash',
                              transactionRefId: 'TXN123456',
                              transactionNote: 'Test transaction',
                              amount: totalPrice,
                            );
                            if (success) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Transaction successful')),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Transaction failed')),
                              );
                            }
                          } on PlatformException catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('UPI not supported on this device')),
                            );
                          }
                        },
                        child: Text('Pay Now'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.pinkAccent, // Button color
                          onPrimary: Colors.white, // Text color
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
