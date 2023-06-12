class User {
  static int userID = 0;
  static String userName = '';
  static String language = 'English';

  /*int getuserID() => userID;
  String getuserName() => userName;
  String getLanguage() => language;*/

  static void setUsername(name) {
    userName = name;
  }

  static void setLanguage(lang) {
    language = lang;
  }
}
