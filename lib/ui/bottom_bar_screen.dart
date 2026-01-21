import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/constant/app_color.dart';
import 'package:shop_app/core/routes/app_router.dart';

@RoutePage()
class BottomBarScreen extends StatelessWidget {
  const BottomBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        GetAllProductRoute(),
        AddProductRoute(),
        UserProfileRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: Container(
            height: 75,
            decoration: const BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildItems(
                    icon: Icons.shopping_cart_outlined,
                    text: 'Get All',
                    index: 0,
                    tabsRouter: tabsRouter),
                _buildItems(
                    icon: Icons.add,
                    text: 'Add Product',
                    index: 1,
                    tabsRouter: tabsRouter),
                _buildItems(
                    icon: Icons.person_outline,
                    text: 'Profile',
                    index: 2,
                    tabsRouter: tabsRouter),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildItems(
      {required IconData icon,
      required String text,
      required int index,
      required TabsRouter tabsRouter}) {
    final bool isSelected = tabsRouter.activeIndex == index;
    return GestureDetector(
      onTap: () => tabsRouter.setActiveIndex(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          isSelected
              ? Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white30,
                  ),
                  child: Icon(icon, color: Colors.white),
                )
              : Icon(icon, color: Colors.white),
          Text(
            formatBottomBarText(text),
            style: const TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

String formatBottomBarText(String text) {
  if (text.length > 7) {
    return '${text.substring(0, 7)}...';
  }
  return text;
}
