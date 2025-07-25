// ignore_for_file: file_names, use_build_context_synchronously

import 'package:application/barrelView/barrlView.dart';

class LoginController extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;
  bool isObsecure = true;

  final AuthRepository _authRepo;

  LoginController(this._authRepo);

  void togglePasswordVisibility() {
    isObsecure = !isObsecure;
    notifyListeners();
  }

  Future<void> userLogin(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showDialog(context, "Missing Info", "Email and Password are required!");
      return;
    }

    isLoading = true;
    notifyListeners();

    final success = await _authRepo.login(email, password);

    isLoading = false;
    notifyListeners();

    if (success) {
      emailController.clear();
      passwordController.clear();

      await _showDialog(context, "Success", "Login successful!");

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Homescreen()),
      );
    } else {
      _showDialog(context, "Login Failed",
          "Please check your credentials and try again.");
    }
  }

  Future<void> _showDialog(BuildContext context, String title, String message) {
    return showDialog(
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
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
