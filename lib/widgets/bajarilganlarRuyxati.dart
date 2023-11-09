import 'package:flutter/material.dart';
import '../modals/reja_modeli.dart';

class DonePlansPage extends StatefulWidget {
  final List<RejaModeli> rejalar;
  final Function bajarildiDebBelgilash;
  final Function rejaniUchirish;
  final int bajarilganRejalarSoni;

  DonePlansPage(this.rejalar, this.bajarildiDebBelgilash, this.rejaniUchirish,this.bajarilganRejalarSoni);

  @override
  State<DonePlansPage> createState() => _DonePlansPageState();
}

class _DonePlansPageState extends State<DonePlansPage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget.rejalar.where((element) => element.bajarildi).toList().length,
          itemBuilder: (ctx, index) {
            List<RejaModeli> newList = widget.rejalar.where((element) => element.bajarildi).toList();
            return ListTile(
              contentPadding: EdgeInsets.all(6),
              leading: IconButton(
                onPressed: () {
                  widget.bajarildiDebBelgilash(newList[index].id);
                },
                icon: Icon(
                  Icons.check_circle_outline, color: Colors.green,
                ),
              ),
              title: Text(
                newList[index].nomi,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  decoration:
                  TextDecoration.lineThrough,
                  color:Colors.grey,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  widget.rejaniUchirish(newList[index].id);
                },
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
