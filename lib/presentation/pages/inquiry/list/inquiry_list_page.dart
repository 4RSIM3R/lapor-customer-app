import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_starter/injection.dart';
import 'package:next_starter/presentation/components/input/dropdown_input.dart';
import 'package:next_starter/presentation/pages/inquiry/list/cubit/inquiry_list_cubit.dart';
import 'package:next_starter/presentation/pages/inquiry/list/widgets/inquiry_card.dart';
import 'package:next_starter/presentation/routes/app_router.dart';
import 'package:next_starter/presentation/utils/date.dart';
import 'package:reactive_forms/reactive_forms.dart';

@RoutePage()
class InquiryListPage extends StatefulWidget {
  const InquiryListPage({super.key});

  @override
  State<InquiryListPage> createState() => _InquiryListPageState();
}

class _InquiryListPageState extends State<InquiryListPage> {
  final form = fb.group({
    'status': ['NEED_REVIEW'],
  });

  String? status;
  var start = DateTime(DateTime.now().year, DateTime.now().month, 1);
  var end = DateTime(DateTime.now().year, DateTime.now().month + 1, 0);

  final bloc = locator<InquiryListCubit>();

  @override
  void initState() {
    super.initState();
    bloc.getAllInquiry(status: 'NEED_REVIEW');
    form.controls['status']!.valueChanges.listen((event) {
      status = event.toString();
      bloc.getAllInquiry(status: status, start: toMysqlDate(start), end: toMysqlDate(end));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => bloc),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Inquiry'),
          actions: [
            BlocBuilder<InquiryListCubit, InquiryListState>(
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

                      bloc.getAllInquiry(status: status, start: toMysqlDate(start), end: toMysqlDate(end));
                    },
                    icon: const Icon(Icons.calendar_month),
                  ),
                );
              },
            ),
          ],
        ),
        body: ReactiveFormBuilder(
          form: () => form,
          builder: (context, form, child) {
            return SingleChildScrollView(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: BlocBuilder<InquiryListCubit, InquiryListState>(
                builder: (context, state) {
                  return state.maybeMap(
                    orElse: () => const Center(child: CircularProgressIndicator.adaptive()),
                    success: (success) => Column(
                      children: [
                        const DropdownInput(
                          title: 'Status',
                          formControlName: 'status',
                          hint: 'Ticket Status',
                          items: [
                            // 'NEED_REVIEW', 'APPROVED', 'DISMISS'
                            {
                              'text': 'Need Review',
                              'value': 'NEED_REVIEW',
                            },
                            {
                              'text': 'Approved',
                              'value': 'APPROVED',
                            },
                            {
                              'text': 'Dismiss',
                              'value': 'DISMISS',
                            },
                          ],
                        ),
                        const SizedBox(height: 16),
                        ...success.payload.map((e) => InquiryCard(model: e)),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.router.push(const InquiryFormRoute()).then((value) {
              bloc.getAllInquiry(status: status, start: toMysqlDate(start), end: toMysqlDate(end));
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
