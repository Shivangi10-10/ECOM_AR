import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bhavya/home_screen.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';


Future<void> main() async
{


  try{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }
  catch(errorMsg)
  {
    print("Error:" + errorMsg.toString());


  }


  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter EcomAR',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

