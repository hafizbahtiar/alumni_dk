import 'package:alumni_dk/constant/app_image.dart';
import 'package:alumni_dk/routes/name_route.dart';
import 'package:flutter/material.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Drawer(
      width: MediaQuery.sizeOf(context).width * 0.75,
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          _buildDrawerHeader(statusBarHeight),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildDrawerItem(context, 'Profile', Icons.person, () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, NameRoute.profile);
                  }),
                  _buildDrawerItem(context, 'Settings', Icons.settings, () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, NameRoute.settings);
                  }),
                ],
              ),
            ),
          ),
          _buildDrawerFooter(context),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader(double statusBarHeight) {
    return SizedBox(
      height: 200 + statusBarHeight,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Image(image: AssetImage(AppImage.cover), fit: BoxFit.cover),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: Text(
              'Alumni Darul Kifayah',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [Shadow(blurRadius: 2.0, color: Colors.black, offset: const Offset(1, 1))],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.onSurface),
      title: Text(title, style: TextStyle(color: Theme.of(context).colorScheme.onSurface)),
      onTap: onTap,
    );
  }

  Widget _buildDrawerFooter(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Text('© 2025 Alumni DK', style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.onSurface)),
    );
  }
}
