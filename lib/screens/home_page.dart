import 'package:duet/providers/home_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:stacked/_viewmodel_builder.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageProvider>.reactive(
      viewModelBuilder: () => HomePageProvider(),
      builder: (_, model, __) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Home'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () => model.logout())
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Hallo',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
