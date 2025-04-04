import 'package:desygn_system/components/button_navigation_bar/button_navigation_bar_view_model.dart';
import 'package:flutter/material.dart';

class BottomNavigationBar extends StatefulWidget {
  final BottomBarViewModel viewModel;

  const BottomNavigationBar._(this.viewModel);

  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();

  static Widget instantiate({required BottomBarViewModel viewModel}) {
    return BottomNavigationBar._(viewModel);
  }
}

class _BottomNavigationBarState extends State<BottomNavigationBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(widget.viewModel.items.length, (index) {
          final item = widget.viewModel.items[index];
          final isSelected = index == widget.viewModel.selectedIndex;

          return GestureDetector(
            onTap: () {
              setState(() {
                widget.viewModel.selectedIndex = index;
                widget.viewModel.onItemSelected(index);
              });
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  item.icon,
                  color: isSelected ? Colors.yellow : Colors.black,
                ),
                const SizedBox(height: 4),
                Text(
                  item.label,
                  style: TextStyle(
                    fontSize: _getFontSize(widget.viewModel.size),
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                    color: isSelected ? Colors.yellow : Colors.black,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  double _getFontSize(BottomBarOptionSize size) {
    switch (size) {
      case BottomBarOptionSize.large:
        return 20;
      case BottomBarOptionSize.medium:
        return 16;
      case BottomBarOptionSize.small:
        return 12;
      default:
        return 16;
    }
  }
}

class BottomNavigationBarController {
  final BottomBarViewModel viewModel;

  BottomNavigationBarController(this.viewModel);
}
