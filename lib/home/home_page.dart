import 'package:flutter/material.dart';
import 'package:m26/agents/agents_page.dart';
import 'package:m26/bonus/bonus_page.dart';
import 'package:m26/categories/categories_page.dart';
import 'package:m26/clubs/clubs_page.dart';
import 'package:m26/countries/countries_page.dart';
import 'package:m26/currency/currency_page.dart';
import 'package:m26/editregister/editregister_page.dart';
import 'package:m26/login/login_page.dart';
import 'package:m26/players/players_page.dart';
import 'package:m26/positions/positions_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      drawer: Drawer(
        child: _getContainerDrawer(),
      ),
      body: _getContainerBody(),
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
          const SizedBox(width: 30),
          const Text(
            'Deal done',
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
    );
  }

  _getContainerDrawer() {
    return Container(
      decoration: const BoxDecoration(color: Color(0xff344555)),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text("Edit registration"),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const EditRegisterPage(),
                        settings: const RouteSettings(name: '/editreg'),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text("Categories"),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const CategoriesPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text("Positions"),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const PositionsPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text("Currency"),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const CurrencyPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text("Bonus"),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const BonusPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text("Countries"),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const CountriesPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text("Agents"),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const AgentsPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text("Players/Coaches"),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const PlayersPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text("Clubs"),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const ClubsPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Column(
              children: <Widget>[
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text("Logout"),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const LoginPage(),
                        settings: const RouteSettings(name: '/login'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _getContainerBody() {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xff0b121c), Color(0xff344555)]),
      ),
    );
  }
}
