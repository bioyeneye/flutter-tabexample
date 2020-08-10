import 'package:contactdesign/widgets/all_task.widget.dart';
import 'package:contactdesign/widgets/completed_task.widget.dart';
import 'package:contactdesign/widgets/ongoing_task.widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Tab Design'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController _controller;
  String _tabTitle;
  int _tabCount;
  final List<String> tabTitles = ["All", "Completed", "On-going"];

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 3, vsync: this);

    _controller.addListener(() {
      setState(() {
        _tabTitle = tabTitles[_controller.index];
        _tabCount = 0;
      });
    });

    setState(() {
      _tabCount = 0;
      _tabTitle = "All";
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void changeTaskCount(int count) {
    setState(() {
      _tabCount = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 24.0, bottom: 24.0, left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  _tabTitle,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  '$_tabCount',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ),
          Container(
            decoration: new BoxDecoration(
              color: Colors.black,
            ),
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 16.0,
            ),
            child: new TabBar(
              controller: _controller,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: Colors.white,
              ),
              tabs: <Widget>[
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("All"),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Completed"),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("On-going"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: new TabBarView(
              dragStartBehavior: DragStartBehavior.down,
              controller: _controller,
              children: <Widget>[
                AllTaskWidget(changeTaskCount),
                CompletedTaskWidget(changeTaskCount),
                OnGoingTaskWidget(changeTaskCount),
              ],
            ),
          ),
        ],
      ),
    );


  }
}



