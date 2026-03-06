import 'dart:io';

void main() {
  List<String> names = ['Alfa', 'beta', 'Charlie'];
  print('Names: $names');

  names.add('Delta');
  print('Names setelah ditambahkan: $names');

  print('Elemen pertama: ${names[0]}');
  print('Elemen kedua: ${names[1]}');

  names[1] = 'Bravo';
  print('Names setelah diubah: $names');

  names.remove('Charlie');
  print('Names setelah dihapus: $names');

  print('Jumlah data: ${names.length}');

  print('Menampilkan setiap elemen:');
  for (String name in names) {
    print(name);
  }

  print('\n-----------------------------------\n');

  List<String> dataList = [];
  print('Data list kosong: $dataList');

  int count = 0;
  while (count <= 0) {
    stdout.write('Masukkan jumlah list: ');
    String? input = stdin.readLineSync();
    try {
      count = int.parse(input!);
      if (count <= 0) {
        print('Masukkan angka lebih dari 0!');
      }
    } catch (e) {
      print('Input tidak valid! Masukkan angka yang benar.');
    }
  }

  for (int i = 0; i < count; i++) {
    stdout.write('data ke-${i + 1}: ');
    String x = stdin.readLineSync()!;
    dataList.add(x);
  }

  print('Data list:');
  print(dataList);

  print('\n-----------------------------------\n');

  print('=== MENU MANIPULASI DATA ===');

  stdout.write('TAMPIL - Masukkan index yang ingin dilihat (0 - ${dataList.length - 1}): ');
  try {
    int idxTampil = int.parse(stdin.readLineSync()!);
    if (idxTampil >= 0 && idxTampil < dataList.length) {
      print('Hasil: ${dataList[idxTampil]}');
    } else {
      print('Index tidak ditemukan.');
    }
  } catch (e) {
    print('Input harus berupa angka.');
  }

  stdout.write('\nUBAH - Masukkan index yang ingin diubah (0 - ${dataList.length - 1}): ');
  try {
    int idxUbah = int.parse(stdin.readLineSync()!);
    if (idxUbah >= 0 && idxUbah < dataList.length) {
      stdout.write('Masukkan data baru pengganti: ');
      String newData = stdin.readLineSync()!;
      dataList[idxUbah] = newData;
      print('Data berhasil diubah!');
    } else {
      print('Index tidak ditemukan.');
    }
  } catch (e) {
    print('Input harus berupa angka.');
  }

  stdout.write('\nHAPUS - Masukkan index yang ingin dihapus (0 - ${dataList.length - 1}): ');
  try {
    int idxHapus = int.parse(stdin.readLineSync()!);
    if (idxHapus >= 0 && idxHapus < dataList.length) {
      String removedData = dataList.removeAt(idxHapus); 
      print('Data "$removedData" berhasil dihapus!');
    } else {
      print('Index tidak ditemukan.');
    }
  } catch (e) {
    print('Input harus berupa angka.');
  }

  print('\n=== SEMUA DATA ===');
  for (int i = 0; i < dataList.length; i++) {
    print('Index $i: ${dataList[i]}');
  }
}