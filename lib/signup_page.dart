import 'package:flutter/material.dart';
import 'package:fruit_basket/home_view.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isSelected = false;
bool obscure = true;
final _formkey =GlobalKey<FormState>();
TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Signup",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Form(
        key: _formkey,
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .07,
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              validator: (value) {
                      if (value!.isEmpty) {
                        return "Name is required";
                      } else {
                        return null;
                      }
                    },
              controller: nameController,
              decoration: InputDecoration(
                isDense: true,
                // suffixIcon: const Icon(
                //   Icons.check,
                //   color: Colors.yellow,
                // ),
                prefixIcon: const Icon(
                  Icons.person_2_outlined,
                  color: Colors.yellow,
                  size: 26,
                ),
                hintText: "Sammy ",
                labelText: "Enter your full  name here",
                labelStyle: const TextStyle(color: Colors.black),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .04,
            ),
            TextFormField(
              validator: (value) {
                      if (value!.isEmpty) {
                        return "email is required";
                      } else if ( 
                        !RegExp(
                            r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(value)) {
                        return "Please enter a valid email";
                      }else {
                        return null;
                      }
                    },
              controller: emailController,
              decoration: InputDecoration(
                isDense: true,
                suffixIcon: const Icon(
                  Icons.check,
                  color: Colors.yellow,
                  size: 26,
                ),
                prefixIcon: const Icon(
                  Icons.email_outlined,
                  color: Colors.yellow,
                  size: 26,
                ),
                hintText: "example@gmail.com ",
                labelText: "Enter your email here",
                labelStyle: const TextStyle(color: Colors.black),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .04,
            ),
            TextFormField(
              validator: (value) {
                      if (value!.isEmpty) {
                        return "Password is required";
                      } else {
                        return null;
                      }
                    },
              controller: passwordController,
              obscureText: obscure,
              decoration: InputDecoration(
                isDense: true,
                suffixIcon:  InkWell(
                  onTap: () {
                    setState(() {
                      obscure = !obscure;
                    });
                  },
                  child:  Icon(obscure?
                    Icons.visibility_off_outlined:Icons.visibility,
                    color: Colors.yellow,
                    size: 26,
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.lock_outlined,
                  color: Colors.yellow,
                  size: 26,
                ),
                hintText: "************* ",
                labelText: "Enter your password",
                labelStyle: const TextStyle(color: Colors.black),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,   
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .04,
            ),
            Row(
              children: [

Checkbox(
  activeColor: Colors.yellow,
  value: isSelected,
   onChanged: (value){
    setState(() {
    
    isSelected = !isSelected;
    });
   }),
                // SizedBox(
                //   width: MediaQuery.sizeOf(context).width * .01,
                // ),
                const Text("I agree to the medaase "),
                const Text(
                  "Terms & Codition",
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 15,
                  ),
                ),
                const Text(
                  " and ",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const Column(
              children: [
                Text(
                  "Privacy & Policy.",
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .08,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .065,
              width: MediaQuery.sizeOf(context).width * .9,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:  
                        const MaterialStatePropertyAll(Colors.yellow),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                  ),
                    onPressed: () {
                if (_formkey.currentState!.validate()) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const HomeView();
                  }));
                }
              },
                  child: const Text(
                    "Signup",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )),
            ),
          ],
        ),
      )),
    );
  }
}
