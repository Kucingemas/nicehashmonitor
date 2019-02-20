import 'package:flutter/material.dart';
import 'package:nicehash/handler/DashboardHandler.dart';

class DashboardPage extends StatefulWidget {
  DashboardHandle dashboardHandle =
      DashboardHandle("3JhzUyT39gWRgUrM5vD26MYB71DnAjzMwC");

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.dashboardHandle.getWorkerStatus(),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List workers = snapshot.data["result"]["workers"];
          if (snapshot.hasData) {
            return buildWorkerCard(workers);
          }
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  buildWorkerCard(List workers) {
    return Card(
      child: ExpansionTile(
        title: Text("Active Worker(s): ${workers.length}"),
      ),
    );
  }
}
