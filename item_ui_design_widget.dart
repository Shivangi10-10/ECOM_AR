import 'package:flutter/material.dart';
import 'package:shivangi/item_details_screen.dart';
import 'package:shivangi/items.dart';


class ItemUIDesignWidget extends StatefulWidget
{
 Items? itemsInfo;
 BuildContext? context;


 ItemUIDesignWidget({
   this.itemsInfo,
   this.context,});


 @override
 State<ItemUIDesignWidget> createState() => _ItemUIDesignWidgetState();
}






class _ItemUIDesignWidgetState extends State<ItemUIDesignWidget> {
 @override
 Widget build(BuildContext context) {
   return InkWell(
     onTap: ()
     {
       //send user to the items details screen
       Navigator.push(context, MaterialPageRoute(builder: (c)=>ItemDetailsScreen(
         clickedItemInfo: widget.itemsInfo,
       )));
     },
     splashColor: Colors.purple,
     child: Padding(
       padding: const EdgeInsets.all(6.0),
       child: SizedBox(
         height: 140,
         width: MediaQuery.of(context).size.width,
         child: Row(


           children: [


             //image
             Image.network(
               widget.itemsInfo!.itemImage.toString(),
               width: 140,
               height: 140,
             ),


             const SizedBox(width: 4.0,),


             Expanded(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   const SizedBox(height: 15),


                   //item name
                   Expanded(
                     child: Text(
                       widget.itemsInfo!.itemName.toString(),
                       maxLines: 2,
                       style: const TextStyle(
                         color: Colors.white70,
                         fontSize: 16,


                       ),
                     ),
                   ),


                   const SizedBox(
                     height: 5.0,
                   ),


                   //seller name
                   Expanded(
                     child: Text(
                       widget.itemsInfo!.sellerName.toString(),
                       maxLines: 2,
                       style: const TextStyle(
                         color: Colors.pinkAccent,
                         fontSize: 14,


                       ),
                     ),
                   ),


                   const SizedBox(
                     height: 20.0,
                   ),


                   //show discount badge
                   //price after discount
                   Row(
                     children: [
                       //50% OFF badge
                       Container(
                         decoration: const BoxDecoration(
                           shape: BoxShape.rectangle,
                           color: Colors.pink,
                         ),


                         alignment: Alignment.topLeft,
                         width: 40,
                         height: 44,
                         child: Center(
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: const [




                               Text(
                                 "50%",
                                 style: TextStyle(
                                   fontSize: 15.0,
                                   color: Colors.white,
                                   fontWeight: FontWeight.normal,
                                 ),
                               ),




                               Text(
                                 "OFF",
                                 style: TextStyle(
                                   fontSize: 12.0,
                                   color: Colors.white,
                                   fontWeight: FontWeight.normal,
                                 ),
                               ),


                             ],
                           ),
                         ),


                       ),


                       const SizedBox(
                         width: 10,
                       ),


                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [


                           //original price


                           Row(
                             children: [
                               const Text(
                                 "Original Price: Rs",
                                 style: TextStyle(
                                   fontSize: 14,
                                   color: Colors.grey,
                                   decoration: TextDecoration.lineThrough,
                                 ),
                               ),


                               Text(
                                 (double.parse(widget.itemsInfo!.itemPrice!) + double.parse(widget.itemsInfo!.itemPrice!)).toString(),
                                 style: const TextStyle(
                                   fontSize: 16,
                                   color: Colors.grey,
                                   decoration: TextDecoration.lineThrough,
                                 ),
                               ),
                             ],
                           ),


                           //new Price
                           Row(
                             children: [
                               const Text(
                                 "New Price: ",
                                 style: TextStyle(
                                   fontSize: 14,
                                   color: Colors.grey,
                                 ),
                               ),


                               const Text(
                                 "Rs",
                                 style: TextStyle(
                                   fontSize: 16,
                                   color: Colors.red,
                                 ),
                               ),


                               Text(
                                 widget.itemsInfo!.itemPrice.toString(),
                                 style: const TextStyle(
                                   fontSize: 16,
                                   color: Colors.red,
                                 ),
                               ),
                             ],
                           ),




                         ],
                       ),
                     ],
                   ),


                   const SizedBox(
                     height: 8.0,
                   ),




                   const Divider(
                     height: 4,
                     color: Colors.white70,
                   ),




                 ],
               ),
             ),
           ],


         ),
       ),
     ),
   );
 }
}
