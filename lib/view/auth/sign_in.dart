import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/view%20model/auth_view_model.dart';
import 'package:shop/view/auth/sign_up.dart';
import 'package:shop/widgets/custom_text.dart';
import 'package:shop/widgets/custom_textForm.dart';
//import '../../constants.dart';
import 'package:shop/constants.dart';

class SingIn extends GetWidget<AuthViewModel> {
  SingIn({Key? key}) : super(key: key);
  var controller = Get.put(AuthViewModel());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //FirebaseAuth auth = FirebaseAuth.instance;
  //TextEditingController emailController = TextEditingController();
  //TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: GetBuilder<AuthViewModel>(
            builder: (_) => Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  width: Get.width,
                  height: Get.height * .5,
                  decoration:
                      const BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                    )
                  ]),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: 'Welcome,',
                              isbold: true,
                              size: 24,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(SignUp());
                              },
                              child: CustomText(
                                text: 'Sign Up',
                                isbold: true,
                                color: mainColor,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(
                          text: 'sign in to continue',
                          color: Colors.grey,
                          size: 16,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        CustomText(
                          text: 'Email',
                          color: Colors.grey,
                          size: 16,
                        ),
                        CustomTextForm(
                          // controller: emailController,
                          onSave: (val) {
                            controller.email = val;
                          },
                          hint: 'ahmednadyrm@gmail.com',
                          obs: false,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CustomText(
                          text: 'Password',
                          color: Colors.grey,
                          size: 16,
                        ),
                        CustomTextForm(
                          //controller: passwordController,
                          onSave: (val) {
                            controller.password = val;
                          },
                          hint: '**********',
                          obs: true,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomText(
                          alignment: Alignment.topRight,
                          text: 'Forgot Password?',
                          color: Colors.black,
                          size: 16,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            _formKey.currentState!.save();
                            if (_formKey.currentState!.validate()) {
                              await controller.signUser();
                            }
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(fontSize: 16),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: mainColor,
                              fixedSize: Size.fromWidth(
                                Get.width * .8,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                CustomText(
                  text: '-OR-',
                  isbold: true,
                  alignment: Alignment.center,
                  size: 20,
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(spreadRadius: .8, color: Colors.grey)
                      ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(
                            'https://cdn-icons-png.flaticon.com/512/1312/1312139.png',
                            width: 30,
                            height: 30,
                          ),
                          CustomText(
                            text: 'Sign in with Facebook',
                            size: 16,
                            alignment: Alignment.center,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      controller.googleAcount();
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(spreadRadius: .8, color: Colors.grey)
                      ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(
                            'https://cdn-icons-png.flaticon.com/512/281/281781.png',
                            width: 30,
                            height: 30,
                          ),
                          CustomText(
                            text: 'Sign in with google',
                            size: 16,
                            alignment: Alignment.center,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
