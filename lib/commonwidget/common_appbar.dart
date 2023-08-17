import 'package:flutter/material.dart';
import 'package:task_app/commonwidget/custom_text.dart';

class CommonAppBarWidget extends StatelessWidget {
  const CommonAppBarWidget(
      {Key? key, required this.title, required this.searchOnTap})
      : super(key: key);

  final String? title;
  final VoidCallback? searchOnTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back)),
          CustomText(
            title: title!,
            fontsize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
          InkWell(
            onTap: searchOnTap,
            child: const Icon(Icons.search),
          )
        ],
      ),
    );
  }
}
