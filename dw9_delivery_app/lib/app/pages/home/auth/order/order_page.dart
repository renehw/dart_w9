import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:dw9_delivery_app/app/dto/order_product_dto.dart';
import 'package:dw9_delivery_app/app/models/product_model.dart';
import 'package:dw9_delivery_app/app/pages/home/auth/order/widget/order_field.dart';
import 'package:dw9_delivery_app/app/pages/home/auth/order/widget/order_product_tile.dart';
import 'package:dw9_delivery_app/app/pages/home/auth/order/widget/payment_types_field.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                children: [
                  Text(
                    'Carrinho',
                    style: context.textStyles.textTitle,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/images/trashRegular.png'),
                  )
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 2,
              (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OrderProductTile(
                      index: index,
                      orderProduct: OrderProductDto(
                        product: ProductModel.fromMap({}),
                        amount: 10,
                      ),
                    ),
                    const Divider(color: Colors.grey),
                  ],
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total do pedido',
                        style: context.textStyles.textExtraBold.copyWith(fontSize: 16.0),
                      ),
                      Text(
                        r'R$ 200,00',
                        style: context.textStyles.textExtraBold.copyWith(fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
                const Divider(color: Colors.grey),
                OrderField(
                  title: 'Endereço de Entrega',
                  controler: TextEditingController(),
                  validator: (value) {
                    return null;
                  },
                  hintText: 'Digite um Endereço',
                ),
                const SizedBox(height: 10.0),
                OrderField(
                  title: 'CPF',
                  controler: TextEditingController(),
                  validator: (value) {
                    return null;
                  },
                  hintText: 'Digite o CPF',
                ),
                const PaymentTypesField(),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Divider(color: Colors.grey),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: DeliveryButton(
                    width: double.infinity,
                    height: 42.0,
                    label: 'Finalizar',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
