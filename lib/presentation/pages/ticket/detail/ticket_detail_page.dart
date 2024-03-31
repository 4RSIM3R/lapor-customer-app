import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:next_starter/common/extensions/extensions.dart';
import 'package:next_starter/injection.dart';
import 'package:next_starter/presentation/pages/ticket/detail/cubit/ticket_detail_cubit.dart';
import 'package:next_starter/presentation/pages/ticket/detail/widgets/ticket_detail_card.dart';
import 'package:next_starter/presentation/theme/theme.dart';

@RoutePage()
class TicketDetailPage extends StatefulWidget {
  const TicketDetailPage({super.key, this.ticketId});

  final dynamic ticketId;

  @override
  State<TicketDetailPage> createState() => _TicketDetailPageState();
}

class _TicketDetailPageState extends State<TicketDetailPage> {
  int currentStep = 0;

  final bloc = locator<TicketDetailCubit>();

  @override
  void initState() {
    super.initState();
    bloc.get(id: widget.ticketId);
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
          title: const Text('Ticket Information'),
        ),
        body: BlocBuilder<TicketDetailCubit, TicketDetailState>(
          builder: (context, state) {
            return state.maybeMap(
              orElse: () => const Center(child: CircularProgressIndicator.adaptive()),
              failure: (failure) => Center(child: Text(failure.message)),
              success: (success) => Theme(
                data: ThemeData(
                  colorScheme: Theme.of(context).colorScheme.copyWith(primary: ColorTheme.primary),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Title', style: CustomTextTheme.paragraph1),
                      const SizedBox(height: 4),
                      Text(
                        '${success.payload.title}',
                        style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      Text('Number', style: CustomTextTheme.paragraph1),
                      const SizedBox(height: 4),
                      Text(
                        '${success.payload.number}',
                        style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      Text('Information', style: CustomTextTheme.paragraph1),
                      const SizedBox(height: 4),
                      Text(
                        '${success.payload.information}',
                        style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      Text('Site', style: CustomTextTheme.paragraph1),
                      const SizedBox(height: 4),
                      Text(
                        '${success.payload.site?.name}',
                        style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 16),
                      (success.payload.histories ?? []).isNotEmpty
                          ? Stepper(
                              type: StepperType.vertical,
                              currentStep: currentStep,
                              margin: const EdgeInsetsDirectional.only(start: 60.0),
                              controlsBuilder: (context, details) => Container(),
                              onStepTapped: (index) {
                                setState(() => currentStep = index);
                              },
                              steps: (success.payload.histories ?? [])
                                  .map(
                                    (e) => Step(
                                      title: Text(
                                        DateFormat('dd MMMMM yyyy').format(e.createdAt!),
                                        style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600),
                                      ),
                                      isActive: true,
                                      state: StepState.indexed,
                                      content: TicketDetailCard(history: e),
                                    ),
                                  )
                                  .toList(),
                            ).expand()
                          : Center(
                              child: Text(
                                'There is no ticket history',
                                style: CustomTextTheme.paragraph1,
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
