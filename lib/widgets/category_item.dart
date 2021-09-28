import 'package:flutter/material.dart';
import '../models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  const CategoryItem({required this.category, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Container(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            bottom: 5,
            child: Container(
              padding: const EdgeInsets.only(top: 25),
              constraints: BoxConstraints(
                minHeight: 115,
              ),
              width: size.width * .45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: theme.cardColor,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      category.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: theme.textTheme.headline2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${category.price.toStringAsFixed(0)} đ',
                              style: theme.textTheme.bodyText1?.merge(
                                TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: category.priceSale != 0
                                      ? theme.errorColor
                                      : Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            category.priceSale != 0
                                ? Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 3, horizontal: 8),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: .7,
                                        color: theme.errorColor,
                                      ),
                                      color: theme.dialogBackgroundColor,
                                    ),
                                    child: Text(
                                      '-${category.priceSale}%',
                                      style: theme.textTheme.subtitle1?.merge(
                                        TextStyle(
                                          color: theme.errorColor,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox.shrink(),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.remove_red_eye,
                                  size: 18,
                                  color: Color(0xFF777777),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  '${category.amountView}',
                                  style: theme.textTheme.headline2?.merge(
                                    TextStyle(
                                      color: Color(0xFF777777),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(-1, 2.0),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Stack(
              children: [
                ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.2), BlendMode.srcATop),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      width: size.width * .42,
                      height: 180,
                      fit: BoxFit.cover,
                      image: NetworkImage(category.imageUrl[0]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
