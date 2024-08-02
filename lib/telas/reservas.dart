import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:teste/apis/servicos.dart';
import 'package:teste/models/Reserva.dart';

class ReservasCalendarPage extends StatefulWidget {
  @override
  _ReservasCalendarPageState createState() => _ReservasCalendarPageState();
}

class _ReservasCalendarPageState extends State<ReservasCalendarPage> {
  late Future<ReservaResponse> futureReservas;
  final ServicoReservas servicoReservas = ServicoReservas();

  @override
  void initState() {
    super.initState();
    futureReservas = servicoReservas.getReservas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendario de Reservas'),
      ),
      body: FutureBuilder<ReservaResponse>(
        future: futureReservas,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.data.isEmpty) {
            return Center(child: Text('Nenhuma reserva encontrada'));
          } else {
            final events = snapshot.data!.data.map((reserva) {
              return CalendarEventData(
                title: reserva.attributes.title,
                date: DateTime.parse(reserva.attributes.start),
                startTime: DateTime.parse(reserva.attributes.start),
                endTime: DateTime.parse(reserva.attributes.end),
                color: Color(int.parse(
                    reserva.attributes.color.replaceFirst('#', '0xff'))),
              );
            }).toList();

            return MonthView(
              controller: EventController()..addAll(events),
            );
          }
        },
      ),
    );
  }
}
