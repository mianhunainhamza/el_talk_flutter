import 'package:auth_screens/auth/login_screen.dart';
import 'package:auth_screens/widgets/custom_button.dart';
import 'package:auth_screens/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();

    return Scaffold(
      // backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/lottie/login.json', height: 300),
              const SizedBox(height: 10),
              CustomTextField(
                labelText: 'Name',
                icon: Icons.person,
                onSave: (text) {},
                controller: nameController,

              ),
              const SizedBox(height: 15),
              CustomTextField(
                labelText: 'Email',
                icon: Icons.email,
                onSave: (text) {},
                controller: emailController,

              ),
              const SizedBox(height: 15),
              CustomTextField(
                labelText: 'Password',
                icon: Icons.lock,
                isPassField: true,
                onSave: (text) {},
                controller: passwordController,

              ),
              const SizedBox(height: 15),
              CustomTextField(
                labelText: 'Confirm Password',
                icon: Icons.lock,
                isPassField: true,
                onSave: (text) {},
                controller: confirmPasswordController,

              ),
              const SizedBox(height: 15),
             CustomButton(title: 'Sign up', onTap: (){

             }),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextButton(
                    onPressed: () {
                      // Add your login navigation logic here
                    },
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, CupertinoPageRoute(builder: (context)=>const LoginScreen()));
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
