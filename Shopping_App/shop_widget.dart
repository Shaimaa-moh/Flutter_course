import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'shop.dart';

class shop_widget extends StatelessWidget {
  Shop shop;
  shop_widget({Key? key, required this.shop}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var rating = 0.0;
    return Card(
      elevation: 3,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            height: 200,
            width: 135,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Image.network(
                    shop.url,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(shop.name, style: TextStyle(color: Colors.black)),
                RatingBarIndicator(
                  rating: shop.rate,
                  itemCount: 5,
                  itemSize: 15.0,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${shop.price}",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.deepOrange,
                      size: 20,
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
