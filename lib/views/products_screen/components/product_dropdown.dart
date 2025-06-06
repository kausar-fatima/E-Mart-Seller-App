import 'package:emart_seller/const/const.dart';

Widget productDropdown(
    hint, List<String> list, dropvalue, ProductsController controller) {
  return Obx(
    () => DropdownButtonHideUnderline(
      child: DropdownButton(
        hint: normalText(text: "$hint", color: fontGrey),
        items: list.map((e) {
          return DropdownMenuItem(
            value: e,
            child: e.toString().text.make(),
          );
        }).toList(),
        onChanged: (newvalue) {
          if (hint == "Category") {
            controller.subcategoryValue.value = '';
            controller.populateSubcategory(newvalue.toString());
          }
          dropvalue.value = newvalue.toString();
        },
        value: dropvalue.value == '' ? null : dropvalue.value,
        isExpanded: true,
      ),
    )
        .box
        .white
        .padding(
          const EdgeInsets.symmetric(horizontal: 4),
        )
        .roundedSM
        .make(),
  );
}
