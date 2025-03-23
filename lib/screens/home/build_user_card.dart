import 'dart:io'; 
import 'package:contact/utiles/app_colors.dart';
import 'package:contact/utiles/app_style.dart';
import 'package:flutter/material.dart';

class BuildUserCard extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String userPhone;
  final String userImage;
  final VoidCallback onDelete; 

  const BuildUserCard({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.userPhone,
    required this.userImage,
    required this.onDelete, 
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        width: width * 0.44,
        height: height * 0.32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.gold,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                (userImage.isEmpty|| userImage.startsWith('assets/'))?
               Image.asset(userImage.isEmpty?"assets/images/person.png":userImage,
                        width: double.infinity,
                        height: height * 0.20,
                        fit: BoxFit.cover)
                    : Image.file(File(userImage),
                        width: double.infinity,
                        height: height * 0.20,
                        fit: BoxFit.cover),
                Positioned(
                  left: 8,
                  bottom: 5,
                  child: Container(
                    alignment: Alignment.center,
                    width: width * 0.30,
                    height: height * 0.04,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.gold,
                    ),
                    child: Text(
                      userName,
                      style: AppStyle.bold16Gold
                          .copyWith(color: AppColors.darkBlue),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: height * 0.0097),
            Row(
              children: [
                const Icon(Icons.email, color: AppColors.darkBlue),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      userEmail,
                      style: AppStyle.bold16Gold
                          .copyWith(color: AppColors.darkBlue),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.0097),
            Row(
              children: [
                const Icon(Icons.phone_iphone_outlined,
                    color: AppColors.darkBlue),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      userPhone,
                      style: AppStyle.bold16Gold
                          .copyWith(color: AppColors.darkBlue),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(4),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onDelete, 
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: AppColors.red,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const ImageIcon(
                        AssetImage("assets/images/delete_icon.png"),
                        color: Colors.white,
                        size: 24,
                      ),
                      SizedBox(width: width * 0.02),
                      Text(
                        "Delete",
                        style: AppStyle.bold16Gold
                            .copyWith(color: AppColors.white),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
