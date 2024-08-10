import 'package:emart_seller/const/const.dart';

class HomeController extends GetxController {
  var navIndex = 0.obs;
  var username = '';

  @override
  void onInit() {
    super.onInit();
    getUsername();
  }

  getUsername() async {
    var n = await firestore
        .collection(vendorsCollection)
        .where('id', isEqualTo: currentUser!.uid)
        .get()
        .then(
      (value) {
        if (value.docs.isNotEmpty) {
          return value.docs.single['vendor_name'];
        }
      },
    );

    username = n;
  }
}
