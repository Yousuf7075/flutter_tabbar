import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabbar/cubit/tab_bar_cubit.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  PageController pageController = PageController(initialPage: 0);

  static final List<Widget> _widgetOptions = <Widget>[
    const Center(
      child: Text(
        'Tips',
        style: TextStyle(fontSize: 16),
      ),
    ),
    const Center(
      child: Text(
        'Personal',
        style: TextStyle(fontSize: 16),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom TabBar'),
      ),
      body: BlocProvider(
        create: (context) => TabBarCubit(),
        child: BlocBuilder<TabBarCubit, String>(
          builder: (context, state) {
            return Column(
              children: [
                Container(
                  height: 48,
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6F9FF),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TabItem(
                          tabText: 'Tips',
                          activeTab: state,
                          pageController: pageController,
                        ),
                      ),
                      Expanded(
                        child: TabItem(
                          tabText: 'Personal',
                          activeTab: state,
                          pageController: pageController,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: pageController,
                    children: _widgetOptions,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  const TabItem(
      {Key? key,
      required this.tabText,
      required this.activeTab,
      required this.pageController})
      : super(key: key);
  final String tabText;
  final String activeTab;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<TabBarCubit>().onTabChanged(tabText);
        changeTab(tabText == 'Tips' ? 0 : 1);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 5000),
        decoration: tabText == activeTab
            ? BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5))
            : null,
        margin: const EdgeInsets.all(5),
        child: Center(
          child: Text(
            tabText,
            style: Theme.of(context).textTheme.button?.copyWith(
                color: tabText == activeTab
                    ? const Color(0xFF3161F1)
                    : const Color(0xFF7E94D7)),
          ),
        ),
      ),
    );
  }

  void changeTab(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
