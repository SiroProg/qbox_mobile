import 'package:flutter/material.dart';
import 'package:qbox_mobile/src/core/styles/app_colors.dart';
import 'package:qbox_mobile/src/core/utils/launch_url.dart';

class OpenFileBtn extends StatelessWidget {
  const OpenFileBtn({
    required this.url,
    required this.fileName,
    this.isMyMessage = false,
    required this.size,
    super.key,
  });

  final String url;
  final String fileName;
  final bool isMyMessage;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchURL(url),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isMyMessage ? AppColors.blue : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 250,
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.blue,
                  child: Icon(
                    Icons.file_copy,
                    color: AppColors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 160,
                      child: Text(
                        fileName.endsWith('.pdf') && fileName.length > 10
                            ? '${fileName.substring(0, 10)}.  .pdf'
                            : fileName,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: isMyMessage ? Colors.white : Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      '$size MB',
                      style: TextStyle(
                        fontSize: 12,
                        color: isMyMessage ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
