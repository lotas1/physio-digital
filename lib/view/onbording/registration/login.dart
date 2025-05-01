import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:physio_digital/services/auth/auth_service.dart';
import 'package:physio_digital/view/components/alert_dialog.dart';
import 'package:physio_digital/view/components/my_button.dart';
import 'package:physio_digital/view/components/my_text_field.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isPasswordVisible = false;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _fadeController, curve: Curves.easeIn));
    _fadeController.forward();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  void login(BuildContext context) async {
    // Validate inputs
    if (_emailController.text.trim().isEmpty ||
        !_emailController.text.contains('@')) {
      _showErrorDialog('Please enter a valid email address');
      return;
    }

    if (_passwordController.text.isEmpty ||
        _passwordController.text.length < 6) {
      _showErrorDialog('Password should be at least 6 characters');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final authService = AuthService();

    try {
      await authService.SignInWithEmailPassword(
          _emailController.text, _passwordController.text);
    } catch (e) {
      _showErrorDialog('Invalid email or password. Please try again.');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ElegantAlertDialog(
          title: 'Login Failed',
          message: message,
          onConfirm: () {},
        );
      },
    );
  }

  void googleSignIn() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Implement Google sign-in logic here
      await Future.delayed(const Duration(seconds: 1)); // Placeholder
    } catch (e) {
      _showErrorDialog('Google sign-in failed. Please try again.');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final accentColor = theme.colorScheme.secondary;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              theme.colorScheme.surface,
              theme.colorScheme.surface.withOpacity(0.8),
            ],
          ),
        ),
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * 0.08),

                    // App Logo/Brand
                    Center(
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: theme.colorScheme.primary.withOpacity(0.3),
                              blurRadius: 15,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Icon(
                            Icons.medical_services_rounded,
                            size: 40,
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: size.height * 0.05),

                    // Welcome text
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Back',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onSurface,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Sign in to continue to your account',
                          style: TextStyle(
                            fontSize: 16,
                            color: theme.colorScheme.onSurface.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: size.height * 0.05),

                    // Email field
                    MyTextField(
                      controller: _emailController,
                      hintText: 'Email Address',
                      obscureText: false,
                      prefix: Icon(
                        Icons.email_outlined,
                        color: theme.colorScheme.onSurface.withOpacity(0.6),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),

                    // Password field
                    MyTextField(
                      controller: _passwordController,
                      hintText: 'Password',
                      obscureText: !_isPasswordVisible,
                      suffix: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        child: Icon(
                          _isPasswordVisible
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: theme.colorScheme.onSurface.withOpacity(0.6),
                        ),
                      ),
                      prefix: Icon(
                        Icons.lock_outline,
                        color: theme.colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Forgot password
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          // Add forgot password functionality
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: accentColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: size.height * 0.04),

                    // Login button
                    MyButton(
                      text: 'Sign In',
                      onTap: () => login(context),
                      isLoading: _isLoading,
                      height: 55,
                      backgroundColor: theme.colorScheme.primary,
                      margin: EdgeInsets.zero,
                    ),

                    SizedBox(height: size.height * 0.03),

                    // OR divider
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: theme.colorScheme.onSurface.withOpacity(0.3),
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'or',
                            style: TextStyle(
                              color:
                              theme.colorScheme.onSurface.withOpacity(0.7),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: theme.colorScheme.onSurface.withOpacity(0.3),
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: size.height * 0.03),

                    // Google sign in button
                    MyButton(
                      text: 'Sign in with Google',
                      icon: FontAwesomeIcons.google,
                      onTap: googleSignIn,
                      isLoading: false,
                      backgroundColor: Colors.white,
                      textColor: Colors.black87,
                      height: 55,
                      margin: EdgeInsets.zero,
                    ),

                    SizedBox(height: size.height * 0.05),

                    // Sign up prompt
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              color:
                              theme.colorScheme.onSurface.withOpacity(0.7),
                            ),
                          ),
                          GestureDetector(
                            onTap: widget.onTap,
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: accentColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: size.height * 0.03),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
