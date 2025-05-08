// screens/register_screen.dart
import 'package:alumni_dk/core/helpers/validator.dart';
import 'package:alumni_dk/core/network/api_client.dart';
import 'package:alumni_dk/modules/auth/providers/register_provider.dart';
import 'package:alumni_dk/modules/auth/repos/register_repo.dart';
import 'package:alumni_dk/modules/auth/services/register_service.dart';
import 'package:alumni_dk/shared/widgets/my_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _signUp(RegisterProvider provider) async {
    if (!_formKey.currentState!.validate()) return;

    final isSuccess = await provider.register(
      _emailController.text,
      _nameController.text,
      _passwordController.text,
      _confirmPasswordController.text,
    );

    if (!mounted) return;

    MySnackBar.show(context, provider.message, type: isSuccess ? SnackBarType.success : SnackBarType.error);
    if (isSuccess) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterProvider(RegisterRepo(RegisterService(ApiClient()))),
      child: Consumer<RegisterProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: AppBar(title: const Text('Register')),
            body: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Create Account',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          hintText: 'Enter your full name',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: Validator.validateName,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: Validator.validateEmail,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                          prefixIcon: Icon(Icons.lock),
                        ),
                        obscureText: true,
                        validator: Validator.validatePassword,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          hintText: 'Confirm your password',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                          prefixIcon: Icon(Icons.lock),
                        ),
                        obscureText: true,
                        validator: (value) => Validator.validateConfirmPassword(_passwordController.text, value),
                      ),
                      const SizedBox(height: 10),
                      if (provider.message.isNotEmpty)
                        Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.red.shade50,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.red.shade200),
                          ),
                          child: Text(
                            provider.message,
                            style: TextStyle(color: Colors.red.shade800),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: provider.isLoading ? null : () => _signUp(provider),
                        child:
                            provider.isLoading
                                ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                                )
                                : const Text('Register'),
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Already have an account? Login'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
