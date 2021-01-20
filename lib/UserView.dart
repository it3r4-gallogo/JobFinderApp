import 'package:JobFinderApp/service/userService.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import 'addEditUser.dart';
import 'model/userModel.dart';

class UserView extends StatefulWidget {
  //UserView({Key key}) : super(key: key);

  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  List<UserModel> userList;
  bool loading = true;

  getAllUser() async {
    userList = await UserService().getUserData();
    setState(() {
      loading = false;
    });
    print("user : ${userList.length}");
  }

  delete(UserModel userModel) async {
    await UserService().deleteUser(userModel);
    setState(() {
      loading = false;
      getAllUser();
    });
    Toast.show("Delete Successful", context,
        gravity: Toast.CENTER, duration: 2);
  }

  @override
  void initState() {
    super.initState();
    getAllUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add a Job'), actions: <Widget>[
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddEditUser(),
              ),
            ).then((value) => getAllUser());
          },
          icon: Icon(Icons.add),
        ),
      ]),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                UserModel user = userList[index];
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddEditUser(
                          userModel: user,
                          index: index,
                        ),
                      ),
                    ).then((value) => getAllUser());
                  },
                  leading: CircleAvatar(
                    child: Text(user.name[0]),
                  ),
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      delete(user);
                    },
                  ),
                );
              },
            ),
    );
  }
}
