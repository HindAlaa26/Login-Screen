import 'package:first_project_test/shared_component/custom_text.dart';
import 'package:first_project_test/shared_component/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/plant.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // arrow back icon 
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.grey[100],
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.green[900],
                        size: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
           // App image 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/images/plant_safer.png"),
                  fit: BoxFit.cover,
                  width: 190,
                ),
              ],
            ),
          // login content 
            Expanded(
              child: Container(
                height: double.infinity,
                padding: EdgeInsets.only(
                  top: 90,
                  left: 20,
                  right: 20,
                  bottom: 20,
                ),
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(70)),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        customText(
                          text: "Welcome back",
                          textColor: Colors.green.shade900,
                          textSize: 30,
                          textFontWeight: FontWeight.bold,
                          textWordSpacing: 3,
                          textLetterSpacing: 2,
                        ),
                        customText(
                          text: "Login to your account",
                          textColor: Colors.grey,
                          textFontWeight: FontWeight.w500,
                        ),

                        CustomTextFormField(
                          text: "Email / username",
                          controller: emailController,
                        ),

                        CustomTextFormField(
                          text: "Password",
                          isPassword: true,
                          controller: passwordController,
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 8,
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 10,
                                child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor: Colors.green.shade900,
                                ),
                              ),
                              SizedBox(width: 20),
                              customText(
                                text: "Remember me",
                                textColor: Colors.grey,
                                textFontWeight: FontWeight.w800,
                              ),
                              Spacer(),
                              TextButton(
                                onPressed: () {},
                                child: customText(
                                  text: "Forget password?",
                                  textFontWeight: FontWeight.bold,
                                  textColor: Colors.green.shade900,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 90),
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                               
                               if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty)
                               {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.green.shade900,
                                    duration: Duration(seconds: 1),
                                    content: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        customText(
                                          text: 'Done',
                                          textColor: Colors.white,
                                          textSize: 20,
                                          textFontWeight: FontWeight.bold,
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.done,
                                            color: Colors.white,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.emoji_emotions,
                                            color: Colors.yellow,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                               
                              }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 5,
                              minimumSize: Size(double.infinity, 50),
                              backgroundColor: Colors.green.shade900,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),

                            child: customText(
                              text: "Login",
                              textColor: Colors.white,
                              textSize: 20,
                              textFontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              customText(
                                text: " Don't have an account? ",
                                textColor: Colors.grey,
                                textFontWeight: FontWeight.bold,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: customText(
                                  text: "Sign up",
                                  textColor: Colors.green.shade900,
                                  textFontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
