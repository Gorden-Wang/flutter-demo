import 'dart:async';
import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'HBCHttpResponse.dart';

class HBCHttp {

  String url, ak, ut;
  Map<String, String> headers;
  Map requestHeader;

  HBCHttp({
    @required this.url,
    @required this.ak,
    this.ut,
    this.headers
  })
      : assert(url != null),
        assert(url != '') {
    if (headers != null) {
      _getHeaders().addAll(this.headers);
    }
    requestHeader = _getHeaders();
  }

  Future<HBCHttpResponse> get() async {
    final response = await http.get(
        this.url,
        headers: this.headers
    );
    final responseJson = json.decode(response.body);
    return new HBCHttpResponse.fromJson(responseJson);
  }


  Map<String, String> _getHeaders() {
    Map<String, String> _headers = new Map.from({
      'ak': this.ak
    });
    if (this.ut != null && this.ut != '') {
      _headers['ut'] = this.ut;
    }
    return _headers;
  }
}



