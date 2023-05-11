class Couponcode {
  String? code;
  double? discount;
  bool isuse;
  int id;

  Couponcode({required this.code, required this.discount, required this.id})
      : isuse = false;
}

List<Couponcode> coupon = [
  Couponcode(code: 'abc1', discount: 10, id: 1),
  Couponcode(code: 'xyzz', discount: 40, id: 2),
  Couponcode(code: 'mnop', discount: 10, id: 3),
  Couponcode(code: 'pqrs', discount: 30, id: 4),
];
