import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/controllers/auth_controller.dart';
import 'package:emart_seller/controllers/profile_controller.dart';
import 'package:emart_seller/views/messages_screen/messages_screen.dart';
import 'package:emart_seller/views/profile_screen/edit_profilescreen.dart';

import '../shop_screen/shop_settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    debugPrint(" ***** Current User ID:  ${currentUser!.uid} ***** ");
    return Scaffold(
        backgroundColor: purpleColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: boldText(text: settings, size: 16.0),
          actions: [
            IconButton(
              onPressed: () {
                Get.to(
                  () => EditProfilescreen(
                    username: controller.snapshotData['vendor_name'],
                  ),
                );
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
            TextButton(
              onPressed: () async {
                await Get.find<AuthController>().signoutMethod(context);
              },
              child: normalText(text: logout),
            ),
          ],
        ),
        body: FutureBuilder(
            future: StoreServices.getProfile(currentUser!.uid),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return loadingIndicator(circleColor: white);
              } else if (snapshot.data!.docs.isEmpty) {
                return Center(
                  child: normalText(text: "No profile data found."),
                );
              } else {
                controller.snapshotData = snapshot.data!.docs[0];
                return Column(
                  children: [
                    ListTile(
                      leading: controller.snapshotData['imageUrl'] == ''
                          ? Image.asset(
                              imgProduct,
                              width: 100,
                            ).box.roundedFull.clip(Clip.antiAlias).make()
                          : Image.network(
                              controller.snapshotData['imageUrl'],
                              width: 60,
                            ),
                      // leading: Image.asset(imgProduct)
                      //     .box
                      //     .roundedFull
                      //     .clip(Clip.antiAlias)
                      //     .make(),
                      title: boldText(
                          text: "${controller.snapshotData['vendor_name']}"),
                      subtitle: normalText(
                          text: "${controller.snapshotData['email']}"),
                    ),
                    const Divider(),
                    10.heightBox,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: List.generate(
                          profileButtonIcons.length,
                          (index) {
                            return ListTile(
                              onTap: () {
                                switch (index) {
                                  case 0:
                                    Get.to(() {
                                      return const ShopSettings();
                                    });
                                    break;
                                  case 1:
                                    Get.to(() {
                                      return const MessagesScreen();
                                    });
                                    break;
                                  default:
                                }
                              },
                              leading: Icon(
                                profileButtonIcons[index],
                                color: white,
                              ),
                              title:
                                  normalText(text: profileButtonTitles[index]),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              }
            }));
  }
}
