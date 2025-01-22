import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/controllers/profile_controller.dart';

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
                      debugPrint(
                          " %%%% ${controller.shopAddressController.text} %%%%% ${controller.shopNameController.text} %%%%% ${controller.shopMobileController.text} %%%%% ${controller.shopWebsiteController.text} %%%%% ${controller.shopDescController.text} %%%%% ");
                      await controller.updateShop(
                        shopAddress: controller.shopAddressController.text,
                        shopname: controller.shopNameController.text,
                        shopmobile: controller.shopMobileController.text,
                        shopwebsite: controller.shopWebsiteController.text,
                        shopdesc: controller.shopDescController.text,
                      );
                      VxToast.show(context, msg: "Shop updated");
                    },
                    child: normalText(text: save),
                  ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              customTextField(
                  label: shopname,
                  hint: nameHint,
                  controller: controller.shopNameController),
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
