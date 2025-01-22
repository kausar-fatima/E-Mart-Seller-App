import 'package:emart_seller/const/const.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, this.data});
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: darkGrey,
          ),
        ),
        title: boldText(text: "${data['p_name']}", color: fontGrey, size: 16.0),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            VxSwiper.builder(
              autoPlay: true,
              height: 350,
              itemCount: data['p_imgs'].length,
              aspectRatio: 16 / 9,
              viewportFraction: 1.0,
              itemBuilder: (context, index) {
                return Image.network(
                  data['p_imgs'][index],
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              },
            ),
            10.heightBox,
            //title and details section
            // title!.text
            //     .size(16)
            //     .color(darkFontGrey)
            //     .fontFamily(semibold)
            //     .make(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  boldText(
                      text: "${data['p_name']}", color: fontGrey, size: 16.0),

                  10.heightBox,
                  Row(
                    children: [
                      boldText(
                          text: "${data['p_category']}",
                          color: fontGrey,
                          size: 16.0),
                      10.widthBox,
                      normalText(
                          text: "${data['p_subcategory']}",
                          color: fontGrey,
                          size: 16.0),
                    ],
                  ),
                  10.heightBox,
                  // rating
                  VxRating(
                    isSelectable: false,
                    //value: double.parse(data['p_rating']),
                    value: double.parse(data['p_rating']),
                    onRatingUpdate: (value) {},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    count: 5,
                    size: 25,
                    maxRating: 5,
                  ),
                  10.heightBox,

                  // "${data['p_price']}"
                  //     .numCurrency
                  //     .text
                  //     .color(redColor)
                  //     .size(18)
                  //     .fontFamily(bold)
                  //     .make(),
                  boldText(
                      text: "\$${data['p_price']}", color: red, size: 18.0),
                  20.heightBox,
                  // color section
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: boldText(text: "Color", color: fontGrey),
                            // child: "Color: ".text.color(textfieldGrey).make(),
                          ),
                          Row(
                            children: List.generate(
                              data['p_colors'].length,
                              (index) => VxBox()
                                  .size(40, 40)
                                  .roundedFull
                                  .color(
                                    Color(
                                      data['p_colors'][index] is int
                                          ? data['p_colors'][index]
                                          : int.parse(data['p_colors'][index]),
                                    ),
                                  )
                                  .margin(
                                    const EdgeInsets.symmetric(horizontal: 4),
                                  )
                                  .make()
                                  .onTap(() {
                                // controller.changeColorIndex(index);
                              }),
                            ),
                          ),
                        ],
                      ),
                      10.heightBox,
                      //quantity section
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            // child: "Quantity".text.color(textfieldGrey).make(),
                            child: boldText(text: "Color", color: fontGrey),
                          ),
                          normalText(
                              text: "${data['p_quantity']} items",
                              color: fontGrey)
                        ],
                      ),
                    ],
                  ).box.padding(const EdgeInsets.all(8)).white.make(),
                  const Divider(),
                  10.heightBox,
                  //description section
                  // "Description"
                  //     .text
                  //     .color(darkFontGrey)
                  //     .fontFamily(semibold)
                  //     .make(),
                  boldText(text: "Description", color: fontGrey),
                  10.heightBox,
                  normalText(text: "${data['p_description']}", color: fontGrey)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
