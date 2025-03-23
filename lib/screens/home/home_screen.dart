import 'package:contact/screens/home/build_user_card.dart';
import 'package:contact/screens/home/data_input_screen.dart';
import 'package:contact/screens/home/user_data.dart';
import 'package:contact/utiles/app_colors.dart';
import 'package:contact/utiles/app_style.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<BuildUserCard> userCardList = [];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/logo.png",
          width: width * 0.29,
          height: height * 0.044,
        ),
        backgroundColor: AppColors.darkBlue,
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: userCardList.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/empty_icon.png",
                            width: width * 0.5,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "There are no contacts added yet",
                            style: AppStyle.bold20Gold,
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    )
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.65,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: userCardList.length,
                      itemBuilder: (context, index) {
                        return userCardList[index];
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openDataInputScreen,
        backgroundColor: AppColors.gold,
        child: const Icon(Icons.add, color: AppColors.darkBlue),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
  

  void openDataInputScreen() async {
    final result = await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: AppColors.darkBlue,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      context: context,
      builder: (context) {
        return const DataInputScreen();
      },
    );

    if (result != null && result is UserData) {
      setState(() {
        userCardList.add(
          BuildUserCard(
            userName: result.userName,
            userEmail: result.userEmail,
            userPhone: result.userPhone,
            userImage: result.userImage,
            onDelete: () {
              setState(() {
                userCardList
                    .removeWhere((card) => card.userEmail == result.userEmail);
              });
            },
          ),
        );
      });
    }
  }
}
