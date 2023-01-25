import 'package:flutter/material.dart';
import 'package:schedule/widgets/screen_text.dart';

class TimestampText extends StatelessWidget {
  const TimestampText(this.slot, {Key? key}) : super(key: key);

  final DateTime slot;

  static const meses = [
    "",
    "Enero",
    "Febrero",
    "Marzo",
    "Abril",
    "Mayo",
    "Junio",
    "Julio",
    "Agosto",
    "Septiembre",
    "Octubre",
    "Noviembre",
    "Diciembre",
  ];

  @override
  Widget build(BuildContext context) {
    final hour = slot.hour.toString().padLeft(2, '0');
    final minute = slot.minute.toString().padLeft(2, '0');
    return ScreenText(
      "${slot.day} de ${meses[slot.month]} de ${slot.year} a las $hour:$minute",
    );
  }
}
