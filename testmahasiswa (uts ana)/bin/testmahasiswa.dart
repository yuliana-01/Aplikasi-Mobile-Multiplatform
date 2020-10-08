import 'package:testmahasiswa/Ketua_Hima.dart';
import 'package:testmahasiswa/KetuaHima.dart';
void main(List<String> arguments) {
var hima = KetuaHima();
hima.nama = 'Yuliana Ningsih';
hima.nrp = 1012008;
hima.jurusan= 'teknik informatika';

print('nama ketua hima : ' + hima.nama.toString());
print('nrp = ' + hima.nrp.toString());
print('' +hima.info());
}
