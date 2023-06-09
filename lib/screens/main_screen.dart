import 'package:apipractice/screens/home_screen.dart';
import 'package:apipractice/screens/photos_screen.dart';
import 'package:apipractice/screens/shop_product_screen.dart';
import 'package:apipractice/screens/user_screen_apiTest.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Text('Move to Post Api'),
            ),
            SizedBox(height: 12,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PhotosScreen()));
              },
              child: Text('Move to Photos Api'),
            ),
            SizedBox(height: 12,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserScreenApiTest()));
              },
              child: Text('Move to User Api'),
            ),
            SizedBox(height: 12,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShopProductScreen()));
              },
              child: Text('Move to Shop Product Api'),
            )
          ],
        ),
      ),
    );
  }
}
