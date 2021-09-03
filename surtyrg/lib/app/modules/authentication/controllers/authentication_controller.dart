import 'dart:async';
//import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:surtyrg/app/config/routes/app_pages.dart';
import 'package:surtyrg/app/utils/services/firebase_services.dart';

class AuthenticationController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final otp = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  late final Registrant? registrant;
  late final String? phoneNumber;

  String? verificationId;
  final isLoading = true.obs;

  final _durationTimeOut = Duration(seconds: 60);
  final isCanResendCode = false.obs;
  final durationCountdown = 0.obs;

  @override
  void onInit() {
    registrant = _getUser();
    phoneNumber = _getPhoneNumber();
    verifyPhoneNumber();
    super.onInit();
  }

  void verifyPhoneNumber() async {
    isLoading.value = true;
    update(['verificationButton']);

    isCanResendCode.value = false;
    String? _phoneNumber = phoneNumber ?? registrant?.phoneNumber;
    print(_phoneNumber);

    if (_phoneNumber != null) {
      await _auth.verifyPhoneNumber(
        phoneNumber: _phoneNumber,
        verificationCompleted: (phoneAuthCredential) async {
          print("verify phone number : verification completed");
          await _auth.signInWithCredential(phoneAuthCredential);

          if (registrant != null) {
            _saveRegistrantAndGoToHome();
          } else {
            _goToHome();
          }
        },
        verificationFailed: (FirebaseAuthException e) async {
          //isLoading.value = true;
          //update(['verificationButton']);
          isCanResendCode.value = false;
          Get.snackbar(
            "Fallo en la verificación",
            (e.code == 'invalid-phone-number') ? 'Numero invalido' : e.code,
            backgroundColor: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 60),
          );
        },
        codeSent: (verificationId, forceResendingToken) async {
          print("verify phone number : code success send");
          this.verificationId = verificationId;
          isLoading.value = false;
          update(['verificationButton']);
          _validateCountdownResendCode();
        },
        codeAutoRetrievalTimeout: (verificationId) {},
        timeout: _durationTimeOut,
      );
    }
  }

  void verifySmsCode() async {
    //Este
    if (formKey.currentState!.validate() && verificationId != null) {
      isLoading.value = true;

      try {
        await _auth.signInWithCredential(PhoneAuthProvider.credential(
            verificationId: verificationId!, smsCode: otp.text));
      } catch (e) {
        print("codigo invalido");
        Get.snackbar(
          "Codigo invalido",
          "Por favor, ingrese el código correcto",
          backgroundColor: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      } finally {
        isLoading.value = false;

        if (_auth.currentUser != null) {
          /// authentication success
          if (registrant != null) {
            _saveRegistrantAndGoToHome();
          } else {
            _goToHome();
          }
        } else {
          /// authentication faileed
          Get.snackbar(
            "Invalid Code",
            "Please enter the correct code",
            backgroundColor: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      }
    }
  }

  void _saveRegistrantAndGoToHome() {
    UserServices.addUser(
      registrant!,
      onSuccess: () => _goToHome(),
      onError: (e) => isLoading.value = false,
    );
  }

  void _goToHome() {
    isLoading.value = false;
    Get.offAllNamed(Routes.home);
  }

  void _validateCountdownResendCode() {
    isCanResendCode.value = false;
    var maxDurationInSecond = _durationTimeOut.inSeconds;
    var currentDurationSecond = 0;
    durationCountdown.value = maxDurationInSecond;

    Timer.periodic(Duration(seconds: 1), (timer) {
      currentDurationSecond++;
      if (maxDurationInSecond - currentDurationSecond >= 0) {
        durationCountdown.value = maxDurationInSecond - currentDurationSecond;
      } else {
        isCanResendCode.value = true;
        timer.cancel();
      }
    });
  }

  Registrant? _getUser() {
    try {
      return Get.arguments as Registrant;
    } catch (_) {
      return null;
    }
  }

  String? _getPhoneNumber() {
    try {
      return Get.parameters['phone_number'];
    } catch (_) {
      return null;
    }
  }
}
