import 'package:appflowy_board/appflowy_board.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:next_starter/presentation/pages/ticket/list/widgets/text_item.dart';
import 'package:next_starter/presentation/pages/ticket/list/widgets/ticket_card.dart';
import 'package:next_starter/presentation/routes/app_router.dart';
import 'package:next_starter/presentation/theme/theme.dart';
import 'package:next_starter/presentation/utils/constant.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class TicketListPage extends StatefulWidget {
  const TicketListPage({super.key});

  @override
  State<TicketListPage> createState() => _TicketListPageState();
}

class _TicketListPageState extends State<TicketListPage> {
  final AppFlowyBoardController controller = AppFlowyBoardController();
  final AppFlowyBoardScrollController boardScroll = AppFlowyBoardScrollController();

  DateTime now = DateTime.now();
  var start = DateTime(DateTime.now().year, DateTime.now().month, 1);
  var end = DateTime(DateTime.now().year, DateTime.now().month + 1, 0);

  final config = AppFlowyBoardConfig(
    groupBackgroundColor: HexColor.fromHex('#F7F8FC'),
    stretchGroupHeight: false,
  );

  @override
  void initState() {
    super.initState();

    controller.enableGroupDragging(false);

    for (var e in ticketStatus) {
      controller.addGroup(AppFlowyGroupData(
        id: e,
        name: e.toLowerCase().replaceAll("_", " ").capitalized,
        items: List.generate(10, (index) => TextItem("${index}_$e")),
      ));

      controller.getGroupController(e)!.enableDragging(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Ticket'),
        actions: [
          IconButton(
            onPressed: () async {
              await showDateRangePicker(
                context: context,
                initialDateRange: DateTimeRange(
                  start: start,
                  end: end,
                ),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
            },
            icon: const Icon(Icons.calendar_month),
          ),
        ],
      ),
      body: AppFlowyBoard(
        groupConstraints: const BoxConstraints(minWidth: 290, maxWidth: 300),
        config: const AppFlowyBoardConfig(
          groupPadding: EdgeInsets.zero,
          groupItemPadding: EdgeInsets.only(right: 8),
          headerPadding: EdgeInsets.symmetric(horizontal: 8),
          cardPadding: EdgeInsets.symmetric(vertical: 8),
          cornerRadius: 4,
        ),
        controller: controller,
        boardScrollController: boardScroll,
        cardBuilder: (BuildContext context, AppFlowyGroupData<dynamic> groupData, AppFlowyGroupItem item) {
          return AppFlowyGroupCard(
            margin: const EdgeInsets.symmetric(vertical: 8),
            key: ValueKey(item.id),
            child: InkWell(
              onTap: () {
                context.router.push(TicketDetailRoute(ticketId: 1));
              },
              child: TicketCard(groupData: groupData),
            ),
          );
        },
        headerBuilder: (context, columnData) {
          return AppFlowyGroupHeader(
            margin: const EdgeInsets.only(top: 8),
            title: Row(
              children: [
                const SizedBox(width: 8),
                Text(columnData.headerData.groupName,
                    style: CustomTextTheme.paragraph3.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: ColorTheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    '10',
                    style: CustomTextTheme.paragraph1.copyWith(color: ColorTheme.primary),
                  ),
                )
              ],
            ),
            height: 42,
          );
        },
      ),
    );
  }
}
