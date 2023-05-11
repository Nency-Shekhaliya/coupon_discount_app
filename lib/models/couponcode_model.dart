class Couponcode {
  final int? code;
  final int? discount;

  Couponcode({required this.code, required this.discount});
  factory Couponcode.frommap({required Map<String, dynamic> data}) {
    return Couponcode(code: data['code'], discount: data['discount']);
  }
}
