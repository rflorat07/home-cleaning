import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../features/authentication/screens/login/login.dart';
import '../../../features/authentication/screens/verify_email/verify_email.dart';
import '../../../features/navigation/screens/navigation_menu.dart';
import '../../../features/onboarding/screens/onboarding.dart';
import '../../../utils/utils.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _firebaseAuth = FirebaseAuth.instance;

  /// Get Authentication User Data
  User? get authUser => _firebaseAuth.currentUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
    super.onReady();
  }

  /// -- Function to Show Relevant Screen
  screenRedirect() async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: user.email));
      }
    } else {
      /// -- Local Storage
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }
  }

  /// [EmailAuthentication] - LOGIN
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw TFormatExceptions();
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// [EmailAuthentication] - REGISTER
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw TFormatExceptions();
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// [EmailVerification] - Mail verification
  Future<void> sendEmailVerification() async {
    try {
      return _firebaseAuth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw TFormatExceptions();
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// [ForgotPassword] - ForgotPassword
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw TFormatExceptions();
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// [LogOutUser] - LogOut
  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw TFormatExceptions();
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
}
