import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:inbound_ms/features/auth/providers/auth_provider.dart';
import 'package:inbound_ms/core/navigation/app_router.dart';
import 'package:inbound_ms/core/utils/toast_utils.dart';
import 'package:inbound_ms/core/widgets/app_button.dart';
import 'package:inbound_ms/core/widgets/app_input_field.dart';

@RoutePage()
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignIn() async {
    if (!_formKey.currentState!.validate()) return;

    final authProvider = context.read<AuthProvider>();
    
    try {
      await authProvider.signIn(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
      
      if (mounted) {
        if (authProvider.isAuthenticated) {
          context.router.replace(const DashboardShellRoute());
        } else {
          ToastUtils.showError(
            context,
            message: 'Invalid credentials. Please try again.',
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ToastUtils.showError(
          context,
          message: e.toString(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      body: Row(
        children: [
          // Left Side: Beautiful Gradient / Hero Section (Desktop Only)
          if (isDesktop)
            Expanded(
              flex: 5,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(64.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Icon(Icons.warehouse, size: 64, color: Colors.white),
                        ),
                        const SizedBox(height: 40),
                        Text(
                          'Inbound MS',
                          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -1,
                              ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Streamline your inbound logistics, track purchase orders, and resolve discrepancies effortlessly.',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Colors.white70,
                                height: 1.5,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

          // Right Side: Login Form
          Expanded(
            flex: 4,
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(32.0),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 420),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (!isDesktop) ...[
                          const Icon(Icons.warehouse, size: 64, color: Color(0xFF203A43)),
                          const SizedBox(height: 32),
                        ],
                        Text(
                          'Welcome Back',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF0F2027),
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Please enter your credentials to access your dashboard.',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Colors.grey[600],
                              ),
                        ),
                        const SizedBox(height: 48),
                        AppInputField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          labelText: 'Email Address',
                          hintText: 'name@company.com',
                          prefixIcon: Icons.email_outlined,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!value.contains('@')) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        AppInputField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          labelText: 'Password',
                          prefixIcon: Icons.lock_outline,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword ? Icons.visibility_off : Icons.visibility,
                              color: Colors.grey[600],
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              ToastUtils.showInfo(context, message: 'Please contact your administrator.');
                            },
                            child: const Text('Forgot Password?'),
                          ),
                        ),
                        const SizedBox(height: 32),
                        Consumer<AuthProvider>(
                          builder: (context, auth, child) {
                            return AppButton(
                              label: 'Sign In',
                              onPressed: _handleSignIn,
                              isLoading: auth.isLoading,
                              backgroundColor: const Color(0xFF203A43),
                            );
                          },
                        ),
                        const SizedBox(height: 32),
                        Center(
                          child: Text(
                            '© 2026 Inbound MS. All rights reserved.',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: Colors.grey[500],
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
