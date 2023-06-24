import 'package:flutter/material.dart';
import 'User.dart';
import 'SharedPreferencesUser.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPage();
}

class _UserPage extends State<UserPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  String message = 'welcome';
  String _selectedLanguage = 'English';
  final List<String> _languageOptions = ['English', 'German'];

  @override
  void initState() {
    super.initState();
    _selectedLanguage = User.language;
    if (_selectedLanguage == 'German') {
      message = 'Wilkommen';
    } else {
      message = 'Welcome';
    }
    getUsername().then((username) {
      getLanguage().then((language) {
        setState(() {
          User.setUsername(username);
          User.setLanguage(language);
        });
      });
    });
  }

  Future<String> getUsername() async {
    String? username = await SharedPreferencesUser.getUsername();
    return username!;
  }

  Future<String> getLanguage() async {
    String? language = await SharedPreferencesUser.getLanguage();
    return language!;
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  Future<void> setSharedPrefData(String username, String language) async {
    await SharedPreferencesUser.saveUserPreferences(username, language);
  }

  Future<void> setSharedPrefLanguage(String language) async {
    await SharedPreferencesUser.changeLanguage(language);
  }

  @override
  Widget build(BuildContext context) {
    if (User.userName == '' || User.userName.isEmpty) {
      // User.username is empty, show form to enter a username
      return Scaffold(
        appBar: AppBar(
          title: const Text('User Settings'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Please enter your username:',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _usernameController,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter a username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // Username entered, update User.username
                        setState(() {
                          User.setUsername(_usernameController.text);
                          setSharedPrefData(
                              _usernameController.text, 'English');
                        });
                      }
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      // User.username is not empty, display welcome message and dropdown list
      return Scaffold(
        appBar: AppBar(
          title: const Text('User Settings'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Language:',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 16),
                    DropdownButton<String>(
                      value: _selectedLanguage,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedLanguage = newValue!;
                          User.setLanguage(_selectedLanguage);
                          setSharedPrefLanguage(_selectedLanguage);
                          if (_selectedLanguage == 'German') {
                            message = 'Welkommen';
                          } else {
                            message = 'Welcome';
                          }
                        });
                      },
                      items: _languageOptions.map((String language) {
                        return DropdownMenuItem<String>(
                          value: language,
                          child: Text(language),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  '$message ${User.userName}!',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
