import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/modals/reja_modeli.dart';
import 'package:todo_app/widgets/bajarilganlarRuyxati.dart';
import 'package:todo_app/widgets/mode_reja_oynasi.dart';
import 'package:todo_app/widgets/rejalar_ruyxati.dart';
import 'package:todo_app/widgets/rejalar_sanasi.dart';
import 'package:todo_app/widgets/rejalar_soni.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
      home: RejalarDasturi(),
    );
  }
}

class RejalarDasturi extends StatefulWidget {
  @override
  State<RejalarDasturi> createState() => _RejalarDasturiState();
}

class _RejalarDasturiState extends State<RejalarDasturi> {
  Rejalar _rejalar = Rejalar();
  DateTime _belgilanganKun = DateTime.now();
  // List<int> uncompletedIndexes = _rejalar.getUncompletedIndexList();
  void _oldingiSana() {
    setState(() {
      _belgilanganKun = DateTime(
        _belgilanganKun.year,
        _belgilanganKun.month,
        _belgilanganKun.day - 1,
      );
    });
  }

  void _keyingiSana() {
    setState(() {
      _belgilanganKun = DateTime(
        _belgilanganKun.year,
        _belgilanganKun.month,
        _belgilanganKun.day + 1,
      );
    });
  }

  void _bajarildiDebBelgilash(String rejaId) {
    setState(() {
      _rejalar
          .todoByDay(_belgilanganKun)
          .firstWhere((reja) => reja.id == rejaId)
          .changeBajarildi();
    });
  }

  void _sananiTanlash(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2026),
    ).then((tanlanganKun) {
      if (tanlanganKun != null) {
        setState(() {
          _belgilanganKun = tanlanganKun;
        });
      }
    });
  }


  void _rejaniUchirish(String rejaId) {
    setState(() {
      _rejalar.ruyxat.removeWhere((reja) => reja.id == rejaId);
    });
  }

  void _rejaQushish(String rejaNomi, DateTime rejaKuni) {
    setState(() {
      _rejalar.addTodo(rejaNomi, rejaKuni);
    });
  }

  int get _rejalarSoni {
    return _rejalar.todoByDay(_belgilanganKun).length;
  }

  int get _bajarilganRejalarSoni {
    return _rejalar
        .todoByDay(_belgilanganKun)
        .where((reja) => reja.bajarildi)
        .length;
  }

  void _rejaQushishOynasi(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: false,
      context: context,
      builder: (ctx) {
        return ModelRejaPage(_rejaQushish);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          RejalarSanasi(
            _sananiTanlash,
            _belgilanganKun,
            _oldingiSana,
            _keyingiSana,
          ),
          RejalarSoni(
            _rejalarSoni,
            _bajarilganRejalarSoni,
          ),
          RejalarRuyxat(
            _rejalar.todoByDay(_belgilanganKun),
            _bajarildiDebBelgilash,
            _rejaniUchirish,
              _bajarilganRejalarSoni,
            // _bajarilganlargaOlish,
          ),
          DonePlansPage(  _rejalar.todoByDay(_belgilanganKun),
            _bajarildiDebBelgilash,
            _rejaniUchirish,
            _bajarilganRejalarSoni,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _rejaQushishOynasi(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
