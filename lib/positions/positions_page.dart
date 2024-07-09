import 'package:flutter/material.dart';
import 'package:m26/categories/categories_model.dart';
import 'package:m26/categories/categories_service.dart';
import 'package:m26/login/login_page.dart';

class PositionsPage extends StatefulWidget {
  const PositionsPage({super.key});

  @override
  State<PositionsPage> createState() => _PositionsPageState();
}

class _PositionsPageState extends State<PositionsPage> {
  var width = 0.0;
  var height = 0.0;
  var align = Alignment.topCenter;
  final dropValue = "";
  dynamic list;
  // final _formKey = GlobalKey<FormState>();
  final _txtCode = TextEditingController();
  final _txtName = TextEditingController();
  final _txtCategory = TextEditingController();
  var _selectedCategoryId = '';

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
            'Positions',
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
            CategoriesModel(_txtCode.text, _txtName.text, _txtCategory.text),
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
                labelText: 'Position code',
                labelStyle: TextStyle(color: Colors.black),
                border: InputBorder.none,
                fillColor: Color(0xffbbc1c1),
                filled: true,
              ),
              controller: _txtCode,
            ),
            const SizedBox(
              height: 10,
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
                labelText: 'Position name',
                labelStyle: TextStyle(color: Colors.black),
                border: InputBorder.none,
                fillColor: Color(0xffbbc1c1),
                filled: true,
              ),
              controller: _txtName,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color(0xffbbc1c1),
              ),
              child: FutureBuilder<List<CategoriesModel>>(
                future: service.getCategoryList(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return DropdownButton(
                      value: _selectedCategoryId,
                      iconDisabledColor: Colors.black,
                      hint: const Text('Select category'),
                      dropdownColor: Colors.transparent,
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_drop_down_rounded),
                      // Array list of items
                      items: snapshot.data!.map((item) {
                        return DropdownMenuItem(
                          value: item.categoryCode,
                          child: Text(item.categoryName.toString()),
                        );
                      }).toList(),
                      onChanged: (value) {
                        _selectedCategoryId = value!;
                        setState(() {});
                      },
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
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

  // getCategoryList() async {
  //   try {
  //     final response = await http.get(
  //       Uri.parse('${Globals().urlApi}Category/getall'),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Bearer ${_getToken()}'
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       final body = json.decode(response.body) as List;

  //       return body.map((dynamic json) {
  //         final map = json as Map<String, dynamic>;
  //         return CategoriesModel(
  //             map['categoryCode'] as String,
  //             map['categoryName'] as String,
  //             map['categoryDescription'] as String);
  //       }).toList();
  //     }
  //   } on DioException catch (error) {
  //     AlertDialog(
  //       title: Text(error.message.toString()),
  //     );
  //   }
  // }

  // _getToken() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   return prefs.getString('token');
  // }
}
