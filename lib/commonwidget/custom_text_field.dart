/// KEY : customTextField
/// Desc. : Add Custom Custom TextField
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../utils/color_utils.dart';
import '../utils/product_text.dart';
import '../utils/regularexpression.dart';

enum ValidationType { Password, Email, PNumber }

typedef OnChangeString = void Function(String value);

class CommonTextField extends StatelessWidget {
  final String titleText;
  final String? initialValue;
  final bool? isValidate;
  final bool? readOnly;
  final TextInputType? textInputType;
  final ValidationType? validationType;
  final String regularExpression;
  final int? inputLength;
  final String? hintText;
  final String? validationMessage;
  final int? maxLine;
  final Widget? sIcon;
  final bool? obscureValue;
  final OnChangeString? onChange;

  const CommonTextField(
      {super.key,
      required this.titleText,
      required this.regularExpression,
      this.isValidate = true,
      this.textInputType,
      this.validationType,
      this.inputLength,
      this.readOnly = false,
      this.hintText,
      this.validationMessage,
      this.maxLine,
      this.sIcon,
      this.onChange,
      this.initialValue = '',
      this.obscureValue});

  /// PLEASE IMPORT GETX PACKAGE
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ProductText(
          titleText,
        ),
        if (titleText != "")
          // ignore: prefer_const_constructors
          SizedBox(
            height: 5,
          ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: TextFormField(
            keyboardType: textInputType ?? TextInputType.text,
            maxLines: maxLine ?? 1,
            initialValue: initialValue,
            inputFormatters: regularExpression ==
                    RegularExpression.addressValidationPattern
                ? []
                : [
                    LengthLimitingTextInputFormatter(inputLength),
                    FilteringTextInputFormatter.allow(RegExp(regularExpression))
                  ],
            obscureText: validationType == ValidationType.Password
                ? obscureValue!
                : false,
            onChanged: onChange,
            enabled: !readOnly!,
            readOnly: readOnly!,
            validator: (value) {
              return isValidate == false
                  ? null
                  : value!.isEmpty
                      ? validationMessage ?? '*Required'
                      : validationType == ValidationType.Email
                          ? ValidationMethod.validateUserName(value)
                          : validationType == ValidationType.PNumber
                              ? ValidationMethod.validatePhoneNo(value)
                              : null;
            },
            textInputAction:
                maxLine == 4 ? TextInputAction.none : TextInputAction.done,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  top: Get.height * 0.018,
                  bottom: Get.height * 0.018,
                  left: 15,
                ),
                focusedBorder: DecorationUtils.outLinePurpleR8,
                enabledBorder: DecorationUtils.outLineGeryR8,
                disabledBorder: DecorationUtils.outLineGeryR8,
                errorBorder: DecorationUtils.outLineRedR8,
                focusedErrorBorder: DecorationUtils.outLineRedR8,
                // isDense: true,
                // isCollapsed: true,
                filled: true,
                suffixIconConstraints:
                    const BoxConstraints(maxWidth: 40, maxHeight: 40),
                suffixIcon: sIcon ?? const SizedBox(),
                fillColor: Colors.white,
                hintText: hintText),
          ),
        ),
        if (titleText != "")
          // ignore: prefer_const_constructors
          SizedBox(
            height: 10,
          ),
      ],
    );
  }
}

class DecorationUtils {
  /// ------------------------------------------------------------------- ///
  /// TEXT FIELD OUTLINE DECORATION
  static InputBorder outLinePurpleR8 = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(color: ColorUtils.primaryColor, width: 1.0),
  );
  static InputBorder outLineGeryR8 = OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.0),
  );
  static InputBorder outLineRedR8 = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(color: Colors.red, width: 1.0),
  );
}
