import 'package:flutter/material.dart';

class MomentView extends StatelessWidget {
  const MomentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moment'),
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
