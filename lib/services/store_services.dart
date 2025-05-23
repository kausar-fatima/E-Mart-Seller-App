import 'package:emart_seller/const/const.dart';

class StoreServices {
  static getProfile(uid) {
    debugPrint(" ***** $uid ***** ");
    return firestore
        .collection(vendorsCollection)
        .where('id', isEqualTo: uid)
        .get();
  }

  static getMessages(uid) {
    return firestore
        .collection(chatsCollection)
        .where('toId', isEqualTo: uid)
        .snapshots();
  }

  static getOrders(uid) {
    return firestore
        .collection(ordersCollection)
        .where('vendors', arrayContains: uid)
        .snapshots();
  }

  static getProducts(uid) {
    return firestore
        .collection(productCollection)
        .where('vendor_id', isEqualTo: uid)
        .snapshots();
  }

  static getPopularProducts(uid) {
    return firestore
        .collection(productCollection)
        .where("vendor_id", isEqualTo: uid)
        .orderBy('p_wishlist'.length);
  }
}
