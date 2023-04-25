class Shop {
  String url;
  String name;
  double price;
  double rate;
  Shop(
      {required this.url,
      required this.name,
      required this.price,
      required this.rate});
}

Shop product1 = Shop(
    url:
        'https://www.cooshti.com/images/womens-nike-sportswear-swoosh-hoodie-p11220-136111_image.jpg',
    name: 'Nike Hoodie 1',
    price: 500,
    rate: 5);
Shop product2 = Shop(
    url:
        'https://footwearnews.com/wp-content/uploads/2020/11/sportswear-womens-funnel-neck-hoodie-lcgDJ2.jpg?resize=192',
    name: 'Nike Hoodie 2',
    price: 600,
    rate: 4);
Shop product3 = Shop(
    url:
        'https://zz.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/35/7462/1.jpg?4419',
    name: 'Nike Hoodie 3',
    price: 600,
    rate: 3);
Shop product4 = Shop(
    url:
        'https://th.bing.com/th/id/R.bf4069a4850c2584a2b5eee183843c5e?rik=DVjRT9PVByqiAQ&pid=ImgRaw&r=0',
    name: 'Nike Hoodie 4',
    price: 1000,
    rate: 4);
