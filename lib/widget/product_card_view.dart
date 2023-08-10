import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../entity/product.dart';

class ProductCardView extends StatelessWidget {
  const ProductCardView(
      {Key? key,
        required this.product,
        this.imageAlignment = Alignment.bottomCenter,
        this.onTap})
      : super(key: key);

  final Product product;
  final Alignment imageAlignment;
  final Function(String)? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call('${product.productId}'),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 0, color: Colors.grey),
          color: Colors.white,
          boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(.4,.4), //(x,y)
                blurRadius: 0.0,
              ),
          ],
        ),
        // width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: SizedBox(
          width: 150,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                SizedBox(
                    height: 100,
                    width: 150,
                    child: Image.network('https://countryboylifestyle.com/UserPanel/UserPanel/Uploads/605637840830085446014_mid_MIM.jpg',
                        alignment: imageAlignment, fit: BoxFit.cover)),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
                child: Text('Yellow',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: Theme.of(context).textTheme.caption)),
            SizedBox(
                child: Text('${product.productName}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: Theme.of(context).textTheme.bodyText2)),
            Row(
              children: [
                Text('${product.productPrice} €',
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    softWrap: false,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange)),
              ],
            )
          ]),
        ),
      ),
    );
  }
}