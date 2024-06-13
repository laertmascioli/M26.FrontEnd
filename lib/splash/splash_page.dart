import 'package:flutter/material.dart';
// import 'package:m26/home/home_page.dart';
import 'package:m26/login/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var width = 0.0;
  var height = 0.0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        width = 300.0;
        height = 300.0;
      });

      final nav = Navigator.of(context);
      await Future.delayed(const Duration(seconds: 3));
      nav.pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const LoginPage(),
          settings: const RouteSettings(name: '/login'),
        ),
        // PageRouteBuilder(
        //   pageBuilder: (context, animation, secondaryAnimation) =>
        //       const HomePage(),
        //   settings: const RouteSettings(name: '/home'),
        // ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff0b121c), Color(0xff344555)]),
        ),
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          width: width,
          height: height,
          alignment: Alignment.center,
          child: Hero(
            tag: 'imageSplash',
            child: Image.asset('assets/logo_M26_Light.png'),
          ),
        ),
      ),
    );
  }
}
