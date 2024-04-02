import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_starter/data/models/site/site_model.dart';
import 'package:next_starter/injection.dart';
import 'package:next_starter/presentation/pages/profile/unit/cubit/profile_unit_cubit.dart';
import 'package:next_starter/presentation/pages/profile/unit/widgets/unit_card.dart';
import 'package:next_starter/presentation/theme/theme.dart';

@RoutePage()
class ProfileUnitPage extends StatefulWidget {
  const ProfileUnitPage({super.key, required this.site});

  final SiteModel site;

  @override
  State<ProfileUnitPage> createState() => _ProfileUnitPageState();
}

class _ProfileUnitPageState extends State<ProfileUnitPage> {
  final bloc = locator<ProfileUnitCubit>();

  @override
  void initState() {
    super.initState();
    bloc.get(id: widget.site.id!);
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
          title: Text('${widget.site.name} Units'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<ProfileUnitCubit, ProfileUnitState>(
            builder: (context, state) {
              return state.maybeMap(
                orElse: () => const Center(child: CircularProgressIndicator.adaptive()),
                failure: (failure) => Center(child: Text(failure.message)),
                success: (success) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Site', style: CustomTextTheme.paragraph1),
                    const SizedBox(height: 4),
                    Text(
                      '${widget.site.name}',
                      style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    Text('Address', style: CustomTextTheme.paragraph1),
                    const SizedBox(height: 4),
                    Text(
                      '${widget.site.address}',
                      style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 16),
                    (success.payload.units ?? []).isNotEmpty
                        ? Column(
                            children: (success.payload.units ?? [])
                                .map((e) => UnitCard(model: e, site: widget.site))
                                .toList(),
                          )
                        : const Center(
                            child: Text('Unit Data Not Available'),
                          )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
