import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class PinPut extends StatefulWidget {
  const PinPut({super.key});

  @override
  State<PinPut> createState() => _PinPutState();
}

class _PinPutState extends State<PinPut> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Pinput(
          errorPinTheme: PinTheme(
              height: 45.h,
              width: 48.w,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 1),
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(15)),
              textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
          onTap: () {
            _controller.clear();
          },
          defaultPinTheme: PinTheme(
              height: 45.h,
              width: 48.w,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple),
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(15)),
              textStyle:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
          androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
          listenForMultipleSmsOnAndroid: true,
          onChanged: (value) {
            debugPrint('onChanged: $value');
          },
          enabled: true,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          length: 6,
          controller: _controller,
          autofillHints: const [AutofillHints.oneTimeCode],
          validator: (s) {
            if (s!.isEmpty) {
              return 'error';
            }
            //  else if (state.verifyStatus == Status.isError) {
            //   return state.verifyError ;
            // }
            return null;
          },
          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
          showCursor: true,
          onCompleted: (pin) {
            // widget.authBloc.add(VerifyEvent(pin));
          },
        ));
  }
}
