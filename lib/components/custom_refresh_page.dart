import 'package:flutter/material.dart';

class CustomRefreshPage extends StatelessWidget {
  final Widget? child;
  final Future<void> Function()? onRefresh;
  const CustomRefreshPage({
    this.child,
    this.onRefresh,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: child!,
      onRefresh: () async {
        await onRefresh!();
      },
    );
  }
}
