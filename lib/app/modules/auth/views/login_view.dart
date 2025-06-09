import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';
import 'dart:math' as math;
import '../controllers/auth_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat(reverse: true);

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  Transform.translate(
                    offset: Offset(
                      _animation.value * 100 * math.cos(math.pi / 4),
                      _animation.value * 100 * math.sin(math.pi / 4),
                    ),
                    child: Transform.scale(
                      scale: 1.1 + (_animation.value * 0.05),
                      child: Image.asset(
                        'assets/images/LoginBackground.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 450),
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(32),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              padding: const EdgeInsets.all(32),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(
                                  color: Colors.black.withOpacity(0.3),
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: Form(
                                key: controller.formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'ورود به پنل مدیریت بارتوبار',
                                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 40),
                                    SizedBox(
                                      height: 80,
                                      child: TextFormField(
                                        controller: controller.usernameController,
                                        style: const TextStyle(color: Colors.black87),
                                        decoration: InputDecoration(
                                          labelText: 'نام کاربری',
                                          labelStyle: const TextStyle(color: Colors.black54),
                                          prefixIcon: const Icon(Icons.person, color: Colors.black54),
                                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                          errorMaxLines: 1,
                                          errorStyle: const TextStyle(color: Colors.red),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8),
                                            borderSide: BorderSide(color: Colors.black.withOpacity(0.3)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8),
                                            borderSide: const BorderSide(color: Colors.black87),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8),
                                            borderSide: const BorderSide(color: Colors.red),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8),
                                            borderSide: const BorderSide(color: Colors.red),
                                          ),
                                        ),
                                        validator: (value) => value == null || value.isEmpty ? 'نام کاربری را وارد کنید' : null,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    SizedBox(
                                      height: 80,
                                      child: TextFormField(
                                        controller: controller.passwordController,
                                        obscureText: true,
                                        style: const TextStyle(color: Colors.black87),
                                        decoration: InputDecoration(
                                          labelText: 'رمز عبور',
                                          labelStyle: const TextStyle(color: Colors.black54),
                                          prefixIcon: const Icon(Icons.lock, color: Colors.black54),
                                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                          errorMaxLines: 1,
                                          errorStyle: const TextStyle(color: Colors.red),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8),
                                            borderSide: BorderSide(color: Colors.black.withOpacity(0.3)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8),
                                            borderSide: const BorderSide(color: Colors.black87),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8),
                                            borderSide: const BorderSide(color: Colors.red),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8),
                                            borderSide: const BorderSide(color: Colors.red),
                                          ),
                                        ),
                                        validator: (value) => value == null || value.isEmpty ? 'رمز عبور را وارد کنید' : null,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    SizedBox(
                                      height: 48,
                                      child: Obx(() => ElevatedButton(
                                        onPressed: controller.isLoading.value
                                            ? null
                                            : () => controller.login(),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black87,
                                          foregroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: controller.isLoading.value
                                            ? const SizedBox(
                                                width: 24,
                                                height: 24,
                                                child: CircularProgressIndicator(
                                                  strokeWidth: 2,
                                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                                ),
                                              )
                                            : const Text('ورود', style: TextStyle(fontSize: 16)),
                                      )),
                                    ),
                                    const SizedBox(height: 6),
                                    SizedBox(
                                      height: 48,
                                      child: Obx(() => ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black87,
                                          foregroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: const Text('فراموشی رمز عبور', style: TextStyle(fontSize: 16)),
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
} 