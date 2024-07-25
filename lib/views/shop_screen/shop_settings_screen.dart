import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/views/widgets/custom_textfield.dart';

class ShopSettings extends StatelessWidget {
  const ShopSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: boldText(text: shopSettings, size: 16.0),
        actions: [
          TextButton(
            onPressed: () {},
            child: normalText(text: save),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            customTextField(label: shopname, hint: nameHint),
            10.heightBox,
            customTextField(label: address, hint: shopAddressHint),
            10.heightBox,
            customTextField(label: mobile, hint: shopMobileHint),
            10.heightBox,
            customTextField(label: website, hint: shopWebsiteHint),
            10.heightBox,
            customTextField(
                label: description, hint: shopDescHint, isDesc: true),
          ],
        ),
      ),
    );
  }
}
