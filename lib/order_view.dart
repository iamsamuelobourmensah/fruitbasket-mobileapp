import 'package:flutter/material.dart';
import 'package:fruit_basket/fruit_details.dart';
import 'package:fruit_basket/home_view.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              width: MediaQuery.sizeOf(context).width * 1,
              child: const Image(
                image: AssetImage('assets/images/bg.jpg'),
                fit: BoxFit.cover,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height * .02),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
          
                    Text(
                      "FruitBasket",
                      style: TextStyle(
                        fontFamily: "kapakana",
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.02,
                ),
                ClipPath(
                    clipper: MyCustomClipper(),
                    child: Container(
                      height: MediaQuery.sizeOf(context).height * .5,
                      width: MediaQuery.sizeOf(context).width * .80,
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(20)),
                      child: Stack(
                        children: [
                          Transform(
                            //Transform is use to make the text tilted..negative will make it slant to the left and positive will make it slant to the right
                            transform: Matrix4.rotationZ(-0.20),
                            child: const Padding(
                              padding: EdgeInsets.only(
                                top: 150,
                                left: 25,
                              ),
                              child: Text(
                                "FruitBasket",
                                style: TextStyle(
                                  fontFamily: "kapakana",
                                  fontSize: 85,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const Positioned(
                            top: -35,
                            bottom: 20,
                            left: -35,
                            child: Image(
                              image: AssetImage('assets/images/girl.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.02,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Choices",
                      style: TextStyle(
                        //    fontFamily: "kapakana",
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "View all",
                      style: TextStyle(
                        //   fontFamily: "kapakana",
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.02,
                ),
                SizedBox(
                  height: 150,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300,
                            mainAxisExtent: 100,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 1),
                    itemCount: fruitinfo.length,
                    itemBuilder: (context, index) {
                      final fruit = fruitinfo[index];
                      final fname = fruit["name"];
                      final fimage = fruit["image"];
                      final fprice = fruit["price"];
                      final fdescription = fruit["description"];
                      return Fruitcard(
                        name: fname,
                        img: fimage,
                        price: fprice,
                        index: index,
                        isSelectedIndex: isSelected,
                        onTap: () {
                          setState(() {
                            isSelected = index;
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return FruitDetails(
                                name: fname,
                                image: fimage,
                                price: fprice,
                                description: fdescription,
                              );
                            }));
                          });
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * .02),
                //the three buttons at the bottom
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Costumclass(
                      tittle: "Frit",
                    ),
                    Costumclass(
                      tittle: "Hep",
                    ),
                    Costumclass(
                      tittle: "Frty",
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * .01),
                const Icon(
                  Icons.home,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Fruitcard extends StatelessWidget {
  const Fruitcard({
    super.key,
    this.img,
    this.name,
    this.price,
    this.index,
    this.isSelectedIndex,
    this.onTap,
  });
  final String? img;
  final String? name;
  final double? price;
  final int? isSelectedIndex;
  final int? index;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // grey container
          Container(
            height: MediaQuery.sizeOf(context).height * .16,
            width: MediaQuery.sizeOf(context).width * .3,
            decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .02,
                ),
                Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * .15,
                      child: Image(fit: BoxFit.cover, image: AssetImage(img!)),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * .2,
                      child: const Image(
                          opacity: AlwaysStoppedAnimation(60),
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/wat.png")),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // yelllow container
          Positioned(
            bottom: -5,
            right: 65,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * .03,
                  width: MediaQuery.sizeOf(context).width * .05,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(5)),
                ),
                const Icon(Icons.add)
              ],
            ),
          ),
          Positioned(
            right: 90,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name!,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "GH₵ $price",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double h = size.height;
    double w = size.width;

    final path = Path();
    path.moveTo(w * -0.0020000, h * 0.0024714);
    path.lineTo(w * 0.9971417, h * -0.0006714);
    path.lineTo(w * 0.9996667, h * 0.8237714);
    path.quadraticBezierTo(
        w * 0.8733667, h * 0.8968286, w * 0.7873167, h * 0.9185714);
    path.cubicTo(w * 0.6766500, h * 0.9540571, w * 0.5771167, h * 0.9253714,
        w * 0.4991667, h * 0.8937000);
    path.cubicTo(w * 0.4498250, h * 0.8632000, w * 0.3467250, h * 0.8151143,
        w * 0.2217417, h * 0.8189286);
    path.quadraticBezierTo(
        w * 0.1247500, h * 0.8237714, w * -0.0003583, h * 0.9275857);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // Return true if the clipping path should be updated
    // This method is called when the clipper is reused but the path needs to be updated
    return false;
  }
}

final List fruitinfo = [
  {
    "name": "Mango",
    "image": "assets/images/mango.png",
    "price": 5.00,
    "description":
        "A mango is an edible stone fruit produced by the tropical tree Mangifera indica."
            "It is believed to have originated in southern Asia, particularly in eastern India, Bangladesh, and the Andaman Islands",
  },
  {
    "name": "Apple",
    "image": "assets/images/ap.png",
    "price": 8.00,
    "description":
        "An apple is a round, edible fruit produced by an apple tree (Malus domestica). Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus."
            " The tree originated in Central Asia, where its wild ancestor, Malus sieversii, is still found"
            "Apples have been grown for thousands of years in Asia and Europe and were introduced to North America by European colonists,"
  },
  {
    "name": "Orange",
    "image": "assets/images/or.png",
    "price": 4.00,
    "description":
        "An orange is a fruit of various citrus species in the family Rutaceae; it primarily refers to Citrus × sinensis, which is also called sweet orange, to distinguish it from the related Citrus  aurantium, referred to as bitter orange."
  },
  {
    "name": "Litchi",
    "image": "assets/images/lt.png",
    "price": 10.00,
    "description":
        "It is rich in iron, copper, manganese, phosphorus, and magnesium, which improve bone and heart health. Lychees are a rich source of numerous antioxidant-plant compounds,"
            "including epicatechin and rutin, which help protect against oxidative stress, chronic diseases, cataract, diabetes, heart diseases, and cancers."
  },
];
