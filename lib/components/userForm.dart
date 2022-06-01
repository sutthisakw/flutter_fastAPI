import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  final Function submit;
  final String textButton;
  const UserForm({Key? key, required this.submit, required this.textButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String username = '';
    String password = '';
    var _keyForm = GlobalKey<FormState>();
    return Form(
      key: _keyForm,
      child: Column(
        children: [
          ListTile(
            title: TextFormField(
              onSaved: (String? value) {
                username = value!;
              },
              validator: _validateForm,
              decoration:
                  InputDecoration(hintText: 'username', labelText: 'username'),
            ),
          ),
          ListTile(
            title: TextFormField(
              onSaved: (String? value) {
                password = value!;
              },
              validator: _validateForm,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'password',
                labelText: 'password',
              ),
            ),
          ),
          ListTile(
              title: ElevatedButton(
                  onPressed: () {
                    if (_keyForm.currentState!.validate()) {
                      _keyForm.currentState!.save();
                      submit(username, password);
                    }
                  },
                  child: Text(textButton))),
        ],
      ),
    );
  }

  String? _validateForm(String? value) {
    if (value == null || value == '') {
      return 'กรุณากรอกข้อมูลด้วย';
    }
    return null;
  }
}
