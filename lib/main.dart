import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:untitled1/utils/image_picker_utils.dart';
import 'package:untitled1/view/profile_screen/profile_screen.dart';
import 'package:untitled1/view/profile_screen/profile_screen_bloc.dart';
import 'view/profile_screen/eidt_profile/edit_profile_screen_bloc.dart';

GetIt getIt = GetIt.instance;
void main() {
  getIt.registerLazySingleton<ImagePickerUtils>(() => ImagePickerUtils());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static ThemeMode? mode;
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ProfileScreenBloc()),
          BlocProvider(
              create: (context) => EditProfileBloc(imagePickerUtils: getIt())),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(),
          home: ProfileScreen(),
        ));
  }
}
