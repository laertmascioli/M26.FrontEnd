import 'package:flutter/material.dart';
import 'package:m26/categories/categories_model.dart';
import 'package:m26/categories/categories_service.dart';
import 'package:m26/login/login_page.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<CategoriesPage> {
  var width = 0.0;
  var height = 0.0;
  var align = Alignment.topCenter;
  // final _formKey = GlobalKey<FormState>();
  final _txtCode = TextEditingController();
  final _txtName = TextEditingController();
  final _txtDescription = TextEditingController();
  final service = CategoriesService();

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
          const SizedBox(width: 100),
          const Text(
            'Categories',
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
          bool response = await service.addCategory(
            CategoriesModel(_txtCode.text, _txtName.text, _txtDescription.text),
          );

          if (response) {
            _showMyDialog("Category created");
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
              style: const TextStyle(color: Colors.black),
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Icon(
                    Icons.format_list_numbered,
                    color: Colors.black,
                  ),
                ),
                labelText: 'Code',
                labelStyle: TextStyle(color: Colors.black),
                border: InputBorder.none,
                fillColor: Color(0xffbbc1c1),
                filled: true,
              ),
              controller: _txtCode,
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              style: const TextStyle(color: Colors.black),
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Icon(
                    Icons.abc,
                    color: Colors.black,
                  ),
                ),
                labelText: 'Name',
                labelStyle: TextStyle(color: Colors.black),
                border: InputBorder.none,
                fillColor: Color(0xffbbc1c1),
                filled: true,
              ),
              controller: _txtName,
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              style: const TextStyle(color: Colors.black),
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Icon(
                    Icons.description,
                    color: Colors.black,
                  ),
                ),
                labelText: 'Description',
                labelStyle: TextStyle(color: Colors.black),
                border: InputBorder.none,
                fillColor: Color(0xffbbc1c1),
                filled: true,
              ),
              controller: _txtDescription,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog(String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
