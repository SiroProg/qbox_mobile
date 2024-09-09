import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbox_mobile/src/core/models/operator_call/static_config/new_model/reason_model.dart';
import 'package:qbox_mobile/src/core/styles/app_colors.dart';
import 'package:qbox_mobile/src/core/utils/logger.dart';
import 'package:qbox_mobile/src/features/providers/chat_provider.dart';

class EndCallBottomSheet extends StatefulWidget {
  const EndCallBottomSheet({super.key});

  @override
  State<EndCallBottomSheet> createState() => _EndCallBottomSheetState();
}

class _EndCallBottomSheetState extends State<EndCallBottomSheet> {
  late List<ReasonModel> reasons;
  List<ReasonModel> currentChildren = [];
  ReasonModel? currentParent;
  late ChatProvider provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<ChatProvider>(context, listen: false);
    reasons = provider.reasons.toSet().toList();
    info(reasons);
    currentChildren = reasons;
    currentParent = null;
  }

  void _onReasonSelected(ReasonModel reason) {
    if (reason.children != null && reason.children!.isNotEmpty) {
      setState(() {
        currentParent = reason;
        currentChildren = reason.children!;
      });
    } else {
      provider.endCallModel.taskTypeId = reason.id;
      provider.settaskTypeTitle(reason.title);

      Navigator.pop(context);
    }
  }

  void _goBack() {
    if (currentParent != null) {
      setState(() {
        currentParent = reasons.firstWhere(
          (r) => r.id == currentParent!.parentId,
          orElse: () => ReasonModel(
            id: -1,
            title: '',
            description: '',
            parentId: -1,
            childrenCount: 0,
          ),
        );
        currentChildren = currentParent?.children ?? reasons;
      });
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    String appBarTitle = currentParent?.title ?? 'Select Reason';

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              leading: currentParent != null
                  ? IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: _goBack,
                    )
                  : null,
              title: Text(appBarTitle),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            Expanded(
              child: ListView(
                children: currentChildren
                    .map((reason) {
                      return Material(
                        child: RadioItem(
                          onSellectedParent: () {
                            _onReasonSelected(reason);
                          },
                          title: SizedBox(
                            width: 280,
                            child: Text(
                              reason.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          leading: Radio<int>(
                            fillColor:
                                const WidgetStatePropertyAll(AppColors.blue),
                            value: reason.id,
                            groupValue: provider.endCallModel.taskTypeId,
                            onChanged: (value) {
                              if (value != null) {
                                _onReasonSelected(reason);
                              }
                            },
                          ),
                          trailing: reason.children != null &&
                                  reason.children!.isNotEmpty
                              ? const Icon(Icons.arrow_forward_ios, size: 18)
                              : null,
                          onTap: () => _onReasonSelected(reason),
                        ),
                      );
                    })
                    .toSet()
                    .toList(),
              ),
            ),
            if (currentChildren.isEmpty)
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Done'),
              ),
          ],
        ),
      ),
    );
  }
}

class RadioItem extends StatelessWidget {
  const RadioItem({
    required this.onTap,
    required this.leading,
    required this.trailing,
    required this.title,
    required this.onSellectedParent,
    super.key,
  });

  final VoidCallback onTap;
  final Widget? trailing;
  final Widget leading;
  final Widget title;
  final VoidCallback onSellectedParent;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      child: InkWell(
        onTap: onTap,
        splashColor: AppColors.blue.withOpacity(0.2),
        highlightColor: AppColors.blue.withOpacity(0.1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(onTap: onSellectedParent, child: leading),
                title,
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: trailing ?? const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}







// import 'package:qbox_mobile/src/features/pages/employess/widget/custom_button.dart';
// import 'package:qbox_mobile/src/features/providers/chat_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter/material.dart';

// class EndCallBottomSheet extends StatefulWidget {
//   const EndCallBottomSheet({super.key});

//   @override
//   State<EndCallBottomSheet> createState() => _EndCallBottomSheetState();
// }

// class _EndCallBottomSheetState extends State<EndCallBottomSheet> {
//   int? statusValue;

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ChatProvider>(
//       builder: (
//         BuildContext context,
//         ChatProvider provider,
//         Widget? child,
//       ) =>
//           SizedBox(
//         width: double.infinity,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Form of chat/call termination',
//                 style: TextStyle(
//                   fontWeight: FontWeight.w800,
//                   fontSize: 20,
//                 ),
//               ),
//               const Text('This action will terminate the chat'),
//               DropdownButton(
//                 hint: const Text('Reason for query'),
//                 value: statusValue,
//                 onChanged: (value) =>
//                     setState(() => statusValue = value as int),
//                 items: List.generate(
//                   provider.staticModel!.status.length,
//                   (context) => DropdownMenuItem(
//                     value: provider.staticModel!.status[context].id,
//                     child: Text(provider.staticModel!.status[context].title),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               DropdownButton(
//                 hint: const Text('Тип лица'),
//                 value: statusValue,
//                 onChanged: (value) =>
//                     setState(() => statusValue = value as int),
//                 items: List.generate(
//                   provider.staticModel!.entityType.length,
//                   (context) => DropdownMenuItem(
//                     value: provider.staticModel!.entityType[context].id,
//                     child:
//                         Text(provider.staticModel!.entityType[context].title),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               DropdownButton(
//                 hint: const Text('Есть ли вина общества'),
//                 value: statusValue,
//                 onChanged: (value) =>
//                     setState(() => statusValue = value as int),
//                 items: List.generate(
//                   provider.staticModel!.isThereAnyFaultOfSociety.length,
//                   (context) => DropdownMenuItem(
//                     value: provider
//                         .staticModel!.isThereAnyFaultOfSociety[context].id,
//                     child: Text(
//                       provider
//                           .staticModel!.isThereAnyFaultOfSociety[context].title,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               DropdownButton(
//                 hint: const Text('Вид обращения'),
//                 value: statusValue,
//                 onChanged: (value) =>
//                     setState(() => statusValue = value as int),
//                 items: List.generate(
//                   provider.staticModel!.typeOfQuery.length,
//                   (context) => DropdownMenuItem(
//                     value: provider.staticModel!.typeOfQuery[context].id,
//                     child:
//                         Text(provider.staticModel!.typeOfQuery[context].title),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 40),
//               CustomButton(
//                 onPressed: () {
//                   //   socketService.socket.emit('message', {
//                   //     'rtc': {'type': 'hangup'}
//                   //   });

//                   //   Navigator.pop(context);
//                   //   Navigator.pop(context);
//                   //   Navigator.pop(context);
//                 },
//                 text: 'End call',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
