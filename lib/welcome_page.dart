import 'package:flutter/material.dart';
import 'package:fruit_basket/loginview.dart';
import 'package:fruit_basket/signup_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(children: [
            Image.asset("assets/images/frs.png"),
            // SizedBox(
            //   height: MediaQuery.sizeOf(context).height*.1,
            // ),
            const Positioned(
                bottom: 85,
                right: 100,
                child: Text(
                  "FruitBasket",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.normal,
                    color: Colors.yellow,
                  ),
                )),
          ]),
          const Text(
            "Let's get started!",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .03,
          ),
          const Text(
            "Login to enjoy the features we've  ",
            style: TextStyle(
              fontSize: 20,
              //fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 02,
          ),
          const Text(
            "provided and stay healthy!",
            style: TextStyle(
              fontSize: 20,

              //fontWeight: FontWeight.normal,

              color: Colors.grey,
            ),
          ),
                    SizedBox(
            height: MediaQuery.sizeOf(context).height * .05,
          ),
          ElevatedButton(
            style:  ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                backgroundColor: const MaterialStatePropertyAll(Colors.yellow)),
            onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LoginView();
                  }));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 65, vertical: 10),
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 20,
            
                  //fontWeight: FontWeight.normal,
            
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .05,
          ),
                    ElevatedButton(
            style:  ButtonStyle(
              side:const MaterialStatePropertyAll(BorderSide(color: Colors.yellow, style: BorderStyle.solid)),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                backgroundColor: const MaterialStatePropertyAll(Colors.white)),
            onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SignupPage();
                  }));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 65, vertical: 10),
              child: Text(
                "Signup",
                style: TextStyle(
                  fontSize: 20,
            
                  //fontWeight: FontWeight.normal,
            
                  color: Colors.yellow,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
