import 'package:flutter/material.dart';
import 'package:m26/login/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                  title: const Text("Editar perfil"),
                  onTap: () {
                    // Get.to(EditCad());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text("Cadastro categorias"),
                  onTap: () {
                    // Get.to(EditCad());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text("Cadastro posições"),
                  onTap: () {
                    // Get.to(EditCad());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text("Cadastro moedas"),
                  onTap: () {
                    // Get.to(EditCad());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text("Cadastro bonus"),
                  onTap: () {
                    // Get.to(EditCad());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text("Cadastro paises"),
                  onTap: () {
                    // Get.to(EditCad());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text("Cadastro agentes"),
                  onTap: () {
                    // Get.to(EditCad());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text("Cadastro jogadores/tecnicos"),
                  onTap: () {
                    // Get.to(EditCad());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text("Cadastro clubes"),
                  onTap: () {
                    // Get.to(EditCad());
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
                    (_) => const LoginPage();
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
