import 'package:emart_seller/const/const.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: boldText(text: messages, size: 16.0, color: fontGrey),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: List.generate(20, (index) {
              return ListTile(
                onTap: () {},
                leading: CircleAvatar(
                  backgroundColor: purpleColor,
                  child: Icon(
                    Icons.person,
                    color: white,
                  ),
                ),
                title: boldText(text: "Username", color: fontGrey),
                subtitle: normalText(text: "last message...", color: darkGrey),
                trailing: normalText(text: "10:45PM", color: darkGrey),
              );
            }),
          ),
        ),
      ),
    );
  }
}
