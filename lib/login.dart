import 'package:flutter/material.dart';
import 'package:learning/validate.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

TextEditingController _controller = new TextEditingController();
TextEditingController _controller2 = new TextEditingController();
bool isEmailValid = false;

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: content(),
    );
  }

  Widget content() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(60, 60),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Container(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: Icon(
                Icons.person,
                size: 50,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Sign in to continue.",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 50,
              ),
              inputForm("Email", _controller),
              SizedBox(
                height: 20,
              ),
              inputForm("Password", _controller2),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "Forgot Password ?",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("New User? "),
                  Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget inputForm(String title, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: title == "Email"
                ? Border.all(
                    width: 0.5,
                    color: controller.text.isEmpty
                        ? Colors.grey
                        : isEmailValid
                            ? Colors.green
                            : Colors.red)
                : Border.all(width: 0.5, color: Colors.grey),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(border: InputBorder.none),
              onChanged: (value) {
                if (title == "Email") {
                  if (value.isEmpty) {
                    setState(() {
                      isEmailValid = true;
                    });
                  } else {
                    final isValid = validateEmailAddress(value);
                    if (isValid) {
                      setState(() {
                        isEmailValid = true;
                      });
                    } else {
                      setState(() {
                        isEmailValid = false;
                      });
                    }
                  }
                }
              },
            ),
          ),
        )
      ],
    );
  }
}
