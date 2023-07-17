import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  bool isHidden = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.only(
                bottom: 180, top: 120, left: 12, right: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Welcome to this app',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
                const SizedBox(height: 19),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w500),
                  cursorColor: Colors.black,
                  controller: _usernameController,
                  onChanged: (val) {},
                  decoration: InputDecoration(
                    // border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(left: 10),
                    labelText: 'UserName',
                    labelStyle: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1),
                        // borderRadius: BorderRadius.circular(5.w)
                        borderRadius: BorderRadius.circular(6)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1),
                        //  borderRadius: BorderRadius.circular(5.w)
                        borderRadius: BorderRadius.circular(6)),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w500),
                  cursorColor: Colors.black,
                  obscureText: isHidden,
                  controller: _passwordController,
                  onChanged: (val) {},
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 8),
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isHidden = !isHidden;
                          });
                        },
                        child: isHidden
                            ? const Icon(Icons.visibility_off,
                                size: 18, color: Colors.black)
                            : const Icon(Icons.visibility,
                                size: 18, color: Colors.black)),
                    labelText: 'PASSWORD',
                    labelStyle: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1),
                        // borderRadius: BorderRadius.circular(5.w)
                        borderRadius: BorderRadius.circular(6)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1),
                        //  borderRadius: BorderRadius.circular(5.w)
                        borderRadius: BorderRadius.circular(6)),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () async {
                    if (_usernameController.text == "Muviereck" &&
                        _passwordController.text == "12345") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    } else {
                      const snackBar = SnackBar(
                          content: Text("Incorrect username or password"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    FocusScope.of(context).unfocus();
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      // padding: EdgeInsets.all(10),
                      minimumSize: const Size(336, 43),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      )),
                  child: const Text('Login',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
