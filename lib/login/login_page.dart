import 'package:flutter/material.dart';
import 'package:m26/forgotpassword/forgotpassword_page.dart';
import 'package:m26/home/home_page.dart';
import 'package:m26/login/login_service.dart';
import 'package:m26/register/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:password_dart/password_dart.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

String username = '';
String password = '';

class _LoginPageState extends State<LoginPage> {
  var width = 0.0;
  var height = 0.0;
  var align = Alignment.topCenter;
  final _formKey = GlobalKey<FormState>();
  final _txtUsername = TextEditingController();
  final _txtPassword = TextEditingController();
  final service = LoginService();
  var response = '';

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        setState(() {
          width = 100.0;
          height = 100.0;
        });

        // final nav = Navigator.of(context);
        await Future.delayed(const Duration(seconds: 4));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  _getAppBar() {
    return AppBar(
      title: const Text(
        "DEAL DONE",
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
    );
  }

  _getBody() {
    return Container(
      key: _formKey,
      padding: const EdgeInsets.all(27),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Estadio2_m26_Bkg.png'),
          fit: BoxFit.cover,
        ),
        // gradient: LinearGradient(
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //     colors: [Color(0xff0b121c), Color(0xff344555)]),
      ),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: width,
              width: width,
              child: AnimatedContainer(
                duration: const Duration(seconds: 10),
                width: width,
                height: height,
                alignment: align,
                child: Hero(
                  tag: 'imageLogin',
                  child: Image.asset(
                    'assets/Icone_M26.png',
                    height: 120,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Opacity(
              opacity: 0.5,
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _txtUsername,
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
                validator: (value) {
                  if (value!.isEmpty) return "Enter username";
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Opacity(
              opacity: 0.5,
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: _txtPassword,
                obscureText: true,
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
                validator: (value) {
                  if (value!.isEmpty) return "Enter password";
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                if (_txtUsername.text.isEmpty) {
                  response = await service.getLogin(
                      _txtUsername.text, _txtPassword.text);
                } else if (_txtPassword.text.isEmpty) {
                  response = await service.getLogin(
                      _txtUsername.text, _txtPassword.text);
                } else {
                  bool user = await service.getLogin(
                      _txtUsername.text, _txtPassword.text);
                  // Map<String, dynamic> user = await service.getLogin(
                  //     _txtUsername.text, _txtPassword.text);

                  // String token = user['token'].toString();
                  if (user) {
                    _getSalvar();
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushReplacement(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const HomePage(),
                        settings: const RouteSettings(name: '/home'),
                      ),
                    );
                  } else {
                    const AlertDialog(
                      title: Text('Invalid Username or Password.'),
                    );
                  }
                }
              },
              child: Container(
                height: 60,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  // boxShadow: [
                  //   BoxShadow(
                  //       color: Colors.black,
                  //       blurRadius: 10.0,
                  //       spreadRadius: 0.0,
                  //       offset: Offset(1.0, 2.0))
                  // ],
                  // color: Color(0xff696870),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff696870), Colors.transparent],
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  child: Text('Sign in'),
                ),
              ),
            ),
            Container(
              height: 30,
              alignment: Alignment.topCenter,
              child: TextButton(
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.black, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const ForgotPasswordPage(),
                      settings: const RouteSettings(name: '/ForgotPwd'),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 16,
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.only(left: 75),
                      child: const Text(
                        "Don't have an account yet?",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: TextButton(
                        child: const Text(
                          "Register",
                          style: TextStyle(color: Colors.red, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const RegisterPage(),
                              settings: const RouteSettings(name: '/register'),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _getSalvar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('username', _txtUsername.text);
    prefs.setString('password', _txtPassword.text);
    // prefs.setString('Senha', Password.hash(_txtPassword.text, PBKDF2()));
    // prefs.setString('UserID', id);
    // prefs.setString('token', id);

    // var teste = prefs.getString('Senha');

    //Código de validação da senha
    // Password.verify(_txtPassword.text, prefs.getString('Senha'));
  }
}
