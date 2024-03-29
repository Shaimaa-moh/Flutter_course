import 'package:flutter/material.dart';
import 'package:shoppingapp/main.dart';
import 'package:shoppingapp/shop.dart';
import 'package:shoppingapp/Model/user.dart';

import 'MyCartGUI.dart';

class InMyCart extends StatefulWidget {
  final user AppUser;
  final Shop shop;

  const InMyCart({Key? key, required this.AppUser, required this.shop})
      : super(key: key);

  @override
  State<InMyCart> createState() => _InMyCartState();
}

class _InMyCartState extends State<InMyCart> {
  int numInCart = 0;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            width: 120,
            height: 120,
            child: Container(
                child: Image.network(
              widget.shop.url,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            )),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.shop.name, style: TextStyle(color: Colors.black)),
                  Text(
                    "\$${widget.shop.price}",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        child: const Text(
                          "-",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        onTap: () {
                          setState(() {
                            if (numInCart > 0) {
                              numInCart--;
                            } else if (numInCart == 0) {
                              setState(() {
                                widget.AppUser.CartProducts.remove(widget.shop);
                                //No, let's refresh the current page (please be careful, when used wrong, this might mis-up the context stack (stack of screens))
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MyCartGUI(AppUser: sampleAppUser)),
                                  (Route<dynamic> route) => false,
                                );
                              });
                            }
                          });
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("$numInCart",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15)),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        child: Text(
                          "+",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        onTap: () {
                          setState(() {
                            numInCart++;
                          });
                        },
                      ),
                    ],
                  ),
                ]),
          ),
        ]),
      ),
    );
  }
}
