import 'package:JobFinderApp/service/userService.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import 'model/userModel.dart';

class AddEditUser extends StatefulWidget {
  final UserModel userModel;
  final int index;
  AddEditUser({this.userModel, this.index});
  @override
  _AddEditUserState createState() => _AddEditUserState();
}

class _AddEditUserState extends State<AddEditUser> {
  TextEditingController name = TextEditingController();
  TextEditingController cname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController jvacant = TextEditingController();
  TextEditingController sneed = TextEditingController();
  TextEditingController cno = TextEditingController();

  bool editMode = false;

  add(UserModel userModel) async {
    await UserService().addUser(userModel).then((success) {
      Toast.show("Add Successful", context, gravity: Toast.CENTER, duration: 2);
      Navigator.pop(context);
    });
  }

  update(UserModel userModel) async {
    await UserService().updateUser(userModel).then((success) {
      Toast.show("Update Successful", context,
          gravity: Toast.CENTER, duration: 2);
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      editMode = true;
      name.text = widget.userModel.name;
      cname.text = widget.userModel.cname;
      email.text = widget.userModel.email;
      jvacant.text = widget.userModel.jvacant;
      sneed.text = widget.userModel.sneed;
      cno.text = widget.userModel.cno;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(editMode ? "Update" : 'Add'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: name,
              decoration: InputDecoration(hintText: 'Job Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: cname,
              decoration: InputDecoration(hintText: 'Company Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: email,
              decoration: InputDecoration(hintText: 'Company email'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: jvacant,
              decoration: InputDecoration(hintText: 'Job Vacancy'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: sneed,
              decoration: InputDecoration(hintText: 'skills Needed'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: cno,
              decoration: InputDecoration(hintText: 'Contact Number'),
            ),
          ),
          RaisedButton(
            onPressed: () {
              if (editMode) {
                UserModel userModel = UserModel(
                    id: widget.userModel.id,
                    name: name.text,
                    cname: cname.text,
                    email: email.text,
                    jvacant: jvacant.text,
                    sneed: sneed.text,
                    cno: cno.text);
                update(userModel);
              } else {
                if (name.text.isEmpty) {
                  Toast.show("This field is required", context,
                      gravity: Toast.CENTER, duration: 2);
                } else {
                  UserModel userModel = UserModel(
                      name: name.text,
                      cname: cname.text,
                      email: email.text,
                      jvacant: jvacant.text,
                      sneed: sneed.text,
                      cno: cno.text);
                  add(userModel);
                }
              }
            },
            child: Text(editMode ? "Update" : 'Save'),
          ),
        ],
      ),
    );
  }
}
