import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/global_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:weather/utils/correct_size.dart';

class DropDownWidget extends StatefulWidget {
  final List<String> dropDown;
  const DropDownWidget({required this.dropDown});

  @override
  State<DropDownWidget> createState() =>
      _DropDownWidgetState(dropDown: dropDown);
}

class _DropDownWidgetState extends State<DropDownWidget> {
  List<String> dropDown = [];
  _DropDownWidgetState({required this.dropDown});
  late String dropdownValue = dropDown[0];

  @override
  Widget build(BuildContext context) {
    GlobalBloc provider = BlocProvider.of<GlobalBloc>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 5, top: 6.0),
      child: DropdownButton<String>(
        value: dropdownValue,
        iconSize: 24,
        elevation: 6,
        iconDisabledColor: Colors.white,
        iconEnabledColor: Colors.white,
        dropdownColor: Colors.blue,
        style: TextStyle(
          color: Colors.black,
        ),
        underline: Container(
          height: 0,
          color: Colors.white,
        ),
        onChanged: (String? newValue) {
          setState(() {
            provider.add(ChangePeriodEvent(isDaily: newValue != "hourly".tr()));
            dropdownValue = newValue!;
          });
        },
        items: dropDown
            .map<DropdownMenuItem<String>>(
              (String value) => DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                      fontSize: getFontSizeByScreen(context, 14),
                      color: Colors.white),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
