import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/extension/extension_widget.dart';

class ModalView extends StatelessWidget {
  const ModalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: OverflowBox(
          alignment: FractionalOffset.centerLeft,
          maxWidth: 160.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              child: Text(
                l10n(context).label_common_button_cancel,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.blue,
                ),
              ), 
              onPressed: () => {
                Navigator.pop(context)
              }
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              child: Text(
                l10n(context).label_post_button,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(88.0, 20.0),
                shape: const StadiumBorder(),
                elevation: 0.0,
              ),
              onPressed: () => {
                Navigator.pop(context)
              }
            ),
          ),
        ],
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 12.0),
            child: const CircleAvatar(
              radius: 16.0,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage('res/image/user.png'),
            ),
          ),
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              autofocus: true,
              decoration: InputDecoration(
                hintText: l10n(context).message_post_placeholder,
                border: InputBorder.none,
              ),
            )
          ),
        ],
      )
    );
  }  
}
