import 'package:alumni_dk/shared/providers/appearance_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final watch = Provider.of<AppearanceProvider>(context, listen: true);
    final provider = Provider.of<AppearanceProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(icon: Icon(Icons.adaptive.arrow_back), onPressed: () => Navigator.pop(context)),
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHigh,
      ),
      body: Container(
        color: Theme.of(context).colorScheme.surface,
        child: ListView(
          children: [
            const SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 8),
              child: Text('ACCOUNT', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text('Profile'),
                    trailing: Icon(Icons.adaptive.arrow_forward, size: 15),
                    onTap: () {},
                  ),
                  Divider(height: 1, indent: 16, color: Theme.of(context).colorScheme.outline),
                  ListTile(
                    title: Text('Notifications'),
                    trailing: Icon(Icons.adaptive.arrow_forward, size: 15),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 8),
              child: Text('APPEARANCE', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: const Text('Dark Mode'),
                trailing: Switch.adaptive(value: watch.isDarkMode, onChanged: (value) => provider.setDarkMode(value)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
