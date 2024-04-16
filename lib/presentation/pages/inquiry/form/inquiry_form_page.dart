import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:next_starter/common/extensions/extensions.dart';
import 'package:next_starter/injection.dart';
import 'package:next_starter/presentation/components/components.dart';
import 'package:next_starter/presentation/pages/inquiry/form/cubit/inquiry_form_cubit.dart';
import 'package:next_starter/presentation/pages/profile/site/cubit/profile_site_cubit.dart';
import 'package:next_starter/presentation/theme/theme.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:swipe_image_gallery/swipe_image_gallery.dart';

@RoutePage()
class InquiryFormPage extends StatefulWidget {
  const InquiryFormPage({super.key});

  @override
  State<InquiryFormPage> createState() => _InquiryFormPageState();
}

class _InquiryFormPageState extends State<InquiryFormPage> {
  final bloc = locator<InquiryFormCubit>();
  final site = locator<ProfileSiteCubit>();

  final form = fb.group({
    'title': ['', Validators.required],
    'site_id': FormControl<int>(validators: [Validators.required]),
    // 'unit_id': FormControl<int>(validators: [Validators.required]),
    'information': ['', Validators.required],
  });

  final picker = ImagePicker();

  List<XFile?> images = [];

  @override
  void initState() {
    super.initState();
    site.get();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => bloc),
        BlocProvider(create: (_) => site),
      ],
      child: BlocListener<InquiryFormCubit, InquiryFormState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            loading: () => context.showLoadingIndicator(),
            failure: (msg) {
              context.hideLoading();
              context.showSnackbar(title: "Error", message: msg, error: true);
            },
            success: () {
              context.hideLoading();
              context.showSnackbar(title: "Sukses", message: "Success Submit Inquiry");
              context.route.maybePop();
            },
          );
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Send Inquiry'),
            backgroundColor: Colors.white,
          ),
          body: ReactiveFormBuilder(
            form: () => form,
            builder: (context, form, child) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const TextInput(
                      title: 'Title',
                      formControlName: 'title',
                      hint: 'hint',
                    ),
                    BlocBuilder<ProfileSiteCubit, ProfileSiteState>(
                      builder: (context, state) {
                        return state.maybeMap(
                          orElse: () => Container(),
                          failure: (failure) => Text(failure.message),
                          success: (success) => Column(
                            children: [
                              const SizedBox(height: 8),
                              DropdownInput(
                                title: 'Site',
                                formControlName: 'site_id',
                                hint: 'Choose Site',
                                items: success.payload.map((e) => {'text': e.name, 'value': e.id}).toList(),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                    const TextInput(
                      title: 'Information',
                      formControlName: 'information',
                      hint: 'Describe your problem here',
                      maxLines: 5,
                    ),
                    const SizedBox(height: 16),
                    InkWell(
                      onTap: () async {
                        var file = await picker.pickImage(source: ImageSource.camera, imageQuality: 40);
                        if (file != null) {
                          setState(() => images.add(file));
                        }
                      },
                      child: Container(
                        height: 45,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorTheme.primary),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(CupertinoIcons.camera, color: ColorTheme.primary),
                            SizedBox(width: 8),
                            Text('Add Image', style: TextStyle(color: ColorTheme.primary))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    images.isNotEmpty
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Attachment Image',
                                style: CustomTextTheme.paragraph1,
                              ),
                              InkWell(
                                onTap: () {
                                  var assets = images.map((e) => Image(image: FileImage(File(e!.path)))).toList();
                                  SwipeImageGallery(context: context, children: assets).show();
                                },
                                child: Text(
                                  'See All',
                                  style: CustomTextTheme.paragraph1.copyWith(color: Colors.blue),
                                ),
                              )
                            ],
                          )
                        : Container(),
                    SizedBox(
                      height: images.isNotEmpty ? 100 : 0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: images
                            .map(
                              (e) => InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  margin: const EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                                  child: Image.file(
                                    File(e!.path),
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ReactiveFormBuilder(
              form: () => form,
              builder: (context, form, child) {
                return ReactiveFormConsumer(
                  builder: (context, form, child) {
                    return PrimaryButton(
                      title: 'Submit',
                      isEnable: form.valid && images.isNotEmpty,
                      onTap: () {
                        bloc.submitInquiry(payload: form.value, image: images);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
