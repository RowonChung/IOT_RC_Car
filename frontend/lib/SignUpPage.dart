import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isEmailAvailable = true; // Flag to indicate email availability

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _checkEmailAvailability() async {
    // Simulate asynchronous email validation (e.g., API call)
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) { // Check if widget is still mounted
      setState(() {
        _isEmailAvailable = _emailController.text.isNotEmpty &&
            _emailController.text.contains('@') &&
            _emailController.text.contains('.');
      });
    }
  }

  void _handleSignUp() {
    if (_formKey.currentState!.validate()) {
      // Handle actual sign up logic here (e.g., API call)
      print('회원가입 시도: 이름: ${_nameController.text}, 이메일: ${_emailController.text}, 비밀번호: ${_passwordController.text}');
      // Navigate to next page or perform other actions
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(22, 22, 24, 1),
        iconTheme: IconThemeData(
          color: Color.fromRGBO(240, 240, 243, 1), // Set the desired color for icons
        ),
        title: Text(
          '회원가입 페이지',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(240, 240, 243, 1),
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(22, 22, 24, 1),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name field
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: '이름',
                  hintText: '이름을 입력하세요',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '이름을 입력하세요.';
                  }
                  return null;
                },
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16.0),
              // Email address field with validation and availability check
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: '이메일',
                  hintText: '이메일을 입력하세요',
                  errorText: _isEmailAvailable ? null : '이메일 형식이 잘못되었습니다.',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '이메일을 입력하세요.';
                  } else if (!value.contains('@') || !value.contains('.')) {
                    return '이메일 형식이 잘못되었습니다.';
                  }
                  return null;
                },
                onChanged: (value) => _checkEmailAvailability(),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16.0),
              // Password field
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: '비밀번호',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '비밀번호를 입력하세요.';
                  } else if (value.length < 6) {
                    return '비밀번호는 6자리 이상이어야 합니다.';
                  }
                  return null;
                },
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16.0),
              // Confirm password field
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: '비밀번호 확인',
                ),
                validator: (value) {
                  if (value != _passwordController.text) {
                    return '비밀번호가 일치하지 않습니다.';
                  }
                  return null;
                },
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 32.0),
              // Sign up button with conditional enable/disable based on email availability
          Row(
            mainAxisAlignment: MainAxisAlignment.end, // Align to the end (right)
            children: [
              // Sign in button with custom color and text color
              ElevatedButton(
                onPressed: _isEmailAvailable ? _handleSignUp : null,
                child: Text('회원가입'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(89, 89, 89, 1),
                  foregroundColor: Colors.white, // Set text color
                ),
              ),
              SizedBox(width: 8.0),
            ],
          ),
          ],
        ),
        ),
      ),

    );
  }
}