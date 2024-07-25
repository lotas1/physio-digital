import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Icon(Icons.filter_alt_outlined),
        ],
      ),
    );
  }
}
