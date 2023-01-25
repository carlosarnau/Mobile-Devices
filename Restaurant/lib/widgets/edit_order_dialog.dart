import 'package:flutter/material.dart';

class EditOrderDialog extends StatefulWidget {
  final String oldOrder;
  const EditOrderDialog({super.key, required this.oldOrder});

  @override
  State<EditOrderDialog> createState() => _EditOrderDialogState();
}

class _EditOrderDialogState extends State<EditOrderDialog> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.text = widget.oldOrder;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(
        autofocus: true,
        controller: controller,
        minLines: 1,
        maxLines: 6,
      ),
      actions: [
        TextButton(
          child: const Text("Cancel"),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: const Text("Save"),
          onPressed: () => Navigator.of(context).pop(controller.text),
        ),
      ],
    );
  }
}
