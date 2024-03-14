import 'package:appflowy_board/appflowy_board.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:next_starter/presentation/pages/ticket/list/widgets/text_item.dart';
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
        items: List.generate(10, (index) => TextItem("asas")),
      ));

      controller.getGroupController(e)!.enableDragging(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Ticket'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: AppFlowyBoard(
        groupConstraints: const BoxConstraints(minWidth: 275, maxWidth: 275),
        config: const AppFlowyBoardConfig(
          groupPadding: EdgeInsets.symmetric(horizontal: 4),
        ),
        controller: controller,
        boardScrollController: boardScroll,
        cardBuilder: (BuildContext context, AppFlowyGroupData<dynamic> groupData, AppFlowyGroupItem item) {
          return AppFlowyGroupCard(
            margin: const EdgeInsets.symmetric(vertical: 8),
            key: ValueKey(item.id),
            child: InkWell(
              onTap: () {
                context.router.push(const TicketDetailRoute());
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('TICKET/12-12-2024/1/KAI', style: CustomTextTheme.paragraph1),
                    const SizedBox(height: 8),
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                      style: CustomTextTheme.caption,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Chip(
                          backgroundColor: ColorTheme.primary,
                          side: BorderSide.none,
                          label: Text(
                            groupData.id,
                            style: CustomTextTheme.paragraph1.copyWith(color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Chip(
                          backgroundColor: ColorTheme.primary,
                          side: BorderSide.none,
                          label: Text(
                            'Blok Rokan Hulu Riau',
                            style: CustomTextTheme.paragraph1.copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        headerBuilder: (context, columnData) {
          return AppFlowyGroupHeader(
            title: Text(
              columnData.headerData.groupName,
              style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600),
            ),
            height: 50,
          );
        },
      ),
    );
  }
}
