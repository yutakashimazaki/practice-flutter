import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
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
