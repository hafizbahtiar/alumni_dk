import 'dart:convert';
import 'package:alumni_dk/core/routes/name_route.dart';
import 'package:alumni_dk/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:alumni_dk/core/routes/bottom_view.dart';
import 'package:alumni_dk/core/routes/drawer_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  late List<Widget> _pages;
  late PageController _pageController;
  final _supabase = Supabase.instance.client;
  UserModel? _userData;
  bool _isLoading = true;
  bool _isError = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);

    // Initialize pages with null data first to avoid late initialization error
    _initializePages();

    // Then fetch user data
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    setState(() {
      _isLoading = true;
      _isError = false;
    });

    try {
      // Check if user is authenticated
      final currentUser = _supabase.auth.currentUser;
      if (currentUser == null) {
        // Not logged in, redirect to login page
        if (mounted) {
          Navigator.of(context).pushReplacementNamed(NameRoute.login);
        }
        return;
      }

      // Try to get data from SharedPreferences first for faster load
      final prefs = await SharedPreferences.getInstance();
      final String? cachedUserDataString = prefs.getString('user_profile_data');

      if (cachedUserDataString != null && cachedUserDataString.isNotEmpty) {
        try {
          final userData = jsonDecode(cachedUserDataString);
          setState(() {
            _userData = UserModel.fromJson(userData);
          });
          _initializePages(); // Initialize pages with cached data first
        } catch (e) {
          debugPrint('Error parsing cached user data: $e');
          // Continue to fetch from database if cache parsing fails
        }
      }

      // Fetch latest data from Supabase
      final response = _supabase.auth.currentUser!.userMetadata;

      // Update user data in state
      if (mounted) {
        setState(() {
          _userData = UserModel.fromJson(response!);
          _isLoading = false;
        });
      }

      // Cache the data for future use
      await prefs.setString('user_profile_data', jsonEncode(response));

      // Initialize or reinitialize pages with fresh user data
      _initializePages();
    } catch (e) {
      debugPrint('Error fetching user data: $e');
      if (mounted) {
        setState(() {
          _isLoading = false;
          _isError = true;
          _errorMessage = 'Could not load profile. Please check your connection.';
        });
      }

      // We already initialized pages with null data above

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_errorMessage),
            backgroundColor: Colors.red,
            action: SnackBarAction(label: 'Retry', textColor: Colors.white, onPressed: _fetchUserData),
          ),
        );
      }
    }
  }

  void _initializePages() {
    _pages = [
      HomePage(scaffoldKey: scaffoldKey, userData: _userData),
      EventsPage(userModel: _userData),
      NetworkPage(userModel: _userData),
      MessagesPage(userModel: _userData),
    ];

    // Force rebuild if needed
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Animate to the selected page when a tab is tapped
      _pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading && _userData == null) {
      return const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator(), SizedBox(height: 16), Text('Loading your profile...')],
          ),
        ),
      );
    }

    if (_isError && _userData == null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text(_errorMessage),
              const SizedBox(height: 24),
              ElevatedButton(onPressed: _fetchUserData, child: const Text('Retry')),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, NameRoute.login);
                },
                child: const Text('Back to Login'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: const BouncingScrollPhysics(),
        children: _pages,
      ),
      drawer: const DrawerView(),
      drawerEnableOpenDragGesture: false,
      bottomNavigationBar: BottomView(currentIndex: _selectedIndex, onTap: _onItemTapped),
    );
  }
}

// Example placeholder pages with user data
class EventsPage extends StatelessWidget {
  final UserModel? userModel;

  const EventsPage({super.key, this.userModel});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Events', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 16),
          if (userModel != null) Text('Personalized events for ${userModel!.name ?? 'you'}'),
        ],
      ),
    );
  }
}

class NetworkPage extends StatelessWidget {
  final UserModel? userModel;

  const NetworkPage({super.key, this.userModel});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Network', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 16),
          if (userModel != null && userModel!.department != null)
            Text('Connect with other alumni from ${userModel!.department}'),
        ],
      ),
    );
  }
}

class MessagesPage extends StatelessWidget {
  final UserModel? userModel;

  const MessagesPage({super.key, this.userModel});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Messages', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 16),
          if (userModel != null) Text('Your inbox for ${userModel!.email ?? 'your account'}'),
        ],
      ),
    );
  }
}
