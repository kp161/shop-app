import 'package:flutter/material.dart';
import 'package:shop_app/core/constant/app_color.dart';

class TopBar extends StatelessWidget {
  // final TextEditingController searchController;

  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            child: SizedBox(
              width: double.infinity,
              child: TextField(
                // controller: searchController,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                    hintText: "Search here...",
                    hintStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.search, color: Colors.black45),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 14),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                            width: 1.2, color: AppColor.secondaryColor)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                            width: 1.5, color: AppColor.primaryColor))),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(
              'assets/images/logo.png',
              width: 38,
              height: 38,
              fit: BoxFit.contain,
            ),
          ),
        )
      ],
    );
  }
}
