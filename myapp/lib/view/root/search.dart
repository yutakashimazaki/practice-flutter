import 'package:flutter/material.dart';
import 'package:myapp/extension/extension_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n(context).label_search_appbar_title),
      ),
      body: Center(
        child: Text(
          l10n(context).message_common_undone,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }  
}
