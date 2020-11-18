import 'package:flutter_mobile_application/common/constants/theme_colors.dart';
import 'package:flutter_mobile_application/common/styles/background_style.dart';
import 'package:flutter_mobile_application/common/widgets/loading_indicator.dart';
import 'package:flutter_mobile_application/features/main/bloc/configuration_bloc.dart';
import 'package:flutter_mobile_application/features/main/bloc/index.dart';
import 'package:flutter_mobile_application/features/main/pages/account/ui/account_page.dart';
import 'package:flutter_mobile_application/features/main/pages/feed/ui/feed_page.dart';
import 'package:flutter_mobile_application/features/main/pages/home/ui/home_page.dart';
import 'package:flutter_mobile_application/features/main/pages/notification/ui/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  final List<Widget> _children = [
    HomePage(),
    FeedPage(),
    NotificationPage(),
    AccountPage(),
  ];
  void _setCurrentPage(int page) => setState(() {
        _controller.animateTo(page);
      });
  // For tracking the current the page and changing the style of the bottom bar icon
  int page = 0;

  @override
  void initState() {
    _controller = TabController(vsync: this, length: _children.length);
    _controller.addListener(() {
      setState(() {
        page = _controller.index;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConfigurationBloc, ConfigurationState>(
      listener: (context, state) {
        debugPrint("[MAIN PAGE] Receiving event: $state");
      },
      child: BlocBuilder<ConfigurationBloc, ConfigurationState>(
        builder: (context, state) => _getView(state),
      ),
    );
  }

  Widget _getView(ConfigurationState state) {
    if (state is ConfigurationEmptyState || state is ConfigurationLoadingState)
      return Container(
        decoration: BackgroundStyle.getGradientBackground(),
        child: LoadingIndicator(),
      );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      extendBody: true,
      body: TabBarView(
        controller: _controller,
        children: _children.map<Widget>(
          (page) {
            return SafeArea(
              top: false,
              bottom: false,
              child: Container(key: ObjectKey(page), child: page),
            );
          },
        ).toList(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: ThemeColors.green,
        onPressed: () {},
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: Container(
          height: 55,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _getBottomBarIcon(page, 0, Icons.home),
              _getBottomBarIcon(page, 1, Icons.all_inbox_rounded),
              const SizedBox(
                  width: 40), // Dummy child to adjust space in the bottom bar
              _getBottomBarIcon(page, 2, Icons.notifications),
              _getBottomBarIcon(page, 3, Icons.account_circle),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getBottomBarIcon(int currentPage, int page, IconData icon) {
    return Container(
      decoration: currentPage == page
          ? BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.blue, width: 5),
              ),
            )
          : null,
      child: IconButton(
        icon: Icon(icon),
        color:
            currentPage == page ? ThemeColors.accent : ThemeColors.primaryColor,
        onPressed: () {
          _setCurrentPage(page);
        },
      ),
    );
  }
}
