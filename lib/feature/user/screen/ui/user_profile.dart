import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/constant/app_color.dart';
import 'package:shop_app/core/di/injection.dart';
import 'package:shop_app/core/routes/app_router.dart';
import 'package:shop_app/core/utils/show_snackbar.dart';
import 'package:shop_app/feature/user/model/user_model.dart';
import 'package:shop_app/feature/user/screen/provider/user_provider.dart';
import 'package:shop_app/feature/user/screen/ui/widgets/profile_logout.dart';
import 'package:shop_app/feature/user/screen/ui/widgets/profile_name.dart';
import 'package:shop_app/feature/user/screen/ui/widgets/profile_row.dart';

@RoutePage()
class UserProfileScreen extends StatefulWidget implements AutoRouteWrapper {
  const UserProfileScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(sl()),
      child: this,
    );
  }

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  bool _calledApi = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_calledApi) {
      _calledApi = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<UserProvider>().getUserProfile();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
        child: Selector<UserProvider,
            ({UserModel? user, bool isLoading, bool isLoggedOut})>(
          selector: (_, provider) => (
            user: provider.user,
            isLoading: provider.isLoading,
            isLoggedOut: provider.isLoggedOut,
          ),
          builder: (context, data, _) {
            if (data.isLoggedOut) {
              WidgetsBinding.instance.addPostFrameCallback((_) async {
                showFlushbar(
                    context: context,
                    message: 'Logout successfull',
                    isError: false);
                await Future.delayed(const Duration(milliseconds: 1500));

                context.router.replaceAll([LoginRoute()]);
              });
              return const SizedBox.shrink();
            }

            if (data.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            final user = data.user;

            if (user == null) {
              return const Center(
                child: Text(
                  'User data not found',
                  style: TextStyle(fontSize: 16),
                ),
              );
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: AppColor.primaryColor, width: 2),
                    ),
                    child: const Icon(Icons.person_outline,
                        size: 80, color: AppColor.primaryColor),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    user.username ?? '-',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 25),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          ProfileName(
                              icon: Icons.person,
                              label1: 'Firstname',
                              label2: 'Lastname',
                              value1: user.name?.firstname ?? '-',
                              value2: user.name?.lastname ?? '-'),
                          const Divider(),
                          ProfileRow(
                              icon: Icons.email,
                              label: 'Email',
                              value: user.email ?? '-'),
                          const Divider(),
                          ProfileRow(
                              icon: Icons.phone,
                              label: 'Phone',
                              value: user.phone ?? '-'),
                          const Divider(),
                          ProfileRow(
                              icon: Icons.location_city,
                              label: 'City',
                              value: user.address?.city ?? '-'),
                          const Divider(),
                          ProfileRow(
                              icon: Icons.home,
                              label: 'Address',
                              value: user.address?.street ?? '-'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                  ProfileLogout(onTap: () {
                    context.read<UserProvider>().logout();
                  })
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
