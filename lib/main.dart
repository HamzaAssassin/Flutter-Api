import 'package:flutter/material.dart';
import 'package:flutter_api_provider/album_api_provider.dart';
import 'package:provider/provider.dart';

import 'album.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
          create: (context) => AlbumApiProvider(),
          child: const MyHomePage(title: 'Provider Api')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AlbumApiProvider>(context, listen: false).fetchAlbums();
    });
  }

  @override
  Widget build(BuildContext context) {
    // var screenSize = MediaQuery.of(context).size;
    // var height = screenSize.height;
    // var width = screenSize.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Consumer<AlbumApiProvider>(
        builder: (context, value, child) {
          final items = value.todos;
          if (value.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text(items[index].id.toString()),
                ),
                trailing: const CircleAvatar(
                  child: Icon(Icons.person_outline),
                ),
                subtitle: Text(
                  items[index].title,
                  style: TextStyle(
                      color: items[index].completed == true
                          ? Colors.grey
                          : Colors.black),
                ),
                title: Text(
                  items[index].userId.toString(),
                  style: TextStyle(
                      color: items[index].completed == true
                          ? Colors.grey
                          : Colors.black),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
