import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/global_bloc.dart';
import 'package:weather/utils/correct_size.dart';
import 'package:weather/widgets/mainbody_widget.dart';
import 'package:weather/widgets/dropdown_widget.dart';
import 'package:easy_localization/easy_localization.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text(
                'mainPage'.tr(),
                style: TextStyle(fontSize: getFontSizeByScreen(context, 21)),
              ),
              centerTitle: true,
              actions: [
                DropDownWidget(
                  dropDown: [
                    'hourly'.tr(),
                    'daily'.tr(),
                  ],
                ),
              ],
            ),
            body: MainBody());
      },
    );
  }
}
