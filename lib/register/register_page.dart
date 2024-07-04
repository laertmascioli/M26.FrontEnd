import 'package:flutter/material.dart';
import 'package:m26/login/login_page.dart';
import 'package:m26/register/register_model.dart';
import 'package:m26/register/register_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var width = 0.0;
  var height = 0.0;
  var align = Alignment.topCenter;
  // final _formKey = GlobalKey<FormState>();
  final _txtUserName = TextEditingController();
  final _txtFirstname = TextEditingController();
  final _txtLastname = TextEditingController();
  final _txtPassword = TextEditingController();
  final _txtEmail = TextEditingController();
  final _txtTelephone = TextEditingController();
  final service = RegisterService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
      floatingActionButton: _getFloatingActionButton(),
    );
  }

  _getAppBar() {
    return AppBar(
      title: Row(
        children: [
          SizedBox(
            width: 30,
            child: Hero(
                tag: 'imageLogin', child: Image.asset('assets/Icone_M26.png')),
          ),
          const SizedBox(width: 75),
          const Text(
            'Register',
            style: TextStyle(fontSize: 18, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      leadingWidth: 25,
      leading: Builder(
        builder: (context) {
          return InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const LoginPage(),
                ),
              );
            },
            child: const Row(
              children: [
                Icon(Icons.arrow_back_ios_new_outlined),
              ],
            ),
          );
        },
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff0b121c), Color(0xff344555)]),
        ),
      ),
    );
  }

  _getFloatingActionButton() {
    return Opacity(
      opacity: 0.5,
      child: FloatingActionButton.extended(
        onPressed: () async {
          bool response = await service.addUser(
            RegisterModel(
                _txtUserName.text,
                _txtFirstname.text,
                _txtLastname.text,
                _txtPassword.text,
                _txtEmail.text,
                "D",
                "2024-07-03",
                "2024-07-03",
                "2024-07-03",
                "Y",
                "Y",
                "Y"),
          );

          if (response) {
            // ignore: use_build_context_synchronously
            Navigator.of(context).pushReplacement(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const LoginPage(),
                settings: const RouteSettings(name: '/login'),
              ),
            );
          }
        },
        backgroundColor: const Color(0xffbbc1c1),
        icon: const Icon(
          Icons.save_outlined,
          color: Colors.black,
        ),
        label: const Text(
          'Save',
          style: TextStyle(
              letterSpacing: 0,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
    );
  }

  _getBody() {
    return Container(
      padding: const EdgeInsets.all(27),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xff0b121c), Color(0xff344555)]),
      ),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Icon(
                    Icons.person_outline_rounded,
                    color: Colors.black,
                  ),
                ),
                labelText: 'Firstname',
                labelStyle: TextStyle(color: Colors.black),
                border: InputBorder.none,
                fillColor: Color(0xffbbc1c1),
                filled: true,
              ),
              controller: _txtFirstname,
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Icon(
                    Icons.person_outline_rounded,
                    color: Colors.black,
                  ),
                ),
                labelText: 'Lastname',
                labelStyle: TextStyle(color: Colors.black),
                border: InputBorder.none,
                fillColor: Color(0xffbbc1c1),
                filled: true,
              ),
              controller: _txtLastname,
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Icon(
                    Icons.email_outlined,
                    color: Colors.black,
                  ),
                ),
                labelText: 'E-mail',
                labelStyle: TextStyle(color: Colors.black),
                border: InputBorder.none,
                fillColor: Color(0xffbbc1c1),
                filled: true,
              ),
              controller: _txtEmail,
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Icon(
                    Icons.phone_android_outlined,
                    color: Colors.black,
                  ),
                ),
                labelText: 'Telephone',
                labelStyle: TextStyle(color: Colors.black),
                border: InputBorder.none,
                fillColor: Color(0xffbbc1c1),
                filled: true,
              ),
              controller: _txtTelephone,
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Icon(
                    Icons.account_circle_outlined,
                    color: Colors.black,
                  ),
                ),
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.black),
                border: InputBorder.none,
                fillColor: Color(0xffbbc1c1),
                filled: true,
              ),
              controller: _txtUserName,
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Icon(
                    Icons.lock_outline,
                    color: Colors.black,
                  ),
                ),
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.black),
                border: InputBorder.none,
                fillColor: Color(0xffbbc1c1),
                filled: true,
              ),
              controller: _txtPassword,
            ),
          ],
        ),
      ),
    );
  }
}
