import 'package:bjssoft/features/profile/presentation/providers/profile_provider.dart';
import 'package:provider/provider.dart';

final List<ChangeNotifierProvider> providers = [
  // Profile Provider
  ChangeNotifierProvider<ProfileProvider>(
    create: (context) => ProfileProvider(),
  )
];
