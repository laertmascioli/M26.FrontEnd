import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var width = 0.0;
  var height = 0.0;
  var align = Alignment.topCenter;

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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "DEAL DONE",
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
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
                    tag: 'imageSplash',
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
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Opacity(
                opacity: 0.5,
                child: TextFormField(
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
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
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
                child: TextButton(
                  child: const Text(
                    "Sign in",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {},
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
                  onPressed: () {},
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
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
