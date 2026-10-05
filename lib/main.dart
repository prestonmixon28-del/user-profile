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

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {
  String _currentUsername = 'guest';

  void updateUsername(String newname) {
    setState(() {
      _currentUsername = newname;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
      ),
      body: const Padding(padding: EdgeInsets.all(16.0),
      child: ProfileForm(),
      ),
    );
  }
}


class UserBanner extends StatelessWidget {
  final String username;

  const UserBanner({super.key, required this.username});

  
}

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isFavorited = !isFavorited;
        });
      },
      icon: Icon(
        isFavorited ? Icons.star : Icons.star_border,
        color: isFavorited ? Colors.yellow : Colors.grey,
      ),
    );
  }
}

  class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final nameController = TextEditingController();
  final bioController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
      children: [
        TextFormField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: 'Name',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a name';
            }
            return null;
          },
        ),
        TextFormField(
          controller: bioController,
          decoration: const InputDecoration(
            labelText: 'Bio',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a bio';
            }
            return null;
          },

        ),

        ElevatedButton(
          onPressed:() {
            if (formKey.currentState!.validate()) {
              print('profile saved');
            }
          },

        child: const Text('Save Profile'),
        ),
      ],
      ),
    );
  }
}
