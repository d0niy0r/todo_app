import 'package:flutter/material.dart';

import '../modals/reja_modeli.dart';

class Reja extends StatelessWidget {
  final RejaModeli reja;
  final Function bejarildiDebBelglilash;
  final Function rejaniUchirish;

  Reja(this.reja, this.bejarildiDebBelglilash, this.rejaniUchirish);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(6),
      leading: IconButton(
        onPressed: () {
          bejarildiDebBelglilash(reja.id);
        },
        icon: Icon(
          reja.bajarildi ? Icons.check_circle_outline : Icons.circle_outlined,
          color: reja.bajarildi ? Colors.green : Colors.grey,
        ),
      ),
      title: Text(
        reja.nomi,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          decoration:
              reja.bajarildi ? TextDecoration.lineThrough : TextDecoration.none,
          color: reja.bajarildi ? Colors.grey : Colors.black,
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          rejaniUchirish(reja.id);
        },
        icon: Icon(
          Icons.delete_forever_rounded,
          size: 20,
        ),
      ),
    );
  }
}
