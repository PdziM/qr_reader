import 'package:flutter/material.dart';

class TitleAndSubtitle extends StatelessWidget {
  final String title;
  final String subTitle;

  const TitleAndSubtitle(
      {super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return ListTile(
      title: Text(
        title,
        style: textTheme.bodyMedium,
        maxLines: 1,
      ),
      subtitle: Text(
        subTitle,
        maxLines: 2,
        style: textTheme.titleLarge,
      ),
    );
  }
}
