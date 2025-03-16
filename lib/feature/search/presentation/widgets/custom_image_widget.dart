


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/product_model.dart';
import '../../../../core/resources/colors_manger.dart';

class CustomImageWidget extends StatefulWidget {
  const CustomImageWidget({super.key, required this.product});
  final ProductModel product;

  @override
  State<CustomImageWidget> createState() => _CustomImageWidgetState();
}

class _CustomImageWidgetState extends State<CustomImageWidget> {
  @override
  Widget build(BuildContext context) {
    return _buildImage(context);
  }

  Widget _buildImage(BuildContext context){

    return CachedNetworkImage(
      imageUrl:    widget.product.imageUrl,
      imageBuilder: (context,imageProvider)=>ClipRRect(
        borderRadius: BorderRadius.circular(10.0),

        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              color: ColorsManger.grey,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,

              )
          ),
        ),
      ),
      progressIndicatorBuilder: (context,url,downloadProgress)=>
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: ColorsManger.grey,

              ),
              child:  const CupertinoActivityIndicator(),
            ),
          ),
      errorWidget: (context, url, error) =>  ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: ColorsManger.grey,

          ),
          child:const Icon(Icons.error),
        ),
      ),
    );



  }
}
