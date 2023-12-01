import 'package:flutter/material.dart';
import 'package:shivangi/items.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
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
      backgroundColor: Colors.black, // Set the background color to black
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.white), // Set the text color to grey
        ),
      ),
      body: Consumer<CartModel>(
        builder: (context, cartModel, child) {
          return ListView.builder(
            itemCount: cartModel.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  cartModel.items[index].itemName ?? 'Unknown name',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey), // Set the text color to grey
                ),
                subtitle: Text(
                  cartModel.items[index].itemDescription ?? 'Unknown name',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey), // Set the text color to grey
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.remove_shopping_cart,
                    color: Colors.grey, // Set the icon color to grey
                  ),
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
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        extendedPadding: EdgeInsets.all(8),
        backgroundColor: Colors.pinkAccent,
        onPressed: () async {
          final List<Items> items = Provider.of<CartModel>(context, listen: false).items;
          final List<Items>? selected = await showDialog<List<Items>>(
            context: context,
            builder: (BuildContext context) {
              return Material(
                child: MultiSelectDialogField(
                  items: items.map((item) => MultiSelectItem<Items>(item, item.itemName ?? 'Unknown name')).toList(),
                  listType: MultiSelectListType.CHIP,
                  title: Text("Select Items"),
                  onConfirm: (values) {
                    selectedItems = values;
                  },
                ),
              );
            },
          );
          if (selected != null) {
            // Add your logic for trying multiple items virtually here
          }
        },
        label: const Text(
          "Try Multiple",
          style: TextStyle(color: Colors.white), // Set the text color to grey
        ),
        icon: const Icon(
          Icons.mobile_screen_share_rounded,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
