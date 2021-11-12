class MainURL {
  MainURL._();

  static String mainURL = 'http://localhost:3000/api';

  static String headerToken = 'trado-token';
  static String account = '/account';
  static String register = '/';
  static String login = '/login';
  static String product = '/product';

  static String registerURL = '$mainURL$account$register';
  static String loginURL = '$mainURL$account$login';
  static String productURl = '$mainURL$product';
  static String productUserURL = '$mainURL$product/user';
}
