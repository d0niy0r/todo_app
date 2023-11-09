import 'package:flutter/material.dart';
import '../modals/reja_modeli.dart';

class DonePlansPage extends StatelessWidget {
  final List<RejaModeli> rejalar;
  final Function bajarildiDebBelgilash;
  final Function rejaniUchirish;
  final int bajarilganRejalarSoni;

  DonePlansPage(this.rejalar, this.bajarildiDebBelgilash, this.rejaniUchirish,this.bajarilganRejalarSoni);

  // int get BajarilganlarUrni{
  //   return rejalar.;
  // }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: bajarilganRejalarSoni,
          itemBuilder: (ctx, index) {
            return ListTile(
              contentPadding: EdgeInsets.all(6),
              leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.check_circle_outline, color: Colors.green,
                ),
              ),
              title: Text(
                rejalar[index].nomi,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  decoration:
                  TextDecoration.lineThrough,
                  color:Colors.grey,
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete_forever_rounded,
                  size: 20,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
