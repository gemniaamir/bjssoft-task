import 'package:bjssoft/features/profile/presentation/providers/profile_provider.dart';
import 'package:bjssoft/features/profile/presentation/widgets/header_card.dart';
import 'package:bjssoft/features/profile/presentation/widgets/info_view.dart';
import 'package:bjssoft/features/profile/presentation/widgets/large_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const LargeTitle(title: 'Profile Screen'),
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
                HeaderCard(controller: controller, isEditVisible: true,),
                //
                // Inforamtion View
                InfoView(controller: controller,)
              ],
            ),
          );
        }));
  }
}
