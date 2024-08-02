import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:teste/models/Reserva.dart';

final URL_SERVICOS = Uri.parse("http://10.0.2.2");

final URL_RESERVAS = "${URL_SERVICOS.toString()}:1337/api/reservations";

class ServicoReservas {
  Future<ReservaResponse> getReservas() async {
    final resposta = await http.get(Uri.parse("${URL_RESERVAS.toString()}"));

    if (resposta.statusCode == 200) {
      final jsonResponse = jsonDecode(resposta.body);
      return ReservaResponse.fromJson(jsonResponse);
    } else {
      throw Exception('Falha ao carregar reservas');
    }
  }
}
