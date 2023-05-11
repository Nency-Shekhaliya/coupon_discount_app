import 'package:coupon_discount_app/controllers/generate_contoller.dart';
import 'package:coupon_discount_app/models/product_model.dart';
import 'package:coupon_discount_app/views/screens/coupon_gen_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

int? code;
int? discount;
GlobalKey<FormState> inserkey = GlobalKey<FormState>();
TextEditingController codecontroller = TextEditingController();
TextEditingController discountcontroller = TextEditingController();
Productcontroller productcontroller = Get.put(Productcontroller());

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Coupons Shopping",
          style: GoogleFonts.alegreya(
              fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 3),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: product.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 1, right: 1, top: 5, bottom: 5),
              height: 150,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.purple.shade100,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 20, left: 10),
                    height: 120,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(product[index].image),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    width: 150,
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${product[index].name}",
                          style: GoogleFonts.alegreya(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2),
                        ),
                        Text(
                          "₹ ${product[index].price}",
                          style: GoogleFonts.alegreya(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Coupon_Generate_Page(
                          name: product[index].name,
                          image: product[index].image,
                          price: product[index].price,
                        ),
                      ));
                    },
                    icon: Icon(Icons.add_shopping_cart_sharp),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
