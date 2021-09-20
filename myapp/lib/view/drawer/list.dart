import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  const MyListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List'),
      ),
      body: Center(
        child: Text(
          'Coming Soon...',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }  
}
