import 'package:flutter/material.dart';
import 'package:nicehash/handler/DashboardHandler.dart';
import 'package:nicehash/utils/Dictionary.dart' as dictionary;

class DashboardPage extends StatefulWidget {
  DashboardHandle dashboardHandle =
      DashboardHandle("3JhzUyT39gWRgUrM5vD26MYB71DnAjzMwC");

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        //worker information card
        FutureBuilder(
          future: widget.dashboardHandle.getWorkerInfo(),
          builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              List workers = snapshot.data["result"]["workers"];
              if (snapshot.hasData) {
                return buildWorkerCard(workers);
              }
            } else {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(child: CircularProgressIndicator()),
              );
            }
          },
        ),
      ],
    );
  }

  //worker information card
  buildWorkerCard(List workers) {
    return Card(
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Text("Active Worker(s): ${workers.length}"),
        children: <Widget>[
          ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: workers.length,
              itemBuilder: (BuildContext context, int position) {
                return ListTile(
                  title: Text(workers[position][0].toString()),
                  subtitle: Text(
                      "${dictionary.locationDictionary[workers[position][5]]} - ${dictionary.algorithmDictionary[workers[position][6]]}"),
                );
              })
        ],
      ),
    );
  }
}
