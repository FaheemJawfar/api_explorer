import 'dart:convert';
import 'package:api_explorer/response_screen.dart';
import 'package:flutter/material.dart';
import 'handlers/htpp_handler.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String _selectedMethod = 'GET';
  final _urlController = TextEditingController();
  final _bodyController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade50,
      appBar: AppBar(title: const Text('API Explorer'),
      backgroundColor: Colors.red.shade900,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
    child: Form(
    child: Column(
    children: [
    DropdownButton(
    value: _selectedMethod,
    onChanged: (value) {
    setState(() {
    _selectedMethod = value!;
    });
    },
      items: ['GET', 'POST', 'PUT', 'DELETE']
          .map((method) => DropdownMenuItem(
        value: method,
        child: Text(method),
      ))
          .toList(),
    ),
      TextFormField(
        controller: _urlController,
        decoration: const InputDecoration(labelText: 'URL'),
      ),
      TextFormField(
        controller: _bodyController,
        decoration: const InputDecoration(labelText: 'Body'),
      ),
      ElevatedButton(
        onPressed: () async {
          var response;
          switch (_selectedMethod) {
            case 'GET':
              response = await makeGetRequest(_urlController.text);
              print(response);
              break;
            case 'POST':
              response = await makePostRequest(
                  _urlController.text, jsonDecode(_bodyController.text));
              break;
            case 'PUT':
              response = await makePutRequest(
                  _urlController.text, jsonDecode(_bodyController.text));
              break;
            case 'DELETE':
              response = await makeDeleteRequest(_urlController.text);
              break;
          }
          // Do something with the response

          if(!mounted) return;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResponseScreen(
                responseBody: response.body,
              ),
            ),
          );
        },
        child: const Text('Send Request'),
      ),
    ],
    ),
    ),
      ),
    );
  }
}
