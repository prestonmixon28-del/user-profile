import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
      ),
      body: const Center(
        child: UserBanner(),
      ),
    );
  }
}


class UserBanner extends StatefulWidget {
  const UserBanner({super.key});

  @override
  State<UserBanner> createState() => _UserBannerState();
}

class _UserBannerState extends State<UserBanner> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'welcome guest',
          style: TextStyle(fontSize: 20),
          ),
          IconButton(
            onPressed:() {
              setState(() {
                isFavorited = !isFavorited;
              });
            },
            icon: Icon(
              isFavorited ? Icons.star : Icons.star_border,
              color: isFavorited? Colors.yellow : Colors.grey,
            ))
      ]
    );
  }
  }