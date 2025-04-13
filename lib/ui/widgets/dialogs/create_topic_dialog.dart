import 'package:flutter/material.dart';
import 'package:everything/data/enums/topic_type_enum.dart';

class CreateTopicDialog extends StatefulWidget {
  final Function(String title, String? description, TopicType type) onCreate;

  const CreateTopicDialog({
    super.key,
    required this.onCreate,
  });

  @override
  State<CreateTopicDialog> createState() => _CreateTopicDialogState();
}

class _CreateTopicDialogState extends State<CreateTopicDialog> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  TopicType _selectedType = TopicType.file;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Добавить заметку'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              labelText: 'Название',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              labelText: 'Описание (необязательно)',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Text('Тип:'),
              const SizedBox(width: 16),
              DropdownButton<TopicType>(
                value: _selectedType,
                items: TopicType.values.map((type) {
                  return DropdownMenuItem<TopicType>(
                    value: type,
                    child: Text(
                      type == TopicType.folder ? 'Папка' : 'Файл',
                    ),
                  );
                }).toList(),
                onChanged: (type) {
                  if (type != null) {
                    setState(() {
                      _selectedType = type;
                    });
                  }
                },
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Отмена'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_titleController.text.trim().isEmpty) return;

            widget.onCreate(
              _titleController.text.trim(),
              _descriptionController.text.trim().isEmpty
                  ? null
                  : _descriptionController.text.trim(),
              _selectedType,
            );
            Navigator.pop(context);
          },
          child: const Text('Создать'),
        ),
      ],
    );
  }
}