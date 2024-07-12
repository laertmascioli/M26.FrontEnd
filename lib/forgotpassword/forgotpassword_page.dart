import 'package:flutter/material.dart';
import 'package:m26/login/login_page.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              width: 30,
              child: Hero(
                  tag: 'imageLogin',
                  child: Image.asset('assets/Icone_M26.png')),
            ),
            const SizedBox(width: 30),
            const Text(
              'Deal done',
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
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff0b121c), Color(0xff344555)]),
        ),
      ),
    );
  }
}
