import 'package:flutter/material.dart';
import 'package:m26/home/home_page.dart';

class PlayersPage extends StatelessWidget {
  const PlayersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
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
          const SizedBox(width: 120),
          const Text(
            'Players/Coaches',
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
                      const HomePage(),
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
            ),
          ],
        ),
      ),
    );
  }
}
