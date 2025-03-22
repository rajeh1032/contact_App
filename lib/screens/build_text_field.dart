import 'package:contact/utiles/app_colors.dart';
import 'package:contact/utiles/app_style.dart';
import 'package:flutter/material.dart';

class BuildTextField extends StatelessWidget {
  BuildTextField({super.key, required this.hint, required this.controller});
  String hint;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        cursorColor: AppColors.gold,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppStyle.bold16Gold,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.gold),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.gold),
          ),
        ),
        style: AppStyle.bold16Gold,
      ),
    );
  }
}
