import 'package:alumni_dk/core/helpers/validator.dart';
import 'package:alumni_dk/core/network/api_client.dart';
import 'package:alumni_dk/modules/auth/providers/forgot_password_provider.dart';
import 'package:alumni_dk/modules/auth/repos/forgot_password_repo.dart';
import 'package:alumni_dk/modules/auth/services/forgot_password_service.dart';
import 'package:alumni_dk/shared/widgets/my_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _requestPasswordReset(ForgotPasswordProvider provider) async {
    if (!_formKey.currentState!.validate()) return;

    try {
      await provider.requestPasswordReset(_emailController.text.trim());
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Password reset link sent to your email'), backgroundColor: Colors.green),
        );
      }
    } catch (e) {
      if (mounted) {
        MySnackBar.show(context, 'Error: ${e.toString()}', type: SnackBarType.error);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ForgotPasswordProvider(ForgotPasswordRepo(ForgotPasswordService(ApiClient()))),
      child: Consumer<ForgotPasswordProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Forgot Password'),
              elevation: 0,
              backgroundColor: Colors.transparent,
              foregroundColor: Theme.of(context).colorScheme.primary,
            ),
            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Logo or Icon
                        Icon(Icons.lock_reset, size: 80, color: Theme.of(context).colorScheme.primary),
                        const SizedBox(height: 24),

                        // Title and Subtitle
                        Text(
                          'Forgot Password?',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Enter your email address and we\'ll send you a link to reset your password.',
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 36),

                        // Form
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: 'Email Address',
                                  hintText: 'Enter your email address',
                                  prefixIcon: const Icon(Icons.email_outlined),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                                  filled: true,
                                  fillColor: Colors.grey[50],
                                ),
                                validator: (value) => Validator.validateEmail(value),
                                enabled: !provider.isLoading,
                              ),
                              const SizedBox(height: 24),

                              // Submit Button
                              SizedBox(
                                height: 50,
                                child: FilledButton(
                                  onPressed: provider.isLoading ? null : () => _requestPasswordReset(provider),
                                  child:
                                      provider.isLoading
                                          ? const SizedBox(
                                            width: 24,
                                            height: 24,
                                            child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                                          )
                                          : const Text(
                                            'Send Reset Link',
                                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                          ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Back to Login Link
                        TextButton(
                          onPressed: provider.isLoading ? null : () => Navigator.of(context).pop(),
                          child: Text(
                            'Back to Login',
                            style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.secondary),
                          ),
                        ),
                      ],
                    ),
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
