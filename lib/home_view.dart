import 'package:flutter/material.dart';
import 'package:fruit_basket/order_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    const degree = 110.15;
    const angle = degree * 360 / 180;
    const degree1 = 110;
    const angle1 = degree1 * 360 / 180;

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "FruitBasket",
                      style: TextStyle(
                        fontFamily: "kapakana",
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        )),
                  ],
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * .08),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 1,
                  height: MediaQuery.sizeOf(context).height * .7,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Welcome",
                              style: TextStyle(
                                fontSize: 35,
                                color: Colors.yellow,
                              ),
                            ),
                            SizedBox(
                                height: MediaQuery.sizeOf(context).height * .02),
                            const Text("To The Fruit Basket",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                )),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * .5,
                              child: const Text(
                                  "excepteur aliqua qui labore minim non. Velit eiusmod in fugiat nulla amet mollit nulla do sunt ad.",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  )),
                            ),
                            SizedBox(
                                height: MediaQuery.sizeOf(context).height * .05),
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: ((context)=>const OrderView())));
                              },
                              child: Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * .03,
                                  width: MediaQuery.sizeOf(context).width * .28,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(10),
                                    ),
                                    color: Colors.yellow,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "View More",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.sizeOf(context).width *
                                            .03,
                                      ),
                                      const Icon(
                                        Icons.arrow_forward,
                                        size: 15,
                                      )
                                    ],
                                  )),
                            )
                          ],
                        ),
                        Positioned(
                          right: -40,
                          bottom: 10,
                          child: Transform.rotate(
                            angle: angle,
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width * .6,
                                  child: const Image(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage("assets/images/frbg.png")),
                                ),
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width * .6,
                                  child: const Image(
                                      opacity: AlwaysStoppedAnimation(150),
                                      fit: BoxFit.cover,
                                      image: AssetImage("assets/images/wat.png")),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          right: 50,
                          top: 40,
                          child: Transform.flip(
                            flipX: true,
                            child: Transform.rotate(
                              angle: angle1,
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.sizeOf(context).width * .3,
                                    child: const Image(
                                        fit: BoxFit.cover,
                                        image:
                                            AssetImage("assets/images/frbg.png")),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.sizeOf(context).width * .3,
                                    child: const Image(
                                        opacity: AlwaysStoppedAnimation(150),
                                        fit: BoxFit.cover,
                                        image:
                                            AssetImage("assets/images/wat.png")),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * .05),
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
                SizedBox(height: MediaQuery.sizeOf(context).height * .03),
             const   Icon(Icons.home,
             color: Colors.white,)
              ],
            ),
          ),
          Positioned(
            top:-60 ,
            right: -140,
            child: Transform.flip(
              flipY: true,
              child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * .7,
                  child: const Image(
                    opacity: AlwaysStoppedAnimation(150),
                    image: AssetImage('assets/images/wat.png'),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

class Costumclass extends StatelessWidget {
  const Costumclass({
    super.key,
    this.tittle,
  });
  final String? tittle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Material(
        color: Colors.grey.shade700,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 25, top: 2, bottom: 2, right: 3),
          child: Row(
            children: [
              Text(
                tittle!,
                style: const TextStyle(
                    fontFamily: "kapakana", fontSize: 15, color: Colors.white),
              ),
             SizedBox(
               width: MediaQuery.sizeOf(context).width * .04,
             ),
              const Icon(
                Icons.circle,
                size: 8,
                color: Colors.yellow,
              )
            ],
          ),
        ),
      ),
    );
  }
}
