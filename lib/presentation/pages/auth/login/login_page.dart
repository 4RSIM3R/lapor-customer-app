import 'package:adaptive_sizer/adaptive_sizer.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_starter/common/extensions/extensions.dart';
import 'package:next_starter/presentation/components/components.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../application/auth/auth_cubit.dart';
import '../../../../../injection.dart';
import '../../../routes/app_router.dart';
import '../../../theme/theme.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.isAddAccount = false});

  final bool isAddAccount;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final bloc = locator<AuthCubit>();

  final form = fb.group({
    'email': [
      '',
      Validators.required,
      Validators.email,
    ],
    'password': ['', Validators.required],
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: ReactiveFormBuilder(
        form: () => form,
        builder: (context, form, child) => BaseScaffold(
          bottomNavigationBar: Container(
            height: kBottomNavigationBarHeight * 2.5,
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  loading: () => context.showLoadingIndicator(),
                  error: (msg) {
                     context.hideLoading();
                    context.showSnackbar(title: "Error", message: msg, error: true);
                  },
                  success: (msg) {
                    context.hideLoading();
                    context.showSnackbar(title: "Sukses", message: msg);
                    context.route.replace(const HomeRoute());
                  },
                );
              },
              builder: (context, state) {
                return ReactiveFormConsumer(
                  builder: (context, formG, child) {
                    return Column(
                      children: [
                        PrimaryButton(
                          onTap: () {
                            bloc.login(formG.value);
                          },
                          title: "Masuk",
                          isEnable: formG.valid,
                        ),
                        18.verticalSpaceRadius,
                        Text.rich(
                          TextSpan(
                            text: "Tidak Bisa Login? ",
                            style: AppStyles.text14Px.copyWith(
                              color: ColorTheme.black,
                            ),
                            children: [
                              TextSpan(
                                text: "Hubungi Admin",
                                style: AppStyles.text14PxBold.copyWith(
                                  color: ColorTheme.primary,
                                ),
                                recognizer: TapGestureRecognizer()..onTap = () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    top: kBottomNavigationBarHeight,
                    bottom: 20,
                  ),
                  child: BaseLogo(isSmall: true),
                ),
                Text(
                  'Selamat datang di Lapor',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextTheme.paragraph3.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Harap masukkan email dan password dengan benar',
                  style: AppStyles.text14Px.copyWith(
                    color: ColorTheme.neutral[600],
                  ),
                ),
                50.verticalSpaceRadius,
                const TextInput(
                  title: "Email",
                  formControlName: "email",
                  hint: 'Masukkan Email anda',
                  textInputType: TextInputType.emailAddress,
                  prefix: Icon(Icons.person),
                  isRequiredText: true,
                ),
                6.verticalSpaceRadius,
                const PasswordInput(
                  formControlName: "password",
                  title: "Password",
                  hint: "Masukkan Password anda",
                  isRequiredText: true,
                  prefix: Icon(Icons.key),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
