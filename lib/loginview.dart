import 'package:flutter/material.dart';
import 'package:fruit_basket/home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool obscure = true;
  final _formkey = GlobalKey<FormState>();
  TextEditingController emaiController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Login",
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Form(
              key: _formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .03,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "email is required";
                      } else {
                        return null;
                      }
                    },
                    controller: emaiController,
                    decoration: InputDecoration(
                      hintText: "example.@gamil.com",
                      labelText: "Email",
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: Colors.grey,
                        size: 25,
                      ),
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          )),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                    cursorColor: Colors.grey,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .03,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "password is required";
                      } else {
                        return null;
                      }
                    },
                    controller: passwordController,
                    obscureText: obscure,
                    decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              obscure = !obscure;
                            });
                          },
                          child: Icon(
                            obscure
                                ? Icons.visibility_off_outlined
                                : Icons.visibility,
                            size: 25,
                          ),
                        ),
                        labelText: "Password",
                        hintText: "**********",
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Colors.grey,
                          size: 25,
                        ),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.grey),
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .01,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {},
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .01,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(Colors.yellow),
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
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 110, vertical: 15),
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .01,
                ),
                const Text(
                  "Signup",
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Row(children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .02,
              ),
              SizedBox(
                  width: MediaQuery.sizeOf(context).width * .4,
                  child: const Divider()),
              const Text("Or"),
              SizedBox(
                  width: MediaQuery.sizeOf(context).width * .4,
                  child: const Divider()),
            ]),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .06,
            ),
            const Elevatedbutton(
              image: "assets/images/google.png",
              text: "Sign in with Google",
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .03,
            ),
            const Elevatedbutton(
              image: "assets/images/facebook.png",
              text: "Sign in with Google",
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .03,
            ),
            const Elevatedbutton(
              image: "assets/images/ios.png",
              text: "Sign in with Google",
            ),
          ],
        ),
      ),
    );
  }
}

class Elevatedbutton extends StatelessWidget {
  const Elevatedbutton({super.key, this.image, this.text});
  final String? image;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: const MaterialStatePropertyAll(0),
        side: const MaterialStatePropertyAll(BorderSide(color: Colors.grey)),
        backgroundColor: const MaterialStatePropertyAll(Colors.white),
        shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      ),
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Row(
          children: [
            SizedBox(
                width: MediaQuery.sizeOf(context).width * .06,
                height: MediaQuery.sizeOf(context).height * .07,
                child: Image.asset(image!)),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * .01,
            ),
            Text(
              text!,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
