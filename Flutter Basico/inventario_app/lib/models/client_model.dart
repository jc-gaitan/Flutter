class ClientModel {
  ClientModel({
    required this.cc,
    required this.name,
    required this.orders,
    required this.phone,
    required this.email,
  });

  String cc;
  String name;
  List<String> orders;
  String phone;
  String email;

  factory ClientModel.fromMap(Map<String, dynamic> obj) => ClientModel(
        cc: obj['cc'],
        name: obj['name'],
        orders: obj['orders'],
        phone: obj['phone'],
        email: obj['email'],
      );
}
