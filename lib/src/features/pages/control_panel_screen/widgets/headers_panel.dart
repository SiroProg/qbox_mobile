import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/models/control_panel_models/status_model.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../providers/control_panel_provider.dart';
import '../../../services/socket_service.dart';

//
// class HeadersPanel extends StatefulWidget {
//   const HeadersPanel({super.key});
//
//   @override
//   State<HeadersPanel> createState() => _HeadersPanelState();
// }
//
// class _HeadersPanelState extends State<HeadersPanel> {
//   @override
//   Widget build(BuildContext context) {
//     final panelProvider = Provider.of<ControlPanelProvider>(context);
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               SizedBox(
//                 width: 90,
//                 height: 90,
//                 child: DecoratedBox(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10),
//                     ),
//                     image: panelProvider.employee.photo != null
//                         ? DecorationImage(
//                             fit: BoxFit.cover,
//                             image: NetworkImage(
//                               ApiConstants.baseUrl +
//                                   panelProvider.employee.photo!,
//                             ),
//                           )
//                         : null,
//                   ),
//                   child: panelProvider.employee.photo == null
//                       ? Center(
//                           child: Text(
//                             "${panelProvider.employee.firstName[0] + panelProvider.employee.lastName[0]}",
//                             style: TextStyle(color: AppColors.black10),
//                           ),
//                         )
//                       : null,
//                 ),
//               ),
//               const SizedBox(width: 20),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     "${panelProvider.employee.firstName ?? ""} ${panelProvider.employee.lastName ?? ""}",
//                     style: const TextStyle(
//                       color: AppColors.black,
//                       fontSize: 20,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   Text(
//                     panelProvider.employee.role.title ?? "",
//                     style: const TextStyle(
//                       color: AppColors.black,
//                       fontSize: 18,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   Row(
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           showBottomSheet(
//                             context: context,
//                             builder: (context) => CupertinoActionSheet(
//                               title: Text('Выберите статус'),
//                               actions: List.generate(
//                                   panelProvider.statuses.where((index) {
//                                     return index.details.show;
//                                   }).length, (index) {
//                                 final Status status =
//                                     panelProvider.statuses.where((index) {
//                                   return index.details.show;
//                                 }).toList()[index];
//
//                                 return CupertinoActionSheetAction(
//                                   onPressed: () {
//                                     if (status.title !=
//                                         panelProvider.initialStatus!.title) {
//                                       panelProvider.changeStatus(status);
//                                       panelProvider.startStopwatch();
//
//                                       socketService
//                                           .updateOperatorStatus(status.key);
//                                     }
//
//                                     Navigator.pop(context);
//                                   },
//                                   child: Row(
//                                     children: [
//                                       SizedBox(
//                                         width: 20,
//                                         height: 20,
//                                         child: SvgPicture.network(
//                                           fit: BoxFit.cover,
//                                           ApiConstants.baseUrl + status.icon!,
//                                         ),
//                                       ),
//                                       const SizedBox(width: 10),
//                                       Text(
//                                         status.title,
//                                         style: const TextStyle(
//                                           color: AppColors.black,
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 );
//                               }),
//                               cancelButton: CupertinoActionSheetAction(
//                                 onPressed: () {
//                                   panelProvider.stopStopwatch();
//                                   Navigator.pop(context);
//                                 },
//                                 child: Text('Отмена'),
//                               ),
//                             ),
//                           );
//                         },
//                         child: SizedBox(
//                           child: DecoratedBox(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(10),
//                               ),
//                               border: Border.all(
//                                 color: AppColors.black10,
//                                 width: 1,
//                               ),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 vertical: 5,
//                                 horizontal: 20,
//                               ),
//                               child: Row(
//                                 children: [
//                                   SizedBox(
//                                       width: 20,
//                                       height: 20,
//                                       child: SvgPicture.network(
//                                         fit: BoxFit.cover,
//                                         ApiConstants.baseUrl +
//                                             panelProvider.initialStatus!.icon!,
//                                       )),
//                                   const SizedBox(width: 5),
//                                   SizedBox(
//                                     width: 100,
//                                     child: Text(
//                                       panelProvider.initialStatus!.title,
//                                       textAlign: TextAlign.center,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: const TextStyle(
//                                         overflow: TextOverflow.ellipsis,
//                                         color: AppColors.black,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 5),
//                       SizedBox(
//                         child: DecoratedBox(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(10),
//                             ),
//                             border: Border.all(
//                               color: AppColors.black10,
//                               width: 1,
//                             ),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(
//                               vertical: 5,
//                               horizontal: 20,
//                             ),
//                             child: Center(
//                               child: Text(
//                                 panelProvider.elapsedTime,
//                                 style: const TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                 ],
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               Expanded(
//                 child: SizedBox(
//                   height: 40,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       showBottomSheet(
//                         context: context,
//                         builder: (context) => CupertinoActionSheet(
//                           cancelButton: CupertinoActionSheetAction(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             child: Text(
//                               'Отмена',
//                               style: TextStyle(
//                                   color: AppColors.black, fontSize: 16),
//                             ),
//                           ),
//                           title: Text(
//                             'Выберите оператора',
//                             style:
//                                 TextStyle(color: AppColors.black, fontSize: 16),
//                           ),
//                           actions: [
//                             ...List.generate(panelProvider.callOperators.length,
//                                 (index) {
//                               final CallOperatorModel callOperator =
//                                   panelProvider.callOperators[index];
//                               return CupertinoActionSheetAction(
//                                 onPressed: () {
//                                   Navigator.pop(context);
//                                 },
//                                 child: Text(
//                                   callOperator.fullName,
//                                   style: const TextStyle(
//                                     color: AppColors.black,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               );
//                             }),
//                             ...List.generate(
//                                 panelProvider.callTeams.video!.length, (index) {
//                               final callTeam =
//                                   panelProvider.callTeams.video![index];
//                               return CupertinoActionSheetAction(
//                                 onPressed: () {
//                                   Navigator.pop(context);
//                                 },
//                                 child: Text(
//                                   callTeam.title,
//                                   style: const TextStyle(
//                                     color: AppColors.black,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               );
//                             })
//                           ],
//                         ),
//                       );
//                     },
//                     child: Text(
//                       'Перенаправить',
//                       style: TextStyle(color: AppColors.black),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.white,
//                       shape: ContinuousRectangleBorder(
//                         side: BorderSide(color: AppColors.black10, width: 1),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 10),
//               SizedBox(
//                 height: 40,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColors.white,
//                     shape: ContinuousRectangleBorder(
//                       side: BorderSide(color: AppColors.black10, width: 1),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   onPressed: () {
//                     () async {
//                       panelProvider.callOperators =
//                           await ControlPanelService().fetchOperators();
//                       panelProvider.callTeams =
//                           await ControlPanelService().fetchCallTeams();
//                       print('Обновлено');
//                     }();
//                   },
//                   child: Icon(
//                     Icons.update,
//                     color: AppColors.black,
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//

class HeadersPanel extends StatefulWidget {
  const HeadersPanel({super.key});

  @override
  State<HeadersPanel> createState() => _HeadersPanelState();
}

class _HeadersPanelState extends State<HeadersPanel> {
  @override
  Widget build(BuildContext context) {
    final panelProvider = Provider.of<ControlPanelProvider>(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            // Employee photo
            SizedBox(
              width: 80,
              height: 80,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  image: panelProvider.employee.photo != null
                      ? DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            ApiConstants.baseUrl +
                                panelProvider.employee.photo!,
                          ),
                        )
                      : null,
                ),
                child: panelProvider.employee.photo == null
                    ? Center(
                        child: Text(
                          panelProvider.employee.firstName[0] +
                              panelProvider.employee.lastName[0],
                          style: const TextStyle(color: AppColors.black10),
                        ),
                      )
                    : null,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${panelProvider.employee.firstName} ${panelProvider.employee.lastName}",
                  style: const TextStyle(
                    color: AppColors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  panelProvider.employee.role.title ?? "",
                  style: const TextStyle(
                    color: AppColors.black10,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showBottomSheet(
                          context: context,
                          builder: (context) => CupertinoActionSheet(
                            title: const Text('Выберите статус'),
                            actions: List.generate(
                                panelProvider.statuses.where((index) {
                                  return index.details.show;
                                }).length, (index) {
                              final Status status =
                                  panelProvider.statuses.where((index) {
                                return index.details.show;
                              }).toList()[index];

                              return CupertinoActionSheetAction(
                                onPressed: () {
                                  if (status.title !=
                                      panelProvider.initialStatus!.title) {
                                    panelProvider.changeStatus(status);
                                    panelProvider.startStopwatch();

                                    socketService
                                        .updateOperatorStatus(status.key);
                                  }

                                  Navigator.pop(context);
                                },
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: SvgPicture.network(
                                        fit: BoxFit.cover,
                                        ApiConstants.baseUrl + status.icon!,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      status.title,
                                      style: const TextStyle(
                                        color: AppColors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                            cancelButton: CupertinoActionSheetAction(
                              onPressed: () {
                                panelProvider.stopStopwatch();
                                Navigator.pop(context);
                              },
                              child: const Text('Отмена'),
                            ),
                          ),
                        );
                      },
                      child: SizedBox(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            border: Border.all(
                              color: AppColors.black10,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: SvgPicture.network(
                                    fit: BoxFit.cover,
                                    ApiConstants.baseUrl +
                                        panelProvider.initialStatus!.icon!,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                SizedBox(
                                  child: Text(
                                    panelProvider.initialStatus!.title,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: AppColors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    SizedBox(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border: Border.all(
                            color: AppColors.black10,
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 20,
                          ),
                          child: Center(
                            child: Text(
                              panelProvider.elapsedTime,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HeadersPanel1 extends StatefulWidget {
  const HeadersPanel1({super.key});

  @override
  State<HeadersPanel1> createState() => _HeadersPanel1State();
}

class _HeadersPanel1State extends State<HeadersPanel1> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
    );
  }
}
