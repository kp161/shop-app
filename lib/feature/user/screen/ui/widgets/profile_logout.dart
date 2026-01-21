import 'package:flutter/material.dart';

class ProfileLogout extends StatelessWidget {
  final VoidCallback onTap;

  const ProfileLogout({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
            child: Row(
              children: [
                Icon(Icons.logout, size: 22, color: Colors.redAccent[400]),
                const SizedBox(width: 10),
                Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.redAccent[400],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
