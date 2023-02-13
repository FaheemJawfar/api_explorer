import 'package:custom_selectable_text/custom_selectable_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ResponseScreen extends StatelessWidget {
  final Response responseBody;

  const ResponseScreen({super.key, required this.responseBody});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Response'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: CustomSelectableText(
            responseBody.body,
            style: const TextStyle(fontFamily: 'Courier', fontWeight: FontWeight.bold),
           // textAlign: TextAlign.center,
            items: [
              CustomSelectableTextItem(controlType: SelectionControlType.copy),
              CustomSelectableTextItem(
                  controlType: SelectionControlType.selectAll),
              CustomSelectableTextItem(
                  label: "Share",
                  controlType: SelectionControlType.other,
                  onPressed: (text) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("$text is successfully shared"),
                    ));
                  }),
            ],
          )
        ),
      ),
    );
  }
}