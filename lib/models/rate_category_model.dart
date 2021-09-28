class RateModel {
  final String id;
  final String idCategory;
  final String nameUser;
  final String imageUrl;
  final DateTime date;
  final String comment;
  final countStar;

  RateModel({
    required this.id,
    required this.idCategory,
    required this.nameUser,
    required this.imageUrl,
    required this.date,
    required this.comment,
    required this.countStar,
  });
}

final List<RateModel> listRates = [
  RateModel(
    id: 'r1',
    idCategory: 'c1',
    nameUser: 'CR7',
    imageUrl:
        'https://images.unsplash.com/photo-1632624759937-7e6f17cadc9a?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzMnx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
    date: DateTime.now(),
    comment: 'San pham tot!',
    countStar: 5,
  ),
  RateModel(
    id: 'r2',
    idCategory: 'c2',
    nameUser: 'LM30',
    imageUrl:
        'https://images.unsplash.com/photo-1598121876884-f4573ed0b9f0?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fG1lc3NpJTIwZm9vdGJhbGx8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
    date: DateTime.now(),
    comment: 'San pham khong giong thuc te',
    countStar: 1,
  ),
];
