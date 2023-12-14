import 'package:flutter/material.dart';

class floatingaction extends StatelessWidget {
  final Function()? onPerssed;

  const floatingaction({super.key, this.onPerssed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPerssed,
    );
  }
}
