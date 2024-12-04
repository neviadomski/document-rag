import "dart:math";
import 'package:flutter/material.dart';

int _selectedIndex = 0;

class PaneItem {
  const PaneItem(this.label, this.icon, this.selectedIcon);

  final String label;
  final Widget icon;
  final Widget selectedIcon;
}

// Menu pane
const List<PaneItem> leftPaneItems = <PaneItem>[
  PaneItem('Home', Icon(Icons.home_max_outlined), Icon(Icons.home_max)),
  PaneItem('Profile', Icon(Icons.person_2_outlined), Icon(Icons.person_2)),
  PaneItem('Settings', Icon(Icons.settings_outlined), Icon(Icons.settings)),
];

// Chat pane
const List<PaneItem> rightPaneItems = <PaneItem>[
  PaneItem('Chat', Icon(Icons.chat_outlined), Icon(Icons.chat)),
  PaneItem('Chat 2', Icon(Icons.chat_outlined), Icon(Icons.chat)),
  PaneItem('Chat 3', Icon(Icons.chat_outlined), Icon(Icons.chat)),
];

class LeftPaneDrawer extends StatefulWidget {
  const LeftPaneDrawer({super.key});

  @override
  State<LeftPaneDrawer> createState() => _LeftPaneDrawerState();
}

class _LeftPaneDrawerState extends State<LeftPaneDrawer> {
  void updateIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DrawerTheme(
      data: DrawerTheme.of(context).copyWith(
        width: max(MediaQuery.of(context).size.width / 2, 200),
      ),
      child: NavigationDrawer(
        onDestinationSelected: updateIndex,
        selectedIndex: _selectedIndex,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Divider(),
          ),
          ...leftPaneItems.map(
            (PaneItem destination) {
              return NavigationDrawerDestination(
                label: Text(destination.label),
                icon: destination.icon,
                selectedIcon: destination.selectedIcon,
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
        ],
      ),
    );
  }
}

class LeftPaneRail extends StatefulWidget {
  const LeftPaneRail({super.key});

  @override
  State<LeftPaneRail> createState() => _LeftPaneRailState();
}

class _LeftPaneRailState extends State<LeftPaneRail> {
  NavigationRailLabelType labelType = NavigationRailLabelType.all;

  void updateIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      onDestinationSelected: updateIndex,
      selectedIndex: _selectedIndex,
      labelType: labelType,
      minWidth: 120,
      backgroundColor: Colors.grey[200],
      indicatorColor: Colors.cyan[50],
      destinations: [
        ...leftPaneItems.map(
          (PaneItem destination) {
            return NavigationRailDestination(
              label: Text(destination.label),
              icon: destination.icon,
              selectedIcon: destination.selectedIcon,
              padding: const EdgeInsets.symmetric(vertical: 10),
            );
          },
        ),
      ],
    );
  }
}

class RightPaneDrawer extends StatefulWidget {
  const RightPaneDrawer({super.key});

  @override
  State<RightPaneDrawer> createState() => _RightPaneDrawerState();
}

class _RightPaneDrawerState extends State<RightPaneDrawer> {
  void updateIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DrawerTheme(
      data: DrawerTheme.of(context).copyWith(
        width: max(MediaQuery.of(context).size.width / 2, 200),
      ),
      child: NavigationDrawer(
        onDestinationSelected: updateIndex,
        selectedIndex: _selectedIndex,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Divider(),
          ),
          ...rightPaneItems.map(
            (PaneItem destination) {
              return NavigationDrawerDestination(
                label: Text(destination.label),
                icon: destination.icon,
                selectedIcon: destination.selectedIcon,
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
        ],
      ),
    );
  }
}

class RightPaneRail extends StatefulWidget {
  const RightPaneRail({super.key});

  @override
  State<RightPaneRail> createState() => _RightPaneRailState();
}

class _RightPaneRailState extends State<RightPaneRail> {
  NavigationRailLabelType labelType = NavigationRailLabelType.all;

  void updateIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      onDestinationSelected: updateIndex,
      selectedIndex: _selectedIndex,
      labelType: labelType,
      minWidth: 120,
      backgroundColor: Colors.grey[50],
      destinations: [
        ...rightPaneItems.map(
          (PaneItem destination) {
            return NavigationRailDestination(
              label: Text(destination.label),
              icon: destination.icon,
              selectedIcon: destination.selectedIcon,
              padding: const EdgeInsets.symmetric(vertical: 10),
            );
          },
        ),
      ],
    );
  }
}
