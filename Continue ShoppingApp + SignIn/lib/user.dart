import 'shop.dart';

class user {
  String name;
  String id;
  List<Shop> CartProducts;
  user({
    required this.name,
    required this.id,
    required this.CartProducts,
  });
}

user sampleAppUser = user(name: "Shaimaa", id: "User1", CartProducts: []);
