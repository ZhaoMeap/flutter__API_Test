import 'package:flutter/material.dart';
import 'package:api_test/APIs/users.dart';
import 'package:api_test/model/post.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Users?>? user;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("REST APIs CALL"),
        ),
      ),
      body: SizedBox(
        height: 500,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FutureBuilder<Users?>(
              future: user,
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const CircularProgressIndicator();
                } else if(snapshot.connectionState == ConnectionState.none){
                  return Container();
                } else{
                  if(snapshot.hasData){
                    return buildDataWidget(context, snapshot);
                  } else if (snapshot.hasError){
                    return Text('${snapshot.error}');
                  } else{
                    return Container();
                  }
                }
              },
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: clickGetButton,
                child: Text('GET'),
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: clickCreateButton,
                child: Text('POST'),
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: clickUpdateButton,
                child: Text('PUT'),
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: clickDeleteButton,
                child: Text('DELETE'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void clickGetButton(){
    setState(() {
      user = getUsers();
    });
  }
  void clickCreateButton(){
    setState(() {
      user = createUsers("Meap", "Hello, I'm Meap.");
    });
  }
  void clickUpdateButton(){
    setState(() {
      user = updateUsers("John", "My name is John. Nice to meet you.");
    });
  }
  void clickDeleteButton(){
    setState(() {
      user = deleteUsers();
    });
  }

  Widget buildDataWidget(context, snapshot) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(snapshot.data.title),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(snapshot.data.body),
        ),
      ],
    );
  }
}
