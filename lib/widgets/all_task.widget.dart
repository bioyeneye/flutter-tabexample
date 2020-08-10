import 'package:flutter/material.dart';

class AllTaskWidget extends StatefulWidget {
  final Function onChangeCount;


  AllTaskWidget(this.onChangeCount);

  @override
  _AllTaskWidgetState createState() => _AllTaskWidgetState();
}

class _AllTaskWidgetState extends State<AllTaskWidget> with AutomaticKeepAliveClientMixin<AllTaskWidget> {

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      key: scaffoldKey,
      body: Card(
        child: Center(
          child: RaisedButton(
              child: Text("All Count"),
              onPressed: () {
                widget.onChangeCount(90);
              }),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}