import 'dart:io';
import 'package:contact/screens/home/build_user_card.dart';
import 'package:contact/screens/home/user_data.dart';
import 'package:contact/screens/build_text_field.dart';
import 'package:contact/utiles/app_colors.dart';
import 'package:contact/utiles/app_style.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DataInputScreen extends StatefulWidget {
  static const String routName = "DataInputScreen";
  const DataInputScreen({super.key});

  @override
  State<DataInputScreen> createState() => _DataInputScreenState();
}

class _DataInputScreenState extends State<DataInputScreen> {
  final TextEditingController userName = TextEditingController();
  final TextEditingController userEmail = TextEditingController();
  final TextEditingController userPhone = TextEditingController();
  File? _image;

  List<UserData> usersList = [];

  List<BuildUserCard> userCardList = [];

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(width * 0.039),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: pickImage,
                    child: Container(
                      width: width * 0.35,
                      height: height * 0.167,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.gold)),
                      child: _image == null
                          ? Image.asset("assets/images/imageadd_icon.png")
                          : Image.file(
                              _image!,
                              fit: BoxFit.fill,
                              width: double.infinity,
                            ),
                    ),
                  ),
                  SizedBox(width: width * 0.029),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(width * 0.029),
                          child: Text(
                            userName.text,
                            style: AppStyle.bold16Gold,
                          ),
                        ),
                        Divider(color: AppColors.gold),
                        Container(
                          padding: EdgeInsets.all(width * 0.029),
                          child: Text(
                            userEmail.text,
                            style: AppStyle.bold16Gold,
                          ),
                        ),
                        Divider(color: AppColors.gold),
                        Container(
                          padding: EdgeInsets.all(width * 0.029),
                          child: Text(
                            userPhone.text,
                            style: AppStyle.bold16Gold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              BuildTextField(hint: "Enter User Name", controller: userName),
              SizedBox(height: height * 0.0097),
              BuildTextField(hint: "Enter User Email", controller: userEmail),
              SizedBox(height: height * 0.0097),
              BuildTextField(hint: "Enter User Phone", controller: userPhone),
              SizedBox(height: height * 0.0097),
              SizedBox(
                width: double.infinity,
                height: height * 0.068,
                child: ElevatedButton(
                    onPressed: addUser,
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        backgroundColor: AppColors.gold),
                    child: Text(
                      "Enter User",
                      style: AppStyle.bold20Gold
                          .copyWith(color: AppColors.darkBlue),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  void addUser() {
    if (userName.text.isNotEmpty &&
        userEmail.text.isNotEmpty &&
        userPhone.text.isNotEmpty) {
      UserData newUser = UserData(
        userName: userName.text,
        userEmail: userEmail.text,
        userPhone: userPhone.text,
        userImage: _image?.path ?? "",
      );

      userName.clear();
      userEmail.clear();
      userPhone.clear();
      _image = null;

      Navigator.pop(context, newUser);
    }
  }

  void pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }
}
