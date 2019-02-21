import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DashboardHandle {
  String _minerAddress;

  DashboardHandle(this._minerAddress);

  Future<Map> getWorkerInfo() async {
    String url =
        "https://api.nicehash.com/api?method=stats.provider.workers&addr=$_minerAddress";
    http.Response response = await http.get(url);
    return json.decode(response.body);
  }
}
