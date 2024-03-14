import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:next_starter/presentation/components/components.dart';
import 'package:reactive_forms/reactive_forms.dart';

@RoutePage()
class InquiryFormPage extends StatefulWidget {
  const InquiryFormPage({super.key});

  @override
  State<InquiryFormPage> createState() => _InquiryFormPageState();
}

class _InquiryFormPageState extends State<InquiryFormPage> {
  final form = fb.group({
    'title': ['', Validators.required],
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
      ),
      body: ReactiveFormBuilder(
        form: () => form,
        builder: (context, form, child) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const TextInput(
                  title: 'Title',
                  formControlName: 'title',
                  hint: 'hint',
                ),
                const SizedBox(height: 16),
                const TextInput(
                  title: 'Title',
                  formControlName: 'title',
                  hint: 'hint',
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
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(CupertinoIcons.camera, color: Colors.blue),
                        SizedBox(width: 8),
                        Text('Add Image', style: TextStyle(color: Colors.blue))
                      ],
                    ),
                  ),
                ),
                Expanded(child: Container()),
                ReactiveFormConsumer(
                  builder: (context, form, child) {
                    return PrimaryButton(
                      title: 'Submit',
                      isEnable: form.valid && image != null,
                      onTap: () {},
                    );
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
