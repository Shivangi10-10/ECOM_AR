import 'package:flutter/material.dart';
import 'package:shivangi/items.dart';
import 'package:shivangi/virtual_ar_view_screen.dart';

class ItemDetailsScreen extends StatefulWidget {
Items? clickedItemInfo;

ItemDetailsScreen({this.clickedItemInfo});

@override
State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
// Add a variable to track whether the item is added to the cart
bool isAddedToCart = false;

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.black,
appBar: AppBar(
backgroundColor: Colors.black,
title: Text(
widget.clickedItemInfo!.itemName.toString(),
),
),
floatingActionButton: Flexible(
  child: Row(
mainAxisAlignment: MainAxisAlignment.end,
children: [
// "Try Virtually (AR View)" button
FloatingActionButton.extended(
extendedPadding: EdgeInsets.all(8),
backgroundColor: Colors.pinkAccent,
onPressed: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (c) => VirtualARViewScreen(
clickedItemImageLink: widget.clickedItemInfo!.itemImage.toString(),
),
),
);
},
label: const Text("Try Virtually"),
icon: const Icon(
Icons.mobile_screen_share_rounded,
color: Colors.white,
),
),
SizedBox(width: 8), // Add spacing between buttons
// "Add to Cart" button
FloatingActionButton.extended(
  extendedPadding: EdgeInsets.all(8),
backgroundColor: isAddedToCart ? Colors.grey : Colors.green,
onPressed: () {
// Toggle the isAddedToCart state
setState(() {
isAddedToCart = !isAddedToCart;
});

// Add your logic for adding to the cart here
// For example, you can show a snackbar
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(
content: Text(
isAddedToCart
? 'Item added to cart!'
    : 'Item removed from cart!',
),
),
);
},
label: Text(isAddedToCart ? 'Remove from Cart' : 'Add to Cart'),
icon: Icon(
isAddedToCart
? Icons.remove_shopping_cart
    : Icons.shopping_cart,
color: Colors.white,
),
),
],
),
),
body: SingleChildScrollView(
child: Padding(
padding: const EdgeInsets.all(7.0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Image.network(
widget.clickedItemInfo!.itemImage.toString(),
),
Padding(
padding: const EdgeInsets.only(left: 10.0),
child: Text(
widget.clickedItemInfo!.itemName.toString(),
textAlign: TextAlign.justify,
style: const TextStyle(
fontWeight: FontWeight.bold,
fontSize: 20,
color: Colors.white70,
),
),
),
Padding(
padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 6.0),
child: Text(
widget.clickedItemInfo!.itemDescription.toString(),
textAlign: TextAlign.justify,
style: const TextStyle(
fontWeight: FontWeight.normal,
fontSize: 16,
color: Colors.white54,
),
),
),
Padding(
padding: const EdgeInsets.all(10.0),
child: Text(
widget.clickedItemInfo!.itemPrice.toString() + " Rs",
textAlign: TextAlign.justify,
style: const TextStyle(
fontWeight: FontWeight.bold,
fontSize: 30,
color: Colors.white70,
),
),
),
const Padding(
padding: EdgeInsets.only(left: 8.0, right: 310.0),
child: Divider(
height: 1,
thickness: 2,
color: Colors.white70,
),
),
],
),
),
),
);
}
}
