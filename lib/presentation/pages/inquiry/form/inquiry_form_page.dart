import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:next_starter/injection.dart';
import 'package:next_starter/presentation/components/components.dart';
import 'package:next_starter/presentation/pages/inquiry/form/cubit/inquiry_form_cubit.dart';
import 'package:next_starter/presentation/theme/theme.dart';
import 'package:reactive_forms/reactive_forms.dart';

@RoutePage()
class InquiryFormPage extends StatefulWidget {
  const InquiryFormPage({super.key});

  @override
  State<InquiryFormPage> createState() => _InquiryFormPageState();
}

class _InquiryFormPageState extends State<InquiryFormPage> {

  final bloc = locator<InquiryFormCubit>();

  final form = fb.group({
    'title': ['', Validators.required],
    'site_id': ['', Validators.required],
    'unit_id': ['', Validators.required],
    'information': ['', Validators.required],
  });

  final picker = ImagePicker();

  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                const SizedBox(height: 8),
                const DropdownInput(
                  title: 'Site',
                  formControlName: 'site_id',
                  hint: 'Choose Site',
                  items: [
                    {'text': 'Blok Rokan Hulu', 'value': '1'}
                  ],
                ),
                const SizedBox(height: 8),
                const DropdownInput(
                  title: 'Unit',
                  formControlName: 'unit_id',
                  hint: 'Choose Unit',
                  items: [
                    {'text': 'UNIT_123', 'value': '2'}
                  ],
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
                    var file = await picker.pickImage(source: ImageSource.camera, imageQuality: 25);
                    setState(() => image = file);
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
                    isEnable: form.valid && image != null,
                    onTap: () {},
                  );
                },
              );
            }),
      ),
    );
  }
}
