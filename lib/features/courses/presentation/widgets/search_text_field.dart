import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tutors/generated/locale_keys.g.dart';

import '../../../../core/constants/app_colors.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Function()? onReset;
  const SearchTextField({super.key, this.controller,this.onReset});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: AppColors.greyColor,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 10, right: 3),
            child: Icon(Icons.search),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
          prefixIconConstraints: const BoxConstraints(
            maxHeight: 40,
            maxWidth: 40,
            minHeight: 20,
            minWidth: 20,
          ),
          hintText: LocaleKeys.kSearch.tr(),
          suffixIcon:onReset!=null? Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: onReset,
              child: Container(
                width: 25,
                height: 25,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(Icons.clear,color: Colors.black,),
                ),
              ),
            ),
          ):null,
          suffixIconConstraints: const BoxConstraints(
            maxHeight: 40,
            maxWidth: 40,
            minHeight: 20,
            minWidth: 20,
          )),
    );
  }
}
