import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testqwe/new.dart';
import 'package:testqwe/request.dart';

import 'i18n/lang_res.dart';
import 'i18n/translation_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      translations: TranslationService(),
      // locale: window.locale,
      fallbackLocale: const Locale('zh', 'CN'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final pageController = PageController();

  // 默认首页
  int _currentIndex = 0;

  // 底部导航菜单
  List<Widget> items = [
    NavigationDestination(icon: const Icon(Icons.message_outlined), label: LangRes.chat),
    NavigationDestination(icon: const Icon(Icons.message_outlined), label: LangRes.chat),
  ];

  // 页面数组
  final List<Widget> pages = [
    const New(),
    const New(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              // 改变底部选中的导航栏
              _currentIndex = index;
            });
          },
          physics: const NeverScrollableScrollPhysics(), // 禁止滑动
          children: pages,
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentIndex,
          // 改变选中的菜单
          onDestinationSelected: (index) {
            pageController.jumpToPage(index);
          },
          destinations: items,
        ));
  }
}

