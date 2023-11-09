class RejaModeli {
  final String id;
  final String nomi;
  final DateTime kuni;
  bool bajarildi = false;

  RejaModeli({
    required this.id,
    required this.nomi,
    required this.kuni,
  });

  void changeBajarildi() {
    bajarildi = !bajarildi;
  }
}

class Rejalar {
  List<RejaModeli> _ruyxat = [
    RejaModeli(id: 'r1', nomi: 'Bozorga borish', kuni: DateTime.now()),
    RejaModeli(id: 'r2', nomi: 'Badantarbiya qilish', kuni: DateTime.now()),
    RejaModeli(id: 'r3', nomi: "Flutter o'rganish", kuni: DateTime.now()),
  ];

  List<int> getUncompletedIndexList() {
    List<int> uncompletedIndexes = [];
    for (int i = 0; i < _ruyxat.length; i++) {
      if (!_ruyxat[i].bajarildi) {
        uncompletedIndexes.add(i);
      }
    }
    return uncompletedIndexes;
  }

  List<RejaModeli> get ruyxat {
    return _ruyxat;
  }

  List<RejaModeli> todoByDay(DateTime day) {
    return _ruyxat
        .where((todo) =>
            todo.kuni.day == day.day &&
            todo.kuni.month == day.month &&
            todo.kuni.year == day.year)
        .toList();
  }

  void addTodo(String rejaNomi, DateTime rejaKuni) {
    _ruyxat.add(RejaModeli(
        id: "r${_ruyxat.length + 1}", nomi: rejaNomi, kuni: rejaKuni));
  }
}
