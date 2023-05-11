import 'package:flutter/material.dart';

class Coupon_Generate_Page extends StatefulWidget {
  final List code;
  final discount;
  const Coupon_Generate_Page(
      {Key? key, required this.discount, required this.code})
      : super(key: key);

  @override
  State<Coupon_Generate_Page> createState() => _Coupon_Generate_PageState();
}

class _Coupon_Generate_PageState extends State<Coupon_Generate_Page> {
  int codeindex = 0;
  int discountindex = 0;
  int di = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int code = widget.code[codeindex]['code'];
    int discount = widget.code[codeindex]['discount'];
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
                decoration: InputDecoration(border: OutlineInputBorder()),
                onChanged: (val) {
                  code = int.parse(val);
                  discount = int.parse(val);
                }),
            Container(
              child: Column(
                children: [
                  Text("${code}"),
                  Text("${discount}"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
