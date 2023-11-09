import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class RejalarSanasi extends StatelessWidget {
  final Function sananiTanlash;
  final DateTime belgilanganKun;
  final Function() keyingiSana;
  final Function() oldingiSana;

  RejalarSanasi(this.sananiTanlash, this.belgilanganKun, this.oldingiSana, this.keyingiSana);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: oldingiSana,
          icon: const Icon(
            Icons.arrow_left,
            size: 36,
          ),
        ),
        TextButton(
          onPressed: () {
            sananiTanlash(context);
          },
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontFamily: GoogleFonts
                    .montserrat()
                    .fontFamily,
                fontSize: 20,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                    text: "${DateFormat.EEEE().format(belgilanganKun)}, ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                TextSpan(
                  text: "${DateFormat("d MMM").format(belgilanganKun)}",
                )
              ],
            ),
          ),
        ),
        IconButton(
          onPressed: keyingiSana,
          icon: const Icon(
            Icons.arrow_right,
            size: 36,
          ),
        ),
      ],
    );
  }
}
