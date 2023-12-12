import 'package:flutter/material.dart';
import 'package:signing_mass/models/objects.dart';

class HandleMusic with ChangeNotifier {
  String title = '', category = '', docRef = '', aux = '', tone = '';
  List<String> addLyrics = [], addCiphers = [];
  int counterLyrics = 0, index = 0;
  List<bool> endStroff = [];

  bool shared = true, edit = false;

  void invertShared() {
    shared = !shared;
    notifyListeners();
  }

  void setIndexTozero() {
    index = 0;
    notifyListeners();
  }

  void incrementIndex(int limit) {
    if (index < limit) index++;
    notifyListeners();
  }

  void decrementIndex() {
    if (index > 0) {
      index--;
    }
    notifyListeners();
  }

  void setTitle(String str) {
    title = str;
    notifyListeners();
  }

  void emptyMusic() {
    addLyrics = [];
    addCiphers = [];
    edit = false;
    title = '';
    tone = 'E';
    notifyListeners();
  }

  void addLyric(int i, String str) {
    addLyrics.add(str);
    addCiphers.add('');
    notifyListeners();
  }

  void editLyric(int i, String str) {
    addLyrics[i] = str;
    notifyListeners();
  }

  void putLyric(int i, String str) {
    addLyrics.insert(i, str);
    addCiphers.insert(i, '');
    notifyListeners();
  }

  void setCategory(String str) {
    category = str;
    notifyListeners();
  }

  void incrementCounterLyrics() {
    counterLyrics++;
    notifyListeners();
  }

  void editCipher(int index, String str) {
    addCiphers[index] = str;
    notifyListeners();
  }

  void resetCounterLyrics() {
    counterLyrics = 0;
    notifyListeners();
  }

  void removeLyric(int index) {
    addLyrics.removeAt(index);
    notifyListeners();
  }

  void setAux(String str) {
    aux = str;
    notifyListeners();
  }

  void setEditChant(Chant chant) {
    addLyrics = chant.lyrics;
    addCiphers = chant.ciphers;
    title = chant.title;
    category = chant.category;
    docRef = chant.uid;
    edit = true;
    tone = chant.tone;
    notifyListeners();
  }

  void resetAuxStr() {
    aux = '';
    notifyListeners();
  }

  void setTone(String str) {
    tone = str;
    notifyListeners();
  }
}
