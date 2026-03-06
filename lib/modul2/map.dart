import 'dart:io';

void main() {
  Map<String, String> data = {
    'Adella': '12345',
    'Alifia': '67890',
    "Arvi": '54321',
  };
  print('Data Awal: $data');

  data['Fahril'] = '98765';
  print('Data setelah ditambahkan Fahril: $data');

  print('Nomor Adella: ${data['Adella']}');

  print('\n=== UBAH NOMOR MAHASISWA ===');
  stdout.write('Masukkan Nama yang ingin diubah nomornya: ');
  String? keyUbah = stdin.readLineSync()?.trim(); 
  
  if (data.containsKey(keyUbah)) {
    stdout.write('Masukkan Nomor Baru untuk $keyUbah: ');
    String? nomorBaru = stdin.readLineSync()?.trim();
    data[keyUbah!] = nomorBaru!;
    print('Data berhasil diubah!');
    print('Data sekarang: $data'); 
  } else {
    print('Nama tidak ditemukan!');
  }

  print('\n=== HAPUS DATA MAHASISWA ===');
  stdout.write('Masukkan Nama yang ingin dihapus: ');
  String? keyHapus = stdin.readLineSync()?.trim();
  
  if (data.remove(keyHapus) != null) {
    print('Data $keyHapus berhasil dihapus!');
    print('Data sekarang: $data'); 
  } else {
    print('Gagal hapus, nama tidak ada!');
  }

  print('\n=== CEK DATA MAHASISWA ===');
  stdout.write('Masukkan Nama yang ingin dicek: ');
  String? keyCek = stdin.readLineSync()?.trim();
  
  if (data.containsKey(keyCek)) {
    print('Data $keyCek ADA di dalam Map.');
  } else {
    print('Data $keyCek TIDAK ADA.');
  }

  print('\n=== REKAP SEMUA DATA ===');
  print('Jumlah total data: ${data.length}');
  print('Daftar Semua Nama: ${data.keys.toList()}'); 
  print('Daftar Semua Nomor: ${data.values.toList()}');

  print('\n=== INPUT DATA 1 MAHASISWA BARU ===');
  Map<String, String> mhsSingle = {};
  
  stdout.write('Masukkan NIM: ');
  mhsSingle['nim'] = stdin.readLineSync()!.trim();
  
  stdout.write('Masukkan Nama: ');
  mhsSingle['nama'] = stdin.readLineSync()!.trim();
  
  stdout.write('Masukkan Jurusan: ');
  mhsSingle['jurusan'] = stdin.readLineSync()!.trim();
  
  stdout.write('Masukkan IPK: ');
  mhsSingle['ipk'] = stdin.readLineSync()!.trim();

  print('\nData Mahasiswa Baru: $mhsSingle');


  print('\n=== INPUT MULTIPLE MAHASISWA ===');
  stdout.write('Masukkan jumlah mahasiswa: ');
  
  int jumlah = 0;
  try {
    jumlah = int.parse(stdin.readLineSync()!.trim());
  } catch (e) {
    print('Input harus angka!');
    return;
  }

  List<Map<String, String>> listMahasiswa = [];

  for (int i = 0; i < jumlah; i++) {
    print('\n--- Mahasiswa ke-${i + 1} ---');
    Map<String, String> mhs = {};
    
    stdout.write('Masukkan NIM: ');
    mhs['nim'] = stdin.readLineSync()!.trim();
    
    stdout.write('Masukkan Nama: ');
    mhs['nama'] = stdin.readLineSync()!.trim();
    
    stdout.write('Masukkan Jurusan: ');
    mhs['jurusan'] = stdin.readLineSync()!.trim();
    
    stdout.write('Masukkan IPK: ');
    mhs['ipk'] = stdin.readLineSync()!.trim();
    
    listMahasiswa.add(mhs);
  }

  print('\n=== HASIL INPUT MULTIPLE MAHASISWA ===');
  print(listMahasiswa);
}