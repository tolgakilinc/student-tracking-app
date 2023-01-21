import 'package:developer_student/Models/OrtalamaBase.dart';
import 'package:flutter/material.dart';

class OrtalamaProvider extends ChangeNotifier{
  OrtalamaBase _ortalamaBase;
  Ortalama _secilenKullaniciOrtalama;

  void setOrtalamaBase(OrtalamaBase ortalamaBase) {
    _ortalamaBase = ortalamaBase;
    notifyListeners();
  }

  void setSecilenKullaniciOrtalama(Ortalama ortalama) {
    _secilenKullaniciOrtalama = ortalama;
    notifyListeners();
  }

  OrtalamaBase getOrtalamaBase(){
    return _ortalamaBase;
  }

  Ortalama getSecilenKullaniciOrtalama(){
    return _secilenKullaniciOrtalama;
  }
}