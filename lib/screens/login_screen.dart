import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: SizedBox(
          width: size.width * 0.76,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // username
              const Text('Login Page',
                  style: TextStyle(
                    color: Color(0xFF221133),
                    fontSize: 30,
                  )),
              _buildInputText(
                  'email', TextInputType.emailAddress, emailController),
              // pasword
              _buildInputText(
                  'password', TextInputType.visiblePassword, passwordController,
                  isPassword: true),
              // Button
              const SizedBox(height: 50),
              Row(
                children: [
                  const Text('Keep sign'),
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                  ),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                          },
                          child: const Text('Login'))),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }

  TextField _buildInputText(name, inputType, controller, {isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: inputType,
      decoration: InputDecoration(
          suffixIcon: isPassword
              ? const Icon(Icons.remove_red_eye)
              : const Icon(Icons.done),
          labelText: name,
          labelStyle: const TextStyle(
              color: Color.fromARGB(255, 26, 111, 33),
              fontWeight: FontWeight.w900),
          floatingLabelAlignment: FloatingLabelAlignment.start),
      onChanged: (value) {},
    );
  }
}