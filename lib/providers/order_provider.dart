import 'package:flutter/material.dart';

class OrderProvider with ChangeNotifier {
  //status 0 => cancel, 1 => in processing, 2 => delivering, 3 => delivered
  List<Map<String, dynamic>> _listOrders = [
    {
      'idOrder': '12312312',
      'date': '24/09/2021',
      'quantity': 04,
      'total': 65.30,
      'status': 0,
    },
    {
      'idOrder': '541231234',
      'date': '25/09/2021',
      'quantity': 01,
      'total': 80.00,
      'status': 1,
    },
    {
      'idOrder': '821371238',
      'date': '26/09/2021',
      'quantity': 03,
      'total': 25.50,
      'status': 2,
    },
    {
      'idOrder': '4444444',
      'date': '27/09/2021',
      'quantity': 02,
      'total': 100.50,
      'status': 3,
    }
  ];

  List<Map<String, dynamic>> get listOrders => _listOrders;

  List<Map<String, dynamic>> cancelledOrders() {
    return _listOrders.where((order) => order['status'] == 0).toList();
  }

  List<Map<String, dynamic>> inProcessingOrders() {
    return _listOrders.where((order) => order['status'] == 1).toList();
  }

  List<Map<String, dynamic>> deliveringOrders() {
    return _listOrders.where((order) => order['status'] == 2).toList();
  }

  List<Map<String, dynamic>> deliveredOrders() {
    return _listOrders.where((order) => order['status'] == 3).toList();
  }
}
