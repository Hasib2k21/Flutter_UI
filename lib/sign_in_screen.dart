import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Variable to control password visibility
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back!',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(color: AppColors.textHead),
                ),
                const SizedBox(height: 8),
                Text(
                  'Enter your email to start shopping and get awesome deals today!',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: AppColors.textBody),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    hintText: 'Email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                        .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  // Toggle password visibility
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                    hintText: 'Password',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: () {

                  },
                  child: Text(
                    'Forgot Your Password?',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: AppColors.themeColor),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Proceed to log in if the form is valid
                     // Get.to(() => const BottomNavScreen());
                    }
                  },
                  child: const Text('Log In'),
                ),
                const SizedBox(height: 40),
                _buildOrSizedBox(),
                const SizedBox(height: 30),
                _buildFbElevatedButton('Log In With Google', AssetsPath.google),
                const SizedBox(height: 12),
                _buildFbElevatedButton('Log In With Facebook', AssetsPath.fb),
                const SizedBox(height: 36),
                _buildRichText(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOrSizedBox() {
    return const SizedBox(
      width: 343,
      height: 14,
      child: Row(
        children: [
          Expanded(
            child: Divider(color: Color(0xFFC2C2C2), thickness: 0.5),
          ),
          SizedBox(width: 8),
          Text(
            'OR',
            style: TextStyle(
              color: Color(0xFF404040),
              fontSize: 12,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Divider(color: Color(0xFFC2C2C2), thickness: 0.5),
          ),
        ],
      ),
    );
  }

  Widget _buildFbElevatedButton(String text, image) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        side: const BorderSide(color: AppColors.themeColor, width: 1),
      ),
      onPressed: () {},
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 12,
        children: [
          Image.asset(
            image,
            height: 20,
          ),
          Text(
            text,
            style: const TextStyle(color: AppColors.themeColor),
          ),
        ],
      ),
    );
  }

  Widget _buildRichText(BuildContext context) {
    return Center(
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.black87),
              text: "Don't have an Account? ",
              children: [
                TextSpan(
                  text: 'Register',
                  style: const TextStyle(color: AppColors.themeColor),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Handle register navigation
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
