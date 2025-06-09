import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../../core/utils/toast.dart';

class AuthController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final otpFormKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final otpController = TextEditingController();
  final isLoading = false.obs;

  void login() async {
    if (!formKey.currentState!.validate()) return;
    
    // بررسی نام کاربری و رمز عبور
    if (usernameController.text != 'user' || passwordController.text != '123') {
      Toast.show(
        title: 'خطا',
        message: 'نام کاربری یا رمز عبور اشتباه است',
        isError: true,
      );
      return;
    }

    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1)); // شبیه‌سازی درخواست
    isLoading.value = false;
    
    // هدایت به صفحه تایید دو مرحله‌ای
    Get.toNamed(Routes.OTP);
  }

  void verifyOtp() async {
    if (!otpFormKey.currentState!.validate()) return;
    
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1)); // شبیه‌سازی درخواست
    isLoading.value = false;

    // در حالت واقعی، کد OTP باید با سرور بررسی شود
    if (otpController.text == '123456') {
      Toast.show(
        title: 'موفق',
        message: 'ورود با موفقیت انجام شد',
      );
      Get.offAllNamed(Routes.DASHBOARD);
    } else {
      Toast.show(
        title: 'خطا',
        message: 'کد تایید اشتباه است',
        isError: true,
      );
    }
  }

  void resendOtp() {
    Toast.show(
      title: 'اطلاعات',
      message: 'کد جدید ارسال شد',
    );
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    otpController.dispose();
    super.onClose();
  }
} 