import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/views/messages_screen/messages_screen.dart';
import 'package:emart_seller/views/profile_screen/edit_profilescreen.dart';

import '../shop_screen/shop_settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: settings, size: 16.0),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => EditProfilescreen());
            },
            icon: Icon(
              Icons.edit,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: normalText(text: logout),
          ),
        ],
      ),
      body: Column(
        children: [
          ListTile(
            leading: Image.asset(imgProduct)
                .box
                .roundedFull
                .clip(Clip.antiAlias)
                .make(),
            title: boldText(text: "Vendor name"),
            subtitle: normalText(text: "vendoremail@emart.com"),
          ),
          const Divider(),
          10.heightBox,
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: List.generate(
                profileButtonIcons.length,
                (index) {
                  return ListTile(
                    onTap: () {
                      switch (index) {
                        case 0:
                          Get.to(() {
                            return ShopSettings();
                          });
                          break;
                        case 1:
                          Get.to(() {
                            return MessagesScreen();
                          });
                          break;
                        default:
                      }
                    },
                    leading: Icon(
                      profileButtonIcons[index],
                      color: white,
                    ),
                    title: normalText(text: profileButtonTitles[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
