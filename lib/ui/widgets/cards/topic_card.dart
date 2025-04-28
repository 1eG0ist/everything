import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:everything/data/enums/topic_type_enum.dart';

import 'base_cards/glass_card.dart';

class TopicCard extends StatelessWidget {
  final String title;
  final String? description;
  final TopicType type;
  final DateTime createdAt;
  final DateTime updatedAt;
  final VoidCallback? onTap;

  const TopicCard({
    Key? key,
    required this.title,
    this.description,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateFormat = DateFormat('MMM dd, yyyy HH:mm');
    final isUpdatedRecently = DateTime.now().difference(updatedAt).inDays < 1;

    return GlassCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Заголовок с иконкой
          Row(
            spacing: 12,
            children: [
              Icon(
                type == TopicType.folder
                    ? Icons.folder_copy_outlined
                    : Icons.sticky_note_2_outlined,
                color: theme.colorScheme.primary,
                size: 24,
              ),
              Expanded(
                child: Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: theme.colorScheme.onSurface,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          // Описание (если есть)
          if (description != null && description!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              description!,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.7),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],

          // Даты создания и обновления
          const SizedBox(height: 12),
          Row(
            children: [
              Flexible(
                child: Text(
                  'Created: ${dateFormat.format(createdAt)}',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.5),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Spacer(),
              Flexible(
                child: Text(
                  'Updated: ${dateFormat.format(updatedAt)}',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: isUpdatedRecently
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onSurface.withOpacity(0.5),
                    fontWeight: isUpdatedRecently ? FontWeight.w600 : null,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}