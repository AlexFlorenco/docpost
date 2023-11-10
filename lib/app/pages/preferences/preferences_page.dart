import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({super.key});

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  var loadingList = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          title: Container(
            alignment: AlignmentDirectional.centerStart,
            child: const Text(
              'Preferências',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        body: Stack(children: [
          Container(
            color: Colors.blue,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Conectar e-mails',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 42,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 42,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 42,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  const SizedBox(height: 36),
                  const Text(
                    'E-mails conectados',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const ExpansionTile(
                    tilePadding: EdgeInsets.zero,
                    shape: LinearBorder.none,
                    title: Text(
                      'Google',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 16),
                        title: Text('financeiro.docpost@gmail.com'),
                        trailing: Icon(
                          Icons.exit_to_app,
                          color: Colors.red,
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 16),
                        title: Text('logistica.docpost@gmail.com'),
                        trailing: Icon(
                          Icons.exit_to_app,
                          color: Colors.red,
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 16),
                        title: Text('admin.docpost@gmail.com'),
                        trailing: Icon(
                          Icons.exit_to_app,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  const ExpansionTile(
                    tilePadding: EdgeInsets.zero,
                    shape: LinearBorder.none,
                    title: Text(
                      'Microsoft',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 16),
                        title: Text('financeiro.docpost@hotmail.com'),
                        trailing: Icon(
                          Icons.exit_to_app,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  const ExpansionTile(
                    tilePadding: EdgeInsets.zero,
                    shape: LinearBorder.none,
                    title: Text(
                      'Yahoo',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 16),
                        title: Text('docpost@yahoo.com'),
                        trailing: Icon(
                          Icons.exit_to_app,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                      child: const Text('Sair'),
                      onTap: () {
                        const FlutterSecureStorage().deleteAll();
                        Get.toNamed('/');
                      })
                ],
              ),
            ),
          ),
        ]));
  }
}
