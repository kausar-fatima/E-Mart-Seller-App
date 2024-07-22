import 'package:emart_seller/const/const.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: purpleColor,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      appBar: appBarWidget(title: products),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
              20,
              (index) {
                return ListTile(
                  onTap: () {},
                  leading: Image.asset(
                    imgProduct,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  title: boldText(text: "Product title", color: fontGrey),
                  subtitle: normalText(text: "\$100", color: darkGrey),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
