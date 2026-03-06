import 'dart:io';

void main() {
  Set<String> burung = {'Merpati','Elang','Kakaktua'};
  print('Burung: $burung');


print('\n==SEMUA DATA==');

  Set<String> dataSet = {'a', 'b', 'c', 'd', 'e'};
  int index = 1;
  for (String data in dataSet) {
    print('$index. $data');
    index++;
  }
  print('Total data: ${dataSet.length}');

  stdout.write('Masukkan data baru: ');
  String inputBaru = stdin.readLineSync()!;
  if (dataSet.add(inputBaru)) {
    print('Data "$inputBaru" berhasil ditambahkan!');
  } else {
    print('Data "$inputBaru" gagal ditambahkan (mungkin sudah ada)!');
  }

  stdout.write('Masukkan data yang ingin dihapus: ');
  String inputHapus = stdin.readLineSync()!;
  if (dataSet.remove(inputHapus)) {
    print('Data "$inputHapus" berhasil dihapus!');
  } else {
    print('Data "$inputHapus" tidak ada di Set!');
  }

  stdout.write('Masukkan data yang ingin dicek: ');
  String inputCek = stdin.readLineSync()!;
  if (dataSet.contains(inputCek)) {
    print('Data "$inputCek" ada di Set!');
  } else {
    print('Data "$inputCek" tidak ada di Set!');
  }
}