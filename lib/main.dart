import 'package:qbox_mobile/src/features/services/db_service/db_service.dart';
import 'package:flutter/material.dart';
import 'src/core/app/app.dart';

// 222676

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBService.initialize();
  runApp(const App());
} 


// import 'package:flutter/material.dart';
// import 'package:qbox_mobile/src/core/models/operator_call/fields/card_item_model.dart';
// import 'package:qbox_mobile/src/features/services/operator_call_service/operator_api_service.dart';
// import 'package:qbox_mobile/src/core/models/operator_call/fields/fields_model.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Dynamic Form',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const DynamicFormScreen(),
//     );
//   }
// }

// class DynamicFormScreen extends StatefulWidget {
//   const DynamicFormScreen({super.key});

//   @override
//   State<DynamicFormScreen> createState() => _DynamicFormScreenState();
// }

// class _DynamicFormScreenState extends State<DynamicFormScreen> {
//   List<FormFieldModel> formFields = [];
//   Map<String, List<CardItemModel>> cardItemsMap = {};
//   Map<String, String?> selectedValues = {};

//   @override
//   void initState() {
//     super.initState();
//     _fetchFormFields();
//   }

//   Future<void> _fetchFormFields() async {
//     formFields = await OperatorService.getFieldsById(227);
//     setState(() {});
//   }

//   Future<void> _fetchCardItem(String key) async {
//     final items = await OperatorService.getCardItem(key);
//     setState(() {
//       cardItemsMap[key] = items;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Dynamic Form')),
//       body: formFields.isEmpty
//           ? const Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: formFields.length,
//               itemBuilder: (context, index) {
//                 final field = formFields[index];
//                 final controller =
//                     TextEditingController(text: field.autofill?.qualifier);

//                 if (field.type == 'text') {
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextField(
//                       controller: controller,
//                       decoration: InputDecoration(
//                         labelText: field.prompt ?? field.title,
//                         hintText: field.placeholder ?? '',
//                       ),
//                       keyboardType: field.type == 'number'
//                           ? TextInputType.number
//                           : TextInputType.text,
//                       onChanged: (value) {},
//                     ),
//                   );
//                 } else if (field.type == 'select') {
//                   if (field.configs?.key != null &&
//                       !cardItemsMap.containsKey(field.configs!.key!)) {
//                     _fetchCardItem(field.configs!.key!);
//                   }

//                   final items = cardItemsMap[field.configs?.key ?? ''] ?? [];

//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: DropdownButtonFormField<String>(
//                       value: selectedValues['${field.id}'],
//                       decoration: InputDecoration(
//                         labelText: field.prompt ?? field.title,
//                       ),
//                       items: items.map((CardItemModel item) {
//                         return DropdownMenuItem<String>(
//                           value: '${item.id}',
//                           child: Text(item.title),
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         setState(() {
//                           selectedValues['${field.id}'] = value;
//                         });
//                       },
//                     ),
//                   );
//                 }
//                 return Container();
//               },
//             ),
//     );
//   }
// }




// https://inqbox.q19.kz/api/forms/folders?limit=1000

// https://inqbox.q19.kz/api/forms/224/fields?limit=1000

// var a = {
//   "chat": "d68b9ba770364c8782e71daf06b0fb5e",
//   "nonresident_verification_status": 1,
//   "user_treatment_type": 1,
//   "user_post_mistake": 1,
//   "user_client_type": 1,
//   "comment": "hello",
//   "task_type_id": 51,
//   "client_sender": "user:id:12345"
// };

// import 'package:flutter/material.dart';

// int selectedReasonID = 0;

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Radio Example')),
//         body: const ReasonSelectionScreen(),
//       ),
//     );
//   }
// }

// class Reason {
//   final int id;
//   final String title;
//   final int parentId;
//   final int childrenCount;
//   final List<Reason>? children;

//   Reason({
//     required this.id,
//     required this.title,
//     required this.parentId,
//     required this.childrenCount,
//     this.children,
//   });
// }

// class ReasonSelectionScreen extends StatefulWidget {
//   const ReasonSelectionScreen({super.key});

//   @override
//   _ReasonSelectionScreenState createState() => _ReasonSelectionScreenState();
// }

// class _ReasonSelectionScreenState extends State<ReasonSelectionScreen> {
//   int? selectedReasonId;

//   final List<Reason> reasons = [
//     Reason(id: 5, title: "Child 2-1", parentId: 4, childrenCount: 0),
//     Reason(id: 1, title: "Parent 1", parentId: 0, childrenCount: 2, children: [
//       Reason(id: 2, title: "Child 1-1", parentId: 1, childrenCount: 0),
//       Reason(
//           id: 3,
//           title: "Child 1-2",
//           parentId: 1,
//           childrenCount: 1,
//           children: [
//             Reason(id: 4, title: "Child 1-3", parentId: 3, childrenCount: 0),
//           ]),
//     ]),
//     Reason(id: 4, title: "Parent 2", parentId: 0, childrenCount: 1, children: [
//       Reason(id: 5, title: "Child 2-1", parentId: 4, childrenCount: 0),
//     ]),
//   ];

//   void _onReasonSelected(Reason reason) {
//     if (reason.children != null && reason.children!.isNotEmpty) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => ReasonDetailScreen(reason: reason),
//         ),
//       );
//     } else {
//       setState(() {
//         selectedReasonId = reason.id;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: reasons.map((reason) {
//         return ListTile(
//           title: Text(reason.title),
//           leading: Radio<int>(
//             value: reason.id,
//             groupValue: selectedReasonId,
//             onChanged: (value) {
//               if (value != null) {
//                 _onReasonSelected(reason);
//               }
//             },
//           ),
//           trailing: reason.children != null && reason.children!.isNotEmpty
//               ? const Icon(Icons.arrow_forward_ios)
//               : null,
//           onTap: () => _onReasonSelected(reason),
//         );
//       }).toList(),
//     );
//   }
// }

// class ReasonDetailScreen extends StatelessWidget {
//   final Reason reason;

//   const ReasonDetailScreen({super.key, required this.reason});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Detail for ${reason.title}')),
//       body: ListView(
//         children: reason.children!.map((child) {
//           return ListTile(
//             title: Text(child.title),
//             leading: Radio<int>(
//               value: child.id,
//               groupValue: selectedReasonID,
//               onChanged: (value) {
//                 if (value != null) {
//                   selectedReasonID = value;
//                 }
//               },
//             ),
//             trailing: child.children != null && child.children!.isNotEmpty
//                 ? const Icon(Icons.arrow_forward_ios)
//                 : null,
//             onTap: () {
//               if (child.children != null && child.children!.isNotEmpty) {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ReasonDetailScreen(reason: child),
//                   ),
//                 );
//               } else {
//                 selectedReasonID = child.id;
//               }
//             },
//           );
//         }).toList(),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// int selectedReasonID = 0;

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Radio Example')),
//         body: const MainScreen(),
//       ),
//     );
//   }
// }

// class Reason {
//   final int id;
//   final String title;
//   final int parentId;
//   final int childrenCount;
//   final List<Reason>? children;

//   Reason({
//     required this.id,
//     required this.title,
//     required this.parentId,
//     required this.childrenCount,
//     this.children,
//   });
// }

// class MainScreen extends StatelessWidget {
//   const MainScreen({super.key});

//   void _showReasonBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return const ReasonBottomSheet();
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ElevatedButton(
//         onPressed: () => _showReasonBottomSheet(context),
//         child: const Text('Select Reason'),
//       ),
//     );
//   }
// }

// class ReasonBottomSheet extends StatefulWidget {
//   const ReasonBottomSheet({super.key});

//   @override
//   State<ReasonBottomSheet> createState() => _ReasonBottomSheetState();
// }

// class _ReasonBottomSheetState extends State<ReasonBottomSheet> {
//   List<Reason> reasons = [
//     Reason(id: 5, title: "Child 2-1", parentId: 4, childrenCount: 0),
//     Reason(
//       id: 123,
//       title: "Child 000000",
//       parentId: 5,
//       childrenCount: 2,
//       children: <Reason>[
//         Reason(id: 222, title: "Child 11111", parentId: 4, childrenCount: 0),
//       ],
//     ),
//     Reason(id: 1, title: "Parent 1", parentId: 0, childrenCount: 2, children: [
//       Reason(id: 2, title: "Child 1-1", parentId: 1, childrenCount: 0),
//       Reason(
//           id: 3,
//           title: "Child 1-2",
//           parentId: 1,
//           childrenCount: 1,
//           children: [
//             Reason(id: 4, title: "Child 1-3", parentId: 3, childrenCount: 0),
//           ]),
//     ]),
//     Reason(id: 4, title: "Parent 2", parentId: 0, childrenCount: 1, children: [
//       Reason(id: 5, title: "Child 2-1", parentId: 4, childrenCount: 0),
//     ]),
//   ];

//   List<Reason> currentChildren = [];
//   Reason? currentParent;

//   @override
//   void initState() {
//     super.initState();
//     currentChildren = reasons;
//     currentParent = null;
//   }

//   void _onReasonSelected(Reason reason) {
//     if (reason.children != null && reason.children!.isNotEmpty) {
//       setState(() {
//         currentParent = reason;
//         currentChildren = reason.children!;
//       });
//     } else {
//       setState(() {
//         selectedReasonID = reason.id;
//       });
//       Navigator.pop(context); // Close the bottom sheet
//     }
//   }

//   void _goBack() {
//     if (currentParent != null) {
//       setState(() {
//         currentParent = reasons.firstWhere(
//             (r) => r.id == currentParent!.parentId,
//             orElse: () =>
//                 Reason(id: 0, title: '', parentId: 0, childrenCount: 0));
//         currentChildren = currentParent?.children ?? reasons;
//       });
//     } else {
//       Navigator.pop(context); // Close the bottom sheet
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           if (currentParent != null)
//             AppBar(
//               leading: IconButton(
//                 icon: const Icon(Icons.arrow_back),
//                 onPressed: _goBack,
//               ),
//               title: Text(currentParent!.title),
//               backgroundColor: Colors.transparent,
//               elevation: 0,
//             ),
//           Expanded(
//             child: ListView(
//               children: currentChildren.map((reason) {
//                 return ListTile(
//                   title: Text(reason.title),
//                   leading: Radio<int>(
//                     value: reason.id,
//                     groupValue: selectedReasonID,
//                     onChanged: (value) {
//                       if (value != null) {
//                         _onReasonSelected(reason);
//                       }
//                     },
//                   ),
//                   trailing:
//                       reason.children != null && reason.children!.isNotEmpty
//                           ? const Icon(Icons.arrow_forward_ios)
//                           : null,
//                   onTap: () => _onReasonSelected(reason),
//                 );
//               }).toList(),
//             ),
//           ),
//           if (currentChildren.isEmpty)
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context); // Close the bottom sheet
//               },
//               child: const Text('Done'),
//             ),
//         ],
//       ),
//     );
//   }
// }
