import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'SignUpPage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'MainPage.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String _accessToken = '';
  final storage = FlutterSecureStorage();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignIn() async {
    if (_formKey.currentState!.validate()) {
      // Login logic using HTTP POST request
      final String email = _emailController.text;
      final String password = _passwordController.text;

      print(_emailController.text);
      print(_passwordController.text);

      final String jsonData = jsonEncode({'username': email, 'password': password});
      final response = await http.post(
        Uri.parse('http://localhost:8080/user/sign_in'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonData,
      );

      if (response.statusCode == 200) {
        // Login successful
        final Map<String, dynamic> data = jsonDecode(response.body);
        _accessToken = data['jwtToken']['accessToken']; // Extract access token

        // Store the access token securely
        await storage.write(key: 'accessToken', value: _accessToken);
        // Store login status (true)
        await storage.write(key: 'isLogin', value: 'true');
        await storage.write(key: 'userId', value : data['userId'].toString());
        // Navigate to the next page or perform other actions
        print('로그인 성공! access token: $_accessToken ');
        Map<String, String> allValues = await storage.readAll();
        for (var entry in allValues.entries) {
          print('Key: ${entry.key}, Value: ${entry.value}');
        }

        // Reload the UI to reflect login status change
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyApp(isLoggedIn: true)),
        );
      } else {
        // Login failed
        print('로그인 실패: ${response.statusCode}');
        // Handle login failure (e.g., show error message)
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(22, 22, 24, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    SizedBox(height: 50.0),
                    ClipOval(
                      child: Image.asset(
                        'images/logo.png',
                        height: 350.0,
                      ),
                    ),
                    Positioned(
                      left: -40.0,
                      right: -40.0,
                      top: -40.0,
                      bottom: -40.0,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 4.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: '이메일',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '이메일 주소를 입력하세요.';
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: '비밀번호',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '비밀번호를 입력하세요.';
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 32.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpPage(),
                                ),
                              );
                            },
                            child: Text('회원가입'),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: _handleSignIn,
                            child: Text('로그인'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(89, 89, 89, 1),
                              foregroundColor: Colors.white,
                            ),
                          ),
                          SizedBox(width: 8.0),
                        ],
                      ),
                    ],
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
