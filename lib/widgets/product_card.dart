import 'package:flutter/material.dart';
import 'package:e_commerce_application/screens/productentry_form.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce_application/screens/login.dart';

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () async {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("You pressed the ${item.name} button!"))
            );

          if (item.name == "Add Product") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductEntryFormPage(),
              ),
            );
          }
          else if (item.name == "View Product") {
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => const ProductEntryFormPage()
                  ),
              );
          }
          else if (item.name == "Logout") {
              final response = await request.logout(
                  // TODO: Change the URL to your Django app's URL. Don't forget to add the trailing slash (/) if needed.
                  "http://[YOUR_APP_URL]/auth/logout/");
              String message = response["message"];
              if (context.mounted) {
                  if (response['status']) {
                      String uname = response["username"];
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("$message Goodbye, $uname."),
                      ));
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                  } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(message),
                          ),
                      );
                  }
              }
          }
        }, 
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
                if (item.price != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      '\$${item.price!.toStringAsFixed(2)}', // format price to 2 decimal places
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class ItemHomepage {
     final String name;
     final IconData icon;
     final Color color;
     final double? price;

     ItemHomepage(this.name, this.icon, this.color, [this.price]);
 }
