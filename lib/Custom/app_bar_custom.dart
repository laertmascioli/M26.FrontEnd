import 'package:flutter/material.dart';

class AppBarCustom extends AppBar {
  AppBarCustom({super.key})
      : super(
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
          leading: const Row(
            children: [
              Icon(Icons.arrow_back_ios_new_outlined),
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
        );
}
