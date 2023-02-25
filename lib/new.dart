import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'i18n/lang_res.dart';

class New extends StatefulWidget {
  const New({Key? key}) : super(key: key);

  @override
  State<New> createState() => _NewState();
}

class _NewState extends State<New> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Get.updateLocale(Locale('zh', 'CN'));
          },
          child: Text('zh'),
        ),
        ElevatedButton(
          onPressed: () {
            Get.updateLocale(Locale('en', 'US'));
          },
          child: Text('en'),
        ),
        Text(LangRes.chat),
      ],
    ));
  }
}
