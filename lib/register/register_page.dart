import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
            const SizedBox(width: 120),
            const Text(
              'Register',
              style: TextStyle(fontSize: 18, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
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
                height: 50,
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
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
