import 'package:flutter/material.dart';
import 'package:fruit_basket/home_view.dart';

class FruitDetails extends StatefulWidget {
  const FruitDetails(
      {super.key,
      required this.name,
      required this.image,
      required this.price,
      required this.description});
  final String name;
  final String image; 
  final double price;
  final String description;

  @override
  State<FruitDetails> createState() => _FruitDetailsState();
}

class _FruitDetailsState extends State<FruitDetails> {
  int qty = 0;

  void add() {
    int newqty = qty + 1;
    setState(() {
      qty = newqty;
    });
  }

  void remove() {
    int newqty = qty - 1;
    if (qty > 0) {
      setState(() {
        qty = newqty;
      });
    }
  }

  String cost() {
    return (widget.price * qty).toStringAsFixed(1);
  }

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
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * .04,
                        width: MediaQuery.sizeOf(context).width * .08,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        // leading icon
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * .04,
                        width: MediaQuery.sizeOf(context).width * .08,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        //shopping cart icon
                        child: const Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .4,
                  child: Stack(alignment: Alignment.center, children: [
                    Image.asset(widget.image),
                    Image.asset(
                      "assets/images/wat.png",
                      fit: BoxFit.cover,
                      opacity: const AlwaysStoppedAnimation(100),
                    )
                  ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                        color: Colors.yellow,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * .04,
                        width: MediaQuery.sizeOf(context).width * .08,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Super Tasty",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .04,
                ),
                LayoutBuilder(builder: (context, constraints) {
                  return SizedBox(
                    height: MediaQuery.sizeOf(context).height * .18,
                    child: TextFormField(
                      readOnly: true,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      controller:
                          TextEditingController(text: widget.description),
                      decoration: const InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                      expands: true,
                      maxLines: null,
                    ),
                  );
                }),

                // Text(
                //   widget.description,
                //   style: const TextStyle(
                //     color: Colors.white,
                //     fontSize: 15,
                //     // fontWeight: FontWeight.normal,
                //   ),
                // ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      GestureDetector(
                        onTap: remove,
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * .05,
                          width: MediaQuery.sizeOf(context).width * .08,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.remove,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * .02,
                      ),
                      Text(
                        "$qty",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 25,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * .02,
                      ),
                      GestureDetector(
                        onTap: add,
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * .05,
                          width: MediaQuery.sizeOf(context).width * .08,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ]),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "₵",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              cost(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          "Total Price",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .03,),
                  ElevatedButton(
                   style: ButtonStyle(
                    backgroundColor:const MaterialStatePropertyAll(Colors.yellow),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                   ), 
                    onPressed: (){}, child:
             const  Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                 child:    Text("Add to chat",
                    style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                    ),
               )),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .01,),
             InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context){
                return const HomeView();
              }));},
               child:  const Icon(Icons.home,
               color: Colors.white,),
             )
              ],
            ),
          )
        ],
      ),
    );
  }
}
