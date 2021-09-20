import 'package:flutter/material.dart';

class BookMarkView extends StatelessWidget {
  const BookMarkView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Mark'),
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
