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
              return ListView.builder(
                itemCount: snashot.data.length,
                itemBuilder: (context, index) {
                  final list = snashot.data[index];
                  return Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                list['name'],
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text('Agencia: ${list['agencia']}'),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text('Conta: ${list['conta']}'),
                                ],
                              ),
                            ],
                          ),
                          CircleAvatar(
                            radius: 38,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('R\$${list['balance']}'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
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
