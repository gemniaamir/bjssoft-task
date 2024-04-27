import 'package:bjssoft/features/profile/presentation/providers/profile_provider.dart';
import 'package:bjssoft/features/profile/presentation/widgets/info_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/constants.dart';
import '../widgets/header_card.dart';
import '../widgets/large_title.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData.fallback(),
          title: const LargeTitle(title: 'Edit Profile Screen'),
          centerTitle: true,
          backgroundColor: Constants.backgroundColor,
        ),
        backgroundColor: Constants.backgroundColor,
        body: Consumer<ProfileProvider>(builder: (ctx, controller, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                //
                // Header Card
                HeaderCard(
                  controller: controller,
                  isEditVisible: false,
                ),
                //
                // Inforamtion Form
                InfoForm(
                  controller: controller,
                )
              ],
            ),
          );
        }));
  }
}
