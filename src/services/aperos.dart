import 'dart:convert';

import '../dependencies.dart';
import '../sturcturs/apero.dart';
import '../services/http.dart';

class AperosService {

  bool _error = false;
  int max = 1;
  List<Apero> _aperos = [];

  bool allLoaded() {
    return max <= _aperos.length;
  }

  List<Apero> get aperos {
    return List.unmodifiable(_aperos);
  }

  Apero? apero(String? id) {
    if(id == null) return null;

    Apero? apero;
    _aperos.forEach((element) {
      if(element.id == id) apero = element;
    });

    return apero;
  }

  loadMore() async {
    var res = await dependencies<HttpService>().get("jsonapi/view/virtualaperos");
    if(res.statusCode != 200) {
      _error = true;
      return;
    }

    try {
      json.decode(res.body).forEach((apero) {
        var splitDate = apero["datum"].split(".");
        var date = DateTime.utc(
          int.parse(splitDate[2]),
            int.parse(splitDate[1]),
            int.parse(splitDate[0])
        );
        _aperos.add(Apero(
          apero["id"],
          apero["titel"],
          date,
          apero["inhalt"].trim(),
          apero["teilnehmer"],
        ));
      });
    } catch (e) {
      print("$e");
      _error = true;
      return;
    }
  }

  reload() async {
    this._aperos = [];
    await this.loadMore();
  }
}
