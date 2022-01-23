import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:shop/view%20model/auth_view_model.dart';
import 'package:shop/widgets/custom_text.dart';
import 'package:shop/widgets/custom_textForm.dart';

import '../../constants.dart';

class SignUp extends GetWidget<AuthViewModel> {
  SignUp({Key? key}) : super(key: key);
  var controller = Get.put(AuthViewModel());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //FirebaseAuth auth = FirebaseAuth.instance;
  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Colors.black,
        ),
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: GetBuilder(
          init: AuthViewModel(),
          builder: (_) => SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  width: Get.width,
                  height: Get.height * .8,
                  decoration:
                      const BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                    )
                  ]),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomText(
                          text: 'Sign Up',
                          color: Colors.black,
                          size: 25,
                          isbold: true,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        CustomText(
                          text: 'Name',
                          color: Colors.grey,
                          size: 16,
                        ),
                        CustomTextForm(
                          onSave: (val) {},
                          hint: 'Ahmed Nady',
                          obs: false,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CustomText(
                          text: 'Email',
                          color: Colors.grey,
                          size: 16,
                        ),
                        CustomTextForm(
                          //controller: emailController,
                          onSave: (val) {
                            // emailController.text = val;
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
                            // passwordController.text = val;
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
                              controller.createUser();
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
