// ignore_for_file: file_names

import 'package:application/barrelView/barrlView.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  void _showDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        content: Text(message),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffdf762e)),
            child: const Text("OK", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final logincontroller = Provider.of<LoginController>(context);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xfff7f7f7),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width * .03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset('assets/images/imageIcon.webp', scale: 1),
                SizedBox(height: height * .02),
                CustomTextField(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  controller: logincontroller.emailController,
                  hintText: 'Email...',
                  prefixIcon: const Icon(
                    Icons.message_outlined,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: height * .02),
                CustomTextField(
                  controller: logincontroller.passwordController,
                  hintText: 'Password',
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  isObSecure: logincontroller.isObsecure,
                  suffixIcon: IconButton(
                    onPressed: () => logincontroller.togglePasswordVisibility(),
                    icon: Icon(
                      logincontroller.isObsecure
                          ? Icons.visibility_off
                          : Icons.remove_red_eye_rounded,
                      color: Colors.black,
                    ),
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: height * .03),
            CustomButton(
              title: logincontroller.isLoading ? "Please wait..." : "Log In",
              onTap: () {
                final email = logincontroller.emailController.text.trim();
                final password = logincontroller.passwordController.text.trim();

                if (email.isEmpty || password.isEmpty) {
                  _showDialog(
                      context, "Missing Fields", "Please fill in all fields");
                } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                    .hasMatch(email)) {
                  _showDialog(context, "Invalid Email",
                      "Please enter a valid email address");
                } else if (password.length < 6) {
                  _showDialog(context, "Weak Password",
                      "Password must be at least 6 characters");
                } else {
                  logincontroller.userLogin(context);
                }
              },
              bgColor: const Color(0xffdf762e),
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
              height: height * 0.07,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
