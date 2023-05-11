import 'package:carousel_slider/carousel_slider.dart';
import 'package:coupon_discount_app/views/screens/coupon_gen_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

List couponcode = [
  {'code': 12543, 'discount': 30},
  {'code': 16543, 'discount': 10},
  {'code': 13243, 'discount': 20},
  {'code': 91243, 'discount': 50},
];
List product = [
  {
    'name': "Watch",
    'price': 100,
    'rate': '⭐⭐⭐⭐',
    'image':
        "https://cdn.shopify.com/s/files/1/0266/1371/0884/products/7_df138706-1b15-4e94-b297-189068d12e40-sw.png?v=1659590799"
  },
  {
    'name': "Tv",
    'price': 50000,
    'rate': '⭐⭐',
    'image':
        "https://www.shutterstock.com/image-photo/4k-monitor-isolated-on-white-260nw-357968483.jpg"
  },
  {
    'name': "Phone",
    'price': 11000,
    'rate': '⭐⭐⭐',
    'image':
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaGKIyT4KvMOwvaNHEv9vg1qc0evcKk6I7Zg&usqp=CAU"
  },
  {
    'name': "jeans",
    'price': 700,
    'rate': '⭐⭐⭐⭐',
    'image':
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRliGY2joVJbsfRWXhtRq0d06dvk3HtzHn_BA&usqp=CAU"
  },
  {
    'name': "T-shirt",
    'price': 400,
    'rate': '⭐⭐⭐',
    'image':
        "https://media.istockphoto.com/id/1328049157/photo/mens-short-sleeve-t-shirt-mockup-in-front-and-back-views.jpg?b=1&s=170667a&w=0&k=20&c=CZ5Emlrh-C4jzojJ8b8YBy1frxpQr6aMcLmEBrkty7Q="
  },
  {
    'name': "shirt",
    'price': 500,
    'rate': '⭐⭐',
    'image':
        "https://assets.ajio.com/medias/sys_master/root/20221109/SI6r/636b8e9af997ddfdbd663e58/-1117Wx1400H-461119105-blue-MODEL.jpg"
  },
  {
    'name': "Laptop",
    'price': 40000,
    'rate': '⭐⭐⭐',
    'image':
        "https://images.unsplash.com/1/macbook-air-all-faded-and-stuff.jpg?ixlib=rb-4.0.3"
  },
];

int? code;
int? discount;
GlobalKey<FormState> inserkey = GlobalKey<FormState>();
TextEditingController codecontroller = TextEditingController();
TextEditingController discountcontroller = TextEditingController();

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 6,
            child: CarouselSlider(
                items: couponcode
                    .map(
                      (e) => Container(
                        alignment: Alignment.center,
                        height: 100,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Colors.purple.shade100,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.discount,
                              size: 70,
                              color: Colors.purple,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Couponcode  : ${e['code']}",
                                  style: GoogleFonts.alegreya(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Discount  : ${e['discount']} %",
                                  style: GoogleFonts.alegreya(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    "Coupon available for 2  quntity of product.."),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
                options: CarouselOptions()),
          ),
          Container(
            height: 50,
            padding: EdgeInsets.only(left: 10),
            width: double.infinity,
            alignment: FractionalOffset.centerLeft,
            child: Text(
              "Products",
              style: GoogleFonts.alegreya(
                  fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          Expanded(
            flex: 12,
            child: ListView.builder(
              itemCount: product.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(5),
                child: Card(
                  elevation: 5,
                  child: ListTile(
                    isThreeLine: true,
                    leading: Container(
                      height: 90,
                      width: 70,
                      child: Image.network(
                        product[index]['image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      "${product[index]['name']}",
                      style: GoogleFonts.alegreya(
                          fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    subtitle: Text(
                      "Price : ₹  ${product[index]['price']}\n${product[index]['rate']}",
                      style: GoogleFonts.alegreya(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    trailing: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Coupon_Generate_Page(
                              code: couponcode,
                              discount: couponcode,
                            ),
                          ));
                        },
                        child: Text("Generate Coupon")),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
