class OrderModel {
  OrderModel({
    required this.id,
    required this.fecha,
    required this.products,
    required this.quantities,
    required this.total,
    required this.discount,
  });

  String id;
  DateTime fecha;
  String total;
  List<Map> products;
  List<int> quantities;
  int discount;
}
