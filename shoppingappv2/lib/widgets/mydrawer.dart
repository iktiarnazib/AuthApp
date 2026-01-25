import 'package:flutter/material.dart';
import 'package:shoppingappv2/widgets/mylisttile.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 40),
            //logo
            Center(child: Image.asset('assets/images/logo.png', height: 100)),
            SizedBox(height: 15),
            //home page
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 40, right: 40.0),
              child: Mylisttile(
                title: 'Home',
                icons: Icons.home,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              child: ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, 'cartPage');
                },
                leading: Icon(Icons.shopping_cart),
                title: Text('Cart'),
              ),
            ),
            Expanded(child: SizedBox()),
            //log out
            Padding(
              padding: const EdgeInsets.only(
                left: 40.0,
                right: 40.0,
                top: 40.0,
              ),
              child: ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    'introPage',
                    (route) => false,
                  );
                },
                leading: Icon(Icons.logout),
                title: Text('Exit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
