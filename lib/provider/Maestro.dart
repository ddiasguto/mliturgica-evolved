import 'package:signing_mass/pages/Root/Home/home_img.dart';
import 'package:signing_mass/functions/shared.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signing_mass/models/objects.dart';

class Maestro with ChangeNotifier {
  Categories categories = Categories();

  bool hasHymn = true,
      showCipher = false,
      isSheet = false,
      isCatalogue = false,
      shrinkList = false,
      subtitlesMyChant = true,
      removeImgHome = true,
      thirdParty = false,
      isMyChants = false;

  int randomImg = 0,
      sheetLenght = 9,
      indexCatalogue = 0,
      randomQuote = 0,
      indexCategory = 0,
      sheetIndex = 0;

  Chant currentChant = Chant(
      tone: 'tone',
      lyrics: ['lyrics'],
      ciphers: ['ciphers'],
      title: 'title',
      category: 'category',
      uid: 'uid');
  List<String> sheet = [];
  String uid = '', ownerID = '', userName = '', category = '', ownerSheet = '';

  void startSheetStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('sheetStatus') != null) {
      sheetIndex = prefs.getInt('sheetStatus')!;
    } else {
      sheetIndex = 0;
    }
  }

  void setCurrentChant(Chant chant) {
    currentChant = chant;
    notifyListeners();
  }

  void setUid(String str) {
    uid = str;
    notifyListeners();
  }

  void setCatalogue(bool aux) {
    isCatalogue = aux;
    notifyListeners();
  }

  void setIsMyChants(bool aux) {
    isMyChants = aux;
    notifyListeners();
  }

  void handleShrink() {
    shrinkList = !shrinkList;
    notifyListeners();
  }

  void setUserName(String str) {
    userName = str.trim();
    notifyListeners();
  }

  void setOwnerSheet(String str) {
    ownerSheet = str;
    notifyListeners();
  }

  void setImgHomeUserPreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('putImgHome') != null) {
      removeImgHome = prefs.getBool('putImgHome')!;
    }
  }

  void setShowCipher() {
    showCipher = !showCipher;
    notifyListeners();
  }

  void randomContent() async {
    randomQuote = Random().nextInt(500) + 500;
    randomImg = Random().nextInt(imgHome.length);
  }

  void handleHasHymn() {
    hasHymn = !hasHymn;
    notifyListeners();
  }

  void handleImgHome() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    removeImgHome = !removeImgHome;
    prefs.setBool('putImgHome', removeImgHome);
    notifyListeners();
  }

  void setOwnerId(String str) {
    ownerID = str;
    notifyListeners();
  }

  void setSheetFalse() {
    isSheet = false;
    notifyListeners();
  }

  void setSheetTrue() {
    isSheet = true;
    notifyListeners();
  }

  void setIndexCatalogue(int index) {
    indexCatalogue = index;
    notifyListeners();
  }

  void handleSubtitleMyChant() {
    subtitlesMyChant = !subtitlesMyChant;
    notifyListeners();
  }

  void setSheetLenght(int i) {
    sheetLenght = i;
    notifyListeners();
  }

  void nextItem() {
    if (sheetIndex < sheetLenght - 1) {
      sheetIndex++;
      notifyListeners();
    }
    if (!thirdParty && sheetIndex < 8) {
      setSheetStatus(sheetIndex);
    }
  }

  void previousItem() {
    if (sheetIndex > 0) {
      sheetIndex--;
      notifyListeners();
    }
    if (!thirdParty) {
      setSheetStatus(sheetIndex);
    }
  }

  void setIndexCategory(int i) {
    indexCategory = i;
    notifyListeners();
  }

  void setThirdParty(bool aux) {
    thirdParty = aux;
    notifyListeners();
  }

  void setCategory() {
    List<String> list = [
      categories.entrance,
      categories.atoPenitencial,
      '',
      categories.aclamation,
      categories.offer,
      categories.saint,
      categories.comunion,
      categories.posComunion,
      categories.ending
    ];
    category = list[indexCategory];
    notifyListeners();
  }
}
