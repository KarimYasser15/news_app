import 'package:flutter/material.dart';
import 'package:news_app/config/assets_manager.dart';
import 'package:news_app/config/colors_manager.dart';
import 'package:news_app/config/strings_manager.dart';
import 'package:news_app/features/categories/data_model/category.dart';
import 'package:news_app/features/home/drawer/home_drawer.dart';
import 'package:news_app/features/categories/categories.dart';
import 'package:news_app/features/news/news_tab.dart';
import 'package:news_app/features/search/news_search_delegate.dart';
import 'package:news_app/features/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    selectedTab = Categories(onCategoryClicked: onCategoryClicked);
  }

  late Widget selectedTab;
  String appBarTitle = StringsManager.newsApp;
  late Widget searchButton;
  Widget appBarSearch = Container();
  Widget appBarTitle2 = const Text(StringsManager.newsApp);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorsManager.white,
        image: DecorationImage(
            image: AssetImage(AssetsManager.homeBackground), fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: appBarTitle2,
          actions: [
            IconButton(
                onPressed: () => showSearch(
                    context: context, delegate: NewsSearchDelegate()),
                icon: const Icon(Icons.search))
          ],
        ),
        drawer: HomeDrawer(
          onDrawerClickedItem: onDrawerItemClicked,
        ),
        body: selectedTab,
      ),
    );
  }

  onCategoryClicked(CategoryDataModel categorySelected) {
    setState(() {
      selectedTab = NewsTab(
        category: categorySelected,
      );
      appBarTitle = categorySelected.title;
    });
  }

  void onDrawerItemClicked(DrawerItem itemSelected) {
    setState(() {
      switch (itemSelected) {
        case DrawerItem.categories:
          {
            selectedTab = Categories(
              onCategoryClicked: onCategoryClicked,
            );
            appBarTitle = StringsManager.newsApp;
            appBarSearch = Container();
            break;
          }
        case DrawerItem.settings:
          {
            selectedTab = const SettingsTab();
            appBarTitle = StringsManager.settings;
            appBarSearch = Container();
            break;
          }
      }
    });
    Navigator.pop(context);
  }
}
