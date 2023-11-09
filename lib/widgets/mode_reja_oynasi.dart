import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ModelRejaPage extends StatefulWidget {
  final Function rejaQushish;

  ModelRejaPage(this.rejaQushish);

  @override
  State<ModelRejaPage> createState() => _ModelRejaPageState();
}

class _ModelRejaPageState extends State<ModelRejaPage> {
  DateTime? _rejaQushishUchunKun;
  final _rejaNomiController = TextEditingController();

  void _kunniTanlashButton(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2024),
    ).then(
      (tanlanganKun) {
        if (tanlanganKun != null) {
          setState(() {
            _rejaQushishUchunKun = tanlanganKun;
          });
        }
      },
    );
  }

  void submit() {
    if (_rejaNomiController.text.isEmpty || _rejaQushishUchunKun == null) {
      return;
    }
    Navigator.of(context).pop();
    widget.rejaQushish(_rejaNomiController.text, _rejaQushishUchunKun);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            top: 16,
            right: 16,
            left: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom > 0 ? MediaQuery.of(context).viewInsets.bottom + 16 : 200),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: "Reja nomi",
              ),
              controller: _rejaNomiController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _rejaQushishUchunKun == null
                      ? "Reja kuni tanlanmagan.."
                      : DateFormat("EEEE, d MMMM, y")
                          .format(_rejaQushishUchunKun!),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                TextButton(
                  onPressed: () => _kunniTanlashButton(context),
                  child: const Text(
                    "Kunni tanlash",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("BEKOR QILISH"),
                ),
                ElevatedButton(
                  onPressed: submit,
                  child: const Text(
                    "Kiritish",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
