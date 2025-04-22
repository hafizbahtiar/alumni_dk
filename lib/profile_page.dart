import 'package:alumni_dk/core/constant/app_image.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(icon: Icon(Icons.adaptive.arrow_back), onPressed: () => Navigator.pop(context)),
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHigh,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    image: const DecorationImage(image: AssetImage(AppImage.cover), fit: BoxFit.cover),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: _buildProfilePicture(),
                            ),
                            const SizedBox(width: 10.0),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nurhafiz',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                Text('AA 0000001'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfilePicture() {
    const double sizeProfile = 40;
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(radius: sizeProfile + 3, backgroundColor: Theme.of(context).colorScheme.surface),
        CircleAvatar(
          radius: 40,
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundImage: const AssetImage(AppImage.cover) as ImageProvider,
          backgroundImage: const AssetImage(AppImage.cover) as ImageProvider,
          onBackgroundImageError: (_, __) => const AssetImage(AppImage.cover),
          onForegroundImageError: (_, __) => const AssetImage(AppImage.cover),
        ),
      ],
    );
  }
}
