import 'package:emart_seller/const/const.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(title: products),
      body: StreamBuilder(
        stream: StoreServices.getProducts(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return loadingIndicator();
          } else {
            var data = snapshot.data!.docs;
            data = data.sortedBy(
              (a, b) =>
                  b['p_wishlist'].length.compareTo(a['p_wishlist'].length),
            );
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      dashboardButton(
                          context: context,
                          title: products,
                          count: "${data.length}",
                          icon: icProducts),
                      dashboardButton(
                          context: context,
                          title: orders,
                          count: "15",
                          icon: icOrders),
                    ],
                  ),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      dashboardButton(
                          context: context,
                          title: rating,
                          count: "60",
                          icon: icStar),
                      dashboardButton(
                          context: context,
                          title: orders,
                          count: "15",
                          icon: icOrders),
                    ],
                  ),
                  10.heightBox,
                  const Divider(),
                  10.heightBox,
                  boldText(text: popular, color: darkGrey, size: 16.0),
                  20.heightBox,
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(
                      data.length,
                      (index) => data[index]['p_wishlist'].length == 0
                          ? const SizedBox()
                          : ListTile(
                              onTap: () {
                                Get.to(
                                  () => ProductDetails(
                                    data: data[index],
                                  ),
                                );
                              },
                              leading: Image.network(
                                data[index]['p_imgs'][0],
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                              title: boldText(
                                  text: "${data[index]['p_name']}",
                                  color: fontGrey),
                              subtitle: normalText(
                                  text: "\$${data[index]['p_price']}",
                                  color: darkGrey),
                            ),
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
