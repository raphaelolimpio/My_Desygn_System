import 'package:desygn_system/components/list_buttons/list_buttons_view_model.dart';
import 'package:flutter/material.dart';

class ListButtons extends StatelessWidget {
  final List<ListButtonsViewMode> options;

  const ListButtons({super.key, required this.options});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ListButtonsViewMode>(
      icon: const Icon(Icons.more_vert),
      itemBuilder: (BuildContext context) {
        return options.map((ListButtonsViewMode option) {
          return PopupMenuItem<ListButtonsViewMode>(
            value: option,
            child: Text(option.title),
          );
        }).toList();
      },
      onSelected: (ListButtonsViewMode option) {
        option.onPressed();
      },
    );
  }
}
