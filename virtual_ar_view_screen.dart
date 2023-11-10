import 'package:augmented_reality_plugin/augmented_reality_plugin.dart';
import 'package:flutter/material.dart';
import 'package:shivangi/item_ui_design_widget.dart';
import 'package:shivangi/items_upload_screen.dart';
import 'package:shivangi/items.dart';


class VirtualARViewScreen extends StatefulWidget
{
 String? clickedItemImageLink;


 VirtualARViewScreen({this.clickedItemImageLink,});


 @override
 State<VirtualARViewScreen> createState() => _VirtualARViewScreenState();
}


class _VirtualARViewScreenState extends State<VirtualARViewScreen> {
 @override
 Widget build(BuildContext context) {
   return AugmentedRealityPlugin(widget.clickedItemImageLink.toString());
 }
}

