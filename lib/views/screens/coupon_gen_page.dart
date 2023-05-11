import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/generate_contoller.dart';
import '../../models/couponcode_model.dart';

class Coupon_Generate_Page extends StatefulWidget {
  final name;
  final image;
  final price;

  Coupon_Generate_Page(
      {Key? key, required this.name, required this.price, required this.image})
      : super(key: key);

  @override
  State<Coupon_Generate_Page> createState() => _Coupon_Generate_PageState();
}

class _Coupon_Generate_PageState extends State<Coupon_Generate_Page> {
  Productcontroller productcontroller = Get.put(Productcontroller());
  TextEditingController codecontroller = TextEditingController();
  double selecteddiscount = 0.0;

  void Comparecode(String enterdcode) {
    for (Couponcode couponcode in coupon) {
      if (!couponcode.isuse && couponcode.code == enterdcode) {
        selecteddiscount = couponcode.discount!;
        couponcode.isuse = true;

        return;
      }

      selecteddiscount;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "Cart Page",
          style: GoogleFonts.alegreya(
              fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 3),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(left: 5),
            margin: EdgeInsets.only(top: 15),
            height: 150,
            width: 380,
            decoration: BoxDecoration(
              color: Colors.purple.shade50,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    right: 10,
                  ),
                  alignment: Alignment.centerLeft,
                  height: 120,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(widget.image), fit: BoxFit.cover),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10),
                  height: 100,
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.name}",
                        style: GoogleFonts.alegreya(
                            fontWeight: FontWeight.bold, fontSize: 26),
                      ),
                      Text(
                        "₹ ${widget.price}",
                        style: GoogleFonts.alegreya(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          CarouselSlider(
              items: coupon
                  .map((e) => Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.purple.shade500,
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          leading: Icon(
                            Icons.discount,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Coupon Code : ${e.code}",
                            style: GoogleFonts.aladin(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2),
                          ),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Discount : ${e.discount?.toInt()} % ",
                                style: GoogleFonts.alegreya(
                                    fontSize: 19,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              ),
                              Text(
                                "Don't miss out on these discounts!",
                                style: GoogleFonts.alegreya(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                height: 200,
              )),
          Container(
            alignment: Alignment.center,
            height: 50,
            width: 370,
            decoration: BoxDecoration(color: Colors.purple.shade50),
            child: Text(
              selecteddiscount > 0.0
                  ? "${selecteddiscount.toInt()} %"
                  : "Invalid Coupon Code",
              style: GoogleFonts.alegreya(
                  fontSize: 18,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              "Enter Coupon Code",
              style: GoogleFonts.alegreya(
                  fontSize: 20,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: TextField(
              onSubmitted: (enteredcode) {
                Comparecode(enteredcode);
              },
              controller: codecontroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple, width: 1.5)),
                  hintText: "Enter Coupon Code..",
                  hintStyle: TextStyle(color: Colors.purple.shade200)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            autofocus: true,
            onPressed: () {
              String entercode2 = codecontroller.text;
              Comparecode(entercode2);

              setState(() {});
            },
            child: Text(
              "Genrate code",
              style: GoogleFonts.alegreya(
                  fontSize: 18,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.only(left: 10, right: 10),
            width: double.infinity,
            alignment: Alignment.centerLeft,
            height: 90,
            color: Colors.purple,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Product Price :",
                      style: GoogleFonts.alegreya(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                    Text(
                      "₹ ${widget.price}",
                      style: GoogleFonts.alegreya(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Discount :",
                      style: GoogleFonts.alegreya(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                    Text(
                      "${selecteddiscount.toInt()}%",
                      style: GoogleFonts.alegreya(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Price : ",
                      style: GoogleFonts.alegreya(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                    Text(
                      "₹ ${widget.price - (widget.price * selecteddiscount / 100)}/-",
                      style: GoogleFonts.alegreya(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
