import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_starter/injection.dart';
import 'package:next_starter/presentation/pages/profile/site/cubit/profile_site_cubit.dart';
import 'package:next_starter/presentation/pages/profile/site/widgets/site_card.dart';

@RoutePage()
class ProfileSitePage extends StatefulWidget {
  const ProfileSitePage({super.key});

  @override
  State<ProfileSitePage> createState() => _ProfileSitePageState();
}

class _ProfileSitePageState extends State<ProfileSitePage> {
  final bloc = locator<ProfileSiteCubit>();

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
          title: const Text('Your Sites'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<ProfileSiteCubit, ProfileSiteState>(
            builder: (context, state) {
              return state.maybeMap(
                orElse: () => const Center(child: CircularProgressIndicator.adaptive()),
                failure: (failure) => Center(child: Text(failure.message)),
                success: (success) => Column(
                  children: success.payload.map((e) => SiteCard(model: e)).toList()
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
