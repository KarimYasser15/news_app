import 'package:flutter/material.dart';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/strings_manager.dart';
import 'package:news_app/data_model/category.dart';
import 'package:news_app/presentation/screens/home/drawer/home_drawer.dart';
import 'package:news_app/presentation/screens/home/tabs/categories_tab/categories.dart';
import 'package:news_app/presentation/screens/home/tabs/category_details/category_details.dart';
import 'package:news_app/presentation/screens/home/tabs/settings_tab/settings.dart';
import 'package:news_app/presentation/screens/news_search/news_search_delegate.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      selectedTab = CategoryDetails(
        category: categorySelected,
      );
      appBarTitle = categorySelected.title;
      searchButton = IconButton(
        icon: const Icon(Icons.search),
        onPressed: () => print("Search"),
        //Navigator.pushNamed(context,RoutesManager.search),
      );
      appBarSearch = searchButton;
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
            selectedTab = const Settings();
            appBarTitle = StringsManager.settings;
            appBarSearch = Container();
            break;
          }
      }
    });
    Navigator.pop(context);
  }
}
