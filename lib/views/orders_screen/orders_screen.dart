import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/views/orders_screen/order_details.dart';
import 'package:intl/intl.dart' as intl;

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(title: orders),
      bottomNavigationBar: SizedBox(
        height: 60,
        width: context.screenWidth,
        child: ourButton(color: green, onPress: () {}, title: "Confirm Order"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
              20,
              (index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: ListTile(
                    onTap: () {
                      Get.to(() => const OrderDetails());
                    },
                    tileColor: textfieldGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    leading: Image.asset(
                      imgProduct,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                    title: boldText(text: "5476467", color: purpleColor),
                    subtitle: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: fontGrey,
                            ),
                            10.widthBox,
                            boldText(
                                text: intl.DateFormat()
                                    .add_yMd()
                                    .format(DateTime.now()),
                                color: darkGrey),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.payment,
                              color: fontGrey,
                            ),
                            10.widthBox,
                            boldText(text: unpaid, color: red),
                          ],
                        )
                      ],
                    ),
                    trailing: boldText(
                        text: "\$40.0", color: purpleColor, size: 16.0),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
