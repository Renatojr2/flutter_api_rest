import 'package:flutter/material.dart';
import 'package:rest_api/pages/home/repository/impl_home_repository.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final repository = ImplemetesHomeRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Rest'),
      ),
      body: FutureBuilder<List>(
          future: repository.getApiRest(),
          builder: (context, snashot) {
            if (snashot.hasError) {
              return Text("Aconteceu um error");
            } else if (snashot.hasData) {
              final list = snashot.data;
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(list[index]['name']),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
