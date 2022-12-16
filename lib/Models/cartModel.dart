class CartMOdel {
  late String name, image, product_id;
  late int qty;
  double? total;
  double? price;

  CartMOdel(
      {required this.name,
      required this.image,
      required this.price,
      this.qty = 1,
      required this.product_id,
      required this.total});
}
