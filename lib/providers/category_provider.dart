import 'package:flutter/material.dart';
import 'package:trado_app_uit/models/category_model.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryModel> _listCategories = [
    CategoryModel(
      id: 'c1',
      idUser: 'user1',
      title: 'Sony-Canon',
      description:
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio, error facere! Temporibus aperiam velit, ipsum doloremque voluptatem, eius veniam porro assumenda praesentium fugit ipsam fuga perferendis? Obcaecati maiores explicabo facere! Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio, error facere! Temporibus aperiam velit, ipsum doloremque voluptatem, eius veniam porro assumenda praesentium fugit ipsam fuga perferendis? Obcaecati maiores explicabo facere!   Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio, error facere! Temporibus aperiam velit, ipsum doloremque voluptatem, eius veniam porro assumenda praesentium fugit ipsam fuga perferendis? Obcaecati maiores explicabo facere! Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio, error facere! Temporibus aperiam velit, ipsum doloremque voluptatem, eius veniam porro assumenda praesentium fugit ipsam fuga perferendis? Obcaecati maiores explicabo facere!',
      price: 1555000,
      imageUrl: [
        'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2FtZXJhfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
        'https://images.unsplash.com/photo-1596756003714-9a02b585a1a6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Y2Fub258ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
        'https://images.unsplash.com/photo-1603208235561-006b83924146?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGNhbm9ufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      ],
      amountView: 120,
      priceSale: 10,
    ),
    CategoryModel(
      id: 'c2',
      idUser: 'user1',
      title: 'Áo dài',
      description:
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio, error facere! Temporibus aperiam velit, ipsum doloremque voluptatem, eius veniam porro assumenda praesentium fugit ipsam fuga perferendis? Obcaecati maiores explicabo facere!',
      price: 60000,
      imageUrl: [
        'https://media.istockphoto.com/photos/portrait-of-a-vietnamese-girl-with-a-red-dress-in-the-lotus-hand-picture-id1187554319?k=20&m=1187554319&s=612x612&w=0&h=5l3PZl3ffXJZJbWZCkUNb5LwXRYrs4zogO3k_gdqTG8=',
      ],
      amountView: 120,
      priceSale: 10,
    ),
    CategoryModel(
      id: 'c3',
      idUser: 'user2',
      title:
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio, error facere! Temporibus aperiam velit, ipsum doloremque voluptatem',
      description:
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio, error facere! Temporibus aperiam velit, ipsum doloremque voluptatem, eius veniam porro assumenda praesentium fugit ipsam fuga perferendis? Obcaecati maiores explicabo facere!',
      price: 60000,
      imageUrl: [
        'https://media.istockphoto.com/photos/portrait-of-a-vietnamese-girl-with-a-red-dress-in-the-lotus-hand-picture-id1187554319?k=20&m=1187554319&s=612x612&w=0&h=5l3PZl3ffXJZJbWZCkUNb5LwXRYrs4zogO3k_gdqTG8=',
      ],
      amountView: 120,
    ),
  ];
  List<CategoryModel> get listCategories => _listCategories;

  CategoryModel findCategoryById(String id) {
    return _listCategories.firstWhere((category) => category.id == id);
  }

  List<CategoryModel> fetchAllCategoriesByUser(String? idUser) {
    return _listCategories
        .where((category) => category.idUser == idUser)
        .toList();
  }
}
