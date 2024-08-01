import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/controllers/profile_controller.dart';
import 'package:emart_seller/views/widgets/custom_textfield.dart';

class ShopSettings extends StatelessWidget {
  const ShopSettings({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    return Obx(
      () => Scaffold(
        backgroundColor: purpleColor,
        appBar: AppBar(
          title: boldText(text: shopSettings, size: 16.0),
          actions: [
            controller.isLoading.value
                ? loadingIndicator(circleColor: white)
                : TextButton(
                    onPressed: () async {
                      controller.isLoading(true);
                      await controller.updateShop(
                        shopAddress: controller.shopAddressController,
                        shopname: controller.shopNameController,
                        shopmobile: controller.shopMobileController,
                        shopwebsite: controller.shopWebsiteController,
                        shopdesc: controller.shopWebsiteController,
                      );
                      VxToast.show(context, msg: "Shop updated");
                    },
                    child: normalText(text: save),
                  ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              customTextField(
                  label: shopname,
                  hint: nameHint,
                  controller: controller.nameController),
              10.heightBox,
              customTextField(
                  label: address,
                  hint: shopAddressHint,
                  controller: controller.shopAddressController),
              10.heightBox,
              customTextField(
                  label: mobile,
                  hint: shopMobileHint,
                  controller: controller.shopMobileController),
              10.heightBox,
              customTextField(
                  label: website,
                  hint: shopWebsiteHint,
                  controller: controller.shopWebsiteController),
              10.heightBox,
              customTextField(
                  label: description,
                  hint: shopDescHint,
                  isDesc: true,
                  controller: controller.shopDescController),
            ],
          ),
        ),
      ),
    );
  }
}
