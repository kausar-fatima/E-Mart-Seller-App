import 'package:emart_seller/const/const.dart';

class AuthController extends GetxController {
  var isloading = false.obs;
  // text controllers
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Future<UserCredential?> loginMethod({context}) async {
    UserCredential? userCredential;
    try {
      await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      debugPrint(
          " ****** Email: ${emailController.text} ****** Password: ${passwordController.text} ******* ");
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  // storing data method
  storeUserData({name, password, email}) async {
    DocumentReference store =
        await firestore.collection(vendorsCollection).doc(currentUser!.uid);
    store.set({
      'name': name,
      'password': password,
      'email': email,
      'imageUrl': '',
      'id': currentUser!.uid,
      'wishlist_count': '00',
      'cart_count': '00',
      'order_count': '00',
    });
  }

  // signout method
  signoutMethod(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(
        context,
        msg: e.toString(),
      );
    }
  }
}
