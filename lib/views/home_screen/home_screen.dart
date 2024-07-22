import 'package:emart_seller/const/const.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(title: products),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashboardButton(
                    context: context,
                    title: products,
                    count: "60",
                    icon: icProducts),
                dashboardButton(
                    context: context, title: orders, count: "15", icon: orders),
              ],
            ),
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashboardButton(
                    context: context, title: rating, count: "60", icon: icStar),
                dashboardButton(
                    context: context,
                    title: orders,
                    count: "15",
                    icon: icOrders),
              ],
            ),
            10.heightBox,
            Divider(),
            10.heightBox,
            boldText(text: popular, color: darkGrey, size: 16.0),
            20.heightBox,
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(
                3,
                (index) => ListTile(
                  onTap: () {},
                  leading: Image.asset(
                    imgProduct,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  title: boldText(text: "Product title", color: fontGrey),
                  subtitle: normalText(text: "\$100", color: darkGrey),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
