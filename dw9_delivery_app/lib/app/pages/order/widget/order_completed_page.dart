import 'package:dw9_delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

class OrderCompletedPage extends StatelessWidget {
  const OrderCompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: context.percentHeight(.20),
              ),
              Image.asset('assets/images/logo_rounded.png'),
              const SizedBox(height: 20.0),
              Text(
                'Pedido realizado com seucesso, em breve você receberá a confirmação do seu pedido',
                style: context.textStyles.textExtraBold.copyWith(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40.0),
              DeliveryButton(
                width: context.percentWidth(.8),
                label: 'Fechar',
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
