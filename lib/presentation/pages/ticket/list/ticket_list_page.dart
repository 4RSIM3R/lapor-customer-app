import 'package:appflowy_board/appflowy_board.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_starter/data/models/ticket/ticket_model.dart';
import 'package:next_starter/injection.dart';
import 'package:next_starter/presentation/pages/ticket/list/cubit/ticket_list_cubit.dart';
import 'package:next_starter/presentation/pages/ticket/list/widgets/text_item.dart';
import 'package:next_starter/presentation/pages/ticket/list/widgets/ticket_card.dart';
import 'package:next_starter/presentation/routes/app_router.dart';
import 'package:next_starter/presentation/theme/theme.dart';
import 'package:next_starter/presentation/utils/constant.dart';
import 'package:next_starter/presentation/utils/date.dart';
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

  final bloc = locator<TicketListCubit>();

  DateTime now = DateTime.now();
  var start = DateTime(DateTime.now().year, DateTime.now().month, 1);
  var end = DateTime(DateTime.now().year, DateTime.now().month + 1, 0);

  final config = const AppFlowyBoardConfig(
    groupBackgroundColor: Color(0xffF7F8FC),
    stretchGroupHeight: false,
  );

  @override
  void initState() {
    super.initState();
    bloc.get(start: toMysqlDate(start), end: toMysqlDate(end));
    controller.enableGroupDragging(false);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => bloc),
      ],
      child: BlocListener<TicketListCubit, TicketListState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            success: (success) {
              Map<String?, List<TicketModel>> grouped = success.groupBy((e) => e.status);

              for (var e in ticketStatus) {
                controller.addGroup(AppFlowyGroupData(
                  id: e,
                  name: e.toLowerCase().replaceAll("_", " ").capitalized,
                  items: (grouped[e] ?? []).map((e) => TextItem("${e.id}", e)).toList(),
                ));

                controller.getGroupController(e)!.enableDragging(false);
              }
            },
          );
        },
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text('Ticket'),
            actions: [
              BlocBuilder<TicketListCubit, TicketListState>(
                builder: (context, state) {
                  return state.maybeMap(
                    orElse: () => Container(),
                    success: (success) => IconButton(
                      onPressed: () async {
                        var date = await showDateRangePicker(
                          context: context,
                          initialDateRange: DateTimeRange(start: start, end: end),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );

                        setState(() {
                          start = date!.start;
                          end = date.end;
                        });

                        bloc.get(start: toMysqlDate(start), end: toMysqlDate(end));
                      },
                      icon: const Icon(Icons.calendar_month),
                    ),
                  );
                },
              ),
            ],
          ),
          body: BlocBuilder<TicketListCubit, TicketListState>(
            builder: (context, state) {
              return state.maybeMap(
                orElse: () => const Center(child: CircularProgressIndicator.adaptive()),
                failure: (failure) => Center(child: Text(failure.message)),
                success: (success) => AppFlowyBoard(
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
                    final textItem = item as TextItem;
                    return AppFlowyGroupCard(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      key: ValueKey(item.id),
                      child: InkWell(
                        onTap: () {
                          context.router.push(TicketDetailRoute(ticketId: 1));
                        },
                        child: TicketCard(groupData: groupData, model: textItem.model),
                      ),
                    );
                  },
                  headerBuilder: (context, columnData) {
                    return AppFlowyGroupHeader(
                      margin: const EdgeInsets.only(top: 8),
                      title: Row(
                        children: [
                          const SizedBox(width: 8),
                          Text(
                            columnData.headerData.groupName,
                            style: CustomTextTheme.paragraph3.copyWith(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: ColorTheme.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Text(
                              '${columnData.items.length}',
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
            },
          ),
        ),
      ),
    );
  }
}
