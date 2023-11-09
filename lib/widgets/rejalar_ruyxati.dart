import 'package:flutter/material.dart';
import 'package:todo_app/modals/reja_modeli.dart';
import 'package:todo_app/widgets/reja.dart';

class RejalarRuyxat extends StatelessWidget {
  final List<RejaModeli> rejalar;
  final Function bajarildiDebBelgilash;
  final Function rejaniUchirish;
  final int bajarilganRejalarSoni;


  RejalarRuyxat(this.rejalar, this.bajarildiDebBelgilash, this.rejaniUchirish,this.bajarilganRejalarSoni);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: rejalar.where((element) => !element.bajarildi).toList().length,
          itemBuilder: (ctx, index) {
            return Reja(rejalar.where((element) => !element.bajarildi).toList()[index], bajarildiDebBelgilash, rejaniUchirish);
          },
        ),
        const SizedBox(height: 16,),
      ],
    );
  }
}
