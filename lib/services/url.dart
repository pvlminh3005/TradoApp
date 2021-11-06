class MainURL {
  MainURL._();

  static String mainURL = 'http://localhost:3000/api';

  static String account = '/account';
  static String register = '/';
  static String login = '/login';
  static String headerToken = 'trado-token';

  static String registerURL = '$mainURL$account$register';
  static String loginURL = '$mainURL$account$login';
}
