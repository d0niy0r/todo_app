import 'package:flutter/material.dart';

class RejalarSoni extends StatelessWidget {
  final int _rejalarSoni;
  final int bajarilganRejalarSoni;

  RejalarSoni(this._rejalarSoni, this.bajarilganRejalarSoni);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _rejalarSoni< 10 ? "0${_rejalarSoni}" : _rejalarSoni.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Barcha rejalarimiz",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                bajarilganRejalarSoni< 10 ? "0${bajarilganRejalarSoni}" : bajarilganRejalarSoni.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Bajarilgan rejalarimiz",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
