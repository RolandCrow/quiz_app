import 'package:shared_preferences/shared_preferences.dart';


urlDataCategory(category) async {
  SharedPreferences urlDataPref = await SharedPreferences.getInstance();
  urlDataPref.setString('selectedCategory', category);
}

urlDataDifficulty(difficulty) async {
  SharedPreferences urlDataPref = await SharedPreferences.getInstance();
  urlDataPref.setString("selectedDifficulty", difficulty);
}
