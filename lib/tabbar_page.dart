import 'package:flutter/material.dart';

class TabBarPage extends StatelessWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom TabBar'),
      ),
      body: Column(
        children: [
          Container(
            height: 48,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFF6F9FF),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: TabItem(tabText: 'Tips', isActive: true),
                ),
                Expanded(
                  child: TabItem(
                    tabText: 'Personal',
                    isActive: false,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  const TabItem({Key? key, required this.tabText, required this.isActive})
      : super(key: key);
  final String tabText;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      decoration: isActive
          ? BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5))
          : null,
      margin: const EdgeInsets.all(5),
      child: Center(
        child: Text(
          tabText,
          style: Theme.of(context).textTheme.button?.copyWith(
              color:
                  isActive ? const Color(0xFF3161F1) : const Color(0xFF7E94D7)),
        ),
      ),
    );
  }
}
