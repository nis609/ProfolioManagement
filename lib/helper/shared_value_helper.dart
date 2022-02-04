import 'package:shared_value/shared_value.dart';

final SharedValue<bool> is_logged_in = SharedValue(
  value: false, // initial value
  key: "is_logged_in", // disk storage key for shared_preferences
  autosave: true, // autosave to shared prefs when value changes
);

final SharedValue<bool> login_with_intro = SharedValue(
  value: false, // initial value
  key: "is_logged_in", // disk storage key for shared_preferences
  autosave: true, // autosave to shared prefs when value changes
);
final SharedValue<bool> is_first_login = SharedValue(
  value: false, // initial value
  key: "isFirstLogin", // disk storage key for shared_preferences
  autosave: false, // autosave to shared prefs when value changes
);

final SharedValue<String?> access_token = SharedValue(
  value: "aa", // initial value
  key: "access_token", // disk storage key for shared_preferences
  autosave: true, // autosave to shared prefs when value changes
);
final SharedValue<double> totalValue = SharedValue(
  value: 0.0, // initial value
  key: "total value", // disk storage key for shared_preferences
  autosave: true, // autosave to shared prefs when value changes
);
final SharedValue<double> totalSales = SharedValue(
  value: 0.0, // initial value
  key: "total value", // disk storage key for shared_preferences
  autosave: true, // autosave to shared prefs when value changes
);
final SharedValue<bool> appbarVisible = SharedValue(
  value: true, // initial value
  key: "appbarVisible", // disk storage key for shared_preferences
  autosave: true, // autosave to shared prefs when value changes
);

final SharedValue<int?> user_id = SharedValue(
  value: 0, // initial value
  key: "user_id", // disk storage key for shared_preferences
  autosave: true, // autosave to shared prefs when value changes
);

final SharedValue<String?> devie_Id = SharedValue(
  value: "0", // initial value
  key: "devie_Id", // disk storage key for shared_preferences
  autosave: true, // autosave to shared prefs when value changes
);
final SharedValue<String?> avatar_original = SharedValue(
  value: "", // initial value
  key: "avatar_original", // disk storage key for shared_preferences
  autosave: true, // autosave to shared prefs when value changes
);

final SharedValue<String?> user_name = SharedValue(
  value: "", // initial value
  key: "user_name", // disk storage key for shared_preferences
  autosave: true, // autosave to shared prefs when value changes
);

final SharedValue<String?> user_email = SharedValue(
  value: "", // initial value
  key: "user_email", // disk storage key for shared_preferences
  autosave: true, // autosave to shared prefs when value changes
);

final SharedValue<String?> user_phone = SharedValue(
  value: "", // initial value
  key: "user_phone", // disk storage key for shared_preferences
  autosave: true, // autosave to shared prefs when value changes
);final SharedValue<String?> firebase_token = SharedValue(
  value: "", // initial value
  key: "firebase_token", // disk storage key for shared_preferences
  autosave: true, // autosave to shared prefs when value changes
);final SharedValue<String?> device_id = SharedValue(
  value: "", // initial value
  key: "device_token", // disk storage key for shared_preferences
  autosave: true, // autosave to shared prefs when value changes
);
