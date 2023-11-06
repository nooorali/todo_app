import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_v1/core/network_layer/user_fun.dart';


import '../../app_provider.dart';
import '../../model/user.dart';
import '../home/home_view/widget/custom_textfield.dart';

class RegisterView extends StatefulWidget {
  static const String routeName = "register";

  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  bool isVisiblePass = false;
  bool isVisibleConfirmPass = false;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appProvider = Provider.of<AppProvider>(context);
    return Container(
      decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          image: const DecorationImage(
            image: AssetImage("assets/images/background_pattern.png"),
            fit: BoxFit.cover,
          )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          title: Text(
            "Register",
            style: theme.textTheme.titleLarge,
          ),
          centerTitle: true,
          toolbarHeight: 120,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.14,
                  ),
                  CustomTextField(
                    textEditingController: nameController,
                    validator: (value) {
                      if (value == null || value
                          .trim()
                          .isEmpty) {
                        return "You must enter your name";
                      }
                      return null;
                    },
                    label: "Full Name",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    textEditingController: emailController,
                    validator: (value) {
                      if (value == null || value
                          .trim()
                          .isEmpty) {
                        return "You must enter your password";
                      }
                      var regex = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      if (!regex.hasMatch(value)) {
                        return "Invalid email address";
                      }
                      return null;
                    },
                    label: "Email",
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextField(
                    textEditingController: passController,
                    icon: GestureDetector(
                      onTap: () {
                        isVisiblePass = !isVisiblePass;
                        setState(() {});
                      },
                      child: isVisiblePass == true
                          ? const Icon(
                        Icons.remove_red_eye_outlined,
                        size: 28,
                      )
                          : const Icon(
                        Icons.visibility_off_outlined,
                        size: 28,
                      ),
                    ),
                    obscure: !isVisiblePass,
                    color: theme.primaryColor,
                    validator: (value) {
                      if (value == null || value
                          .trim()
                          .isEmpty) {
                        return "You must enter your password";
                      }
                      var regex = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                      if (regex.hasMatch(value)) {
                        return "Invalid password";
                      }

                      return null;
                    },
                    label: "Password",
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextField(
                    textEditingController: confirmPassController,
                    icon: GestureDetector(
                      onTap: () {
                        isVisibleConfirmPass = !isVisibleConfirmPass;
                        setState(() {});
                      },
                      child: isVisibleConfirmPass == true
                          ? const Icon(
                        Icons.remove_red_eye_outlined,
                        size: 28,
                      )
                          : const Icon(
                        Icons.visibility_off_outlined,
                        size: 28,
                      ),
                    ),
                    obscure: !isVisibleConfirmPass,
                    color: theme.primaryColor,
                    validator: (value) {
                      if (value == null || value
                          .trim()
                          .isEmpty) {
                        return "You must enter confirm password";
                      }
                      if (value != passController.text) {
                        return "Password does not match";
                      }
                      return null;
                    },
                    label: "Confirm Password",
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  MaterialButton(
                    onPressed: () {
                      register();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Register now",
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          const Icon(Icons.arrow_forward,
                              size: 28, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void register() async {
    if (formKey.currentState!.validate()) {
      // call login api

      try {
       var user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passController.text);

       UserFun.createUser(
          Users (
            id: user.user?.uid,
            fullName: nameController.text,
            email: emailController.text,

          )
       );
      }

      on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }

    }
  }
}
