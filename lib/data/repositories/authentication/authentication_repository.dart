import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ///veriables
  //final deviceStorage = GetStorage();
  //final _auth = FirebaseAuth.instance;

  ///Get authenticated user data
  //User? get authUser => _auth.currentUser;

  ///called from main.dart on app launch
  // @override
  // void onReady() {
  //   //Remove the native splash screen
  //   FlutterNativeSplash.remove();
  //   //Redirect to the appropriate screen
  //   screenRedirect();
  // }

  ///function to show relevent screen and redirect accordingly
  // void screenRedirect() async {
  //   final user = _auth.currentUser;
  //   if (user != null) {
  //     if (user.emailVerified) {
  //       Get.offAll(() => const NavigationMenu());
  //     } else {
  //       Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
  //     }
  //   } else {
  //     deviceStorage.writeIfNull('IsFirstTime', true);
  //     //check if its the first time luanching the app
  //     deviceStorage.read('IsFirstTime') != true
  //         ? Get.offAll(() => const LoginScreen())
  //         : Get.offAll(const OnBoardingScreen());
  //   }
  //local storage
  // if (kDebugMode) {
  //   deviceStorage.read('IsFirstTime');
  // }
//}
/*--------------------------Email & Password sign in----------------------------*/

  ///[EmailAuthentication] - LogIn
  // Future<UserCredential> loginWithEmailAndPassword(
  //     String email, String password) async {
  //   try {
  //     return await _auth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     throw RFirebaseAuthException(e.code).message;
  //   } on FirebaseException catch (e) {
  //     throw RFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const RFormatException();
  //   } on PlatformException catch (e) {
  //     throw RPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong . Please try again';
  //   }
  // }

  ///[EmailAuthentication] - Register
  // Future<UserCredential> registerWithEmailAndPassword(
  //     String email, String password) async {
  //   try {
  //     return await _auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     throw RFirebaseAuthException(e.code).message;
  //   } on FirebaseException catch (e) {
  //     throw RFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const RFormatException();
  //   } on PlatformException catch (e) {
  //     throw RPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong . Please try again';
  //   }
  // }

  ///[EmailVerification] - Mail Verification
  // Future<void> sendEmailVerification() async {
  //   try {
  //     await _auth.currentUser?.sendEmailVerification();
  //   } on FirebaseAuthException catch (e) {
  //     throw RFirebaseAuthException(e.code).message;
  //   } on FirebaseException catch (e) {
  //     throw RFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const RFormatException();
  //   } on PlatformException catch (e) {
  //     throw RPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong . Please try again';
  //   }
  //}

  ///[ReAuthenticate] -ReAuthenticate User
  ///
  // Future<void> reAuthenticateWithEmailAndPassword(
  //     String email, String password) async {
  //   try {
  //     AuthCredential credential =
  //         EmailAuthProvider.credential(email: email, password: password);
  //     await _auth.currentUser!.reauthenticateWithCredential(credential);
  //   } on FirebaseAuthException catch (e) {
  //     throw RFirebaseAuthException(e.code).message;
  //   } on FirebaseException catch (e) {
  //     throw RFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const RFormatException();
  //   } on PlatformException catch (e) {
  //     throw RPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong . Please try again';
  //   }
  // }

  ///[EmailAuthentication] - Forget Password
  // Future<void> sendPasswordResetEmail(String email) async {
  //   try {
  //     await _auth.sendPasswordResetEmail(email: email);
  //   } on FirebaseAuthException catch (e) {
  //     throw RFirebaseAuthException(e.code).message;
  //   } on FirebaseException catch (e) {
  //     throw RFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const RFormatException();
  //   } on PlatformException catch (e) {
  //     throw RPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong . Please try again';
  //   }
  // }

  ///

/* -------------------------Federated Identity & social sign-in ----------------*/

  ///[GoogleAuthentication] - Google
  // Future<UserCredential?> signWithGoogle() async {
  //   try {
  //     ///triger the authentication flow
  //     final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

  //     ///obtain the auth details from the request
  //     final GoogleSignInAuthentication? googleAuth =
  //         await userAccount?.authentication;

  //     ///create a new credential
  //     final credentials = GoogleAuthProvider.credential(
  //         accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

  //     ///once sign in, return the Usercredential
  //     return await _auth.signInWithCredential(credentials);

  //     ///
  //   } on FirebaseAuthException catch (e) {
  //     throw RFirebaseAuthException(e.code).message;
  //   } on FirebaseException catch (e) {
  //     throw RFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const RFormatException();
  //   } on PlatformException catch (e) {
  //     throw RPlatformException(e.code).message;
  //   } catch (e) {
  //     if (kDebugMode) print('Something want wrong $e');
  //     return null;
  //   }
  // }

  ///[FacebookAuthentication] - Facebook
/*----------------------------./end Federated identity & social sign-in */

  ///[LogoutUser] - valid for any authentication
  // Future<void> logout() async {
  //   try {
  //     await GoogleSignIn().signOut();
  //     await FirebaseAuth.instance.signOut();
  //     Get.offAll(() => const LoginScreen());
  //   } on FirebaseAuthException catch (e) {
  //     throw RFirebaseAuthException(e.code).message;
  //   } on FirebaseException catch (e) {
  //     throw RFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const RFormatException();
  //   } on PlatformException catch (e) {
  //     throw RPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong . Please try again';
  //   }
  // }

  ///[DeleteUser] -Remove User Auth and Firestore Account.
  // Future<void> deleteAccount() async {
  //   try {
  //     await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
  //     await _auth.currentUser?.delete();
  //   } on FirebaseAuthException catch (e) {
  //     throw RFirebaseAuthException(e.code).message;
  //   } on FirebaseException catch (e) {
  //     throw RFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const RFormatException();
  //   } on PlatformException catch (e) {
  //     throw RPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong . Please try again';
  //   }
  // }

  // ///Function to update user data in firebase
  // Future<void> updateUserDetails(UserModel updateUser) async {
  //   try {
  //     await _db
  //         .collection('Users')
  //         .doc(updateUser.id)
  //         .update(updateUser.toJson());
  //   } on FirebaseAuthException catch (e) {
  //     throw RFirebaseAuthException(e.code).message;
  //   } on FirebaseException catch (e) {
  //     throw RFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const RFormatException();
  //   } on PlatformException catch (e) {
  //     throw RPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong . Please try again';
  //   }
  // }

  ///update any field inspecific User collection
  ///
  // Future<void> updateSingleField(Map<String, dynamic> json) async {
  //   try {
  //     await _db
  //         .collection("users")
  //         .doc(AuthenticationRepository.instance.authUser?.uid)
  //         .update(json);
  //   } on FirebaseAuthException catch (e) {
  //     throw RFirebaseAuthException(e.code).message;
  //   } on FirebaseException catch (e) {
  //     throw RFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const RFormatException();
  //   } on PlatformException catch (e) {
  //     throw RPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong . Please try again';
  //   }
  // }

  ///Function to remove user data from Firebase
  ///
  // Future<void> removeUserRecord(UserModel userId) async {
  //   try {
  //     await _db.collection('Users').doc(userId).delete();
  //   } on FirebaseException catch (e) {
  //     throw RFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const RFormatException();
  //   } on PlatformException catch (e) {
  //     throw RPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong . Please try again';
  //   }
  // }

  ///upload any image
  // Future<String> uploadImage(String path, XFile image) async {
  //   try {
  //     final ref = FirebaseStorage.instance.ref(path).child(image.name);
  //     await ref.putFile(File(image.path));
  //     final url = await ref.getDownloadURL();
  //     return url;
  //   } on FirebaseException catch (e) {
  //     throw RFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const RFormatException();
  //   } on PlatformException catch (e) {
  //     throw RPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong . Please try again';
  //   }
  //}
}
