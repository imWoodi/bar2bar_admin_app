import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Form(
                    key: controller.otpFormKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'تایید دو مرحله‌ای',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'کد تایید به شماره موبایل شما ارسال شد',
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 40),
                        TextFormField(
                          controller: controller.otpController,
                          keyboardType: TextInputType.number,
                          maxLength: 6,
                          decoration: const InputDecoration(
                            labelText: 'کد تایید',
                            prefixIcon: Icon(Icons.sms),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          ),
                          validator: (value) => value == null || value.isEmpty ? 'کد تایید را وارد کنید' : null,
                        ),
                        const SizedBox(height: 32),
                        SizedBox(
                          height: 48,
                          child: Obx(() => ElevatedButton(
                                onPressed: controller.isLoading.value
                                    ? null
                                    : () => controller.verifyOtp(),
                                child: controller.isLoading.value
                                    ? const SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: CircularProgressIndicator(strokeWidth: 2),
                                      )
                                    : const Text('تایید', style: TextStyle(fontSize: 16)),
                              )),
                        ),
                        const SizedBox(height: 16),
                        TextButton(
                          onPressed: () => controller.resendOtp(),
                          child: const Text('ارسال مجدد کد'),
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
    );
  }
} 