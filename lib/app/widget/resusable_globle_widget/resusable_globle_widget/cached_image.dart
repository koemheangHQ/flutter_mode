import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_model/app/widget/resusable_globle_widget/resusable_globle_widget/asset_path.dart';
import 'package:fluuter_model/core/themes/app_color.dart';

class CachedImage extends StatelessWidget {
  final String url;
  final Widget? placeholderWidget;
  final Widget? errorWidget;
  final BoxFit? boxFit;
  final double? placeholderWidth;

  const CachedImage({
    Key? key,
    required this.url,
    this.placeholderWidget,
    this.errorWidget,
    this.boxFit = BoxFit.cover,
    this.placeholderWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (url.isEmpty)
        ? Container(
            color: ColorConstant.white,
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            child: Image.asset(
              AssetPath.logoDev,
              fit: BoxFit.contain,
              width: placeholderWidth,
            ),
          )
        : Container(
            color: ColorConstant.white,
            child: CachedNetworkImage(
              imageUrl: url,
              alignment: Alignment.center,
              placeholder: (context, url) {
                return Container(
                  color: ColorConstant.greenTextColor,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(4),
                  child: Image.network(
                    AssetPath.url,
                    fit: BoxFit.contain,
                    width: 200,
                  ),
                );
              },
              errorWidget: (context, url, error) {
                return Container(
                  color: ColorConstant.white,
                  padding: const EdgeInsets.all(4),
                  child: Image.network(
                    AssetPath.url,
                    fit: BoxFit.contain,
                  ),
                );
              },
              fit: boxFit,
            ),
          );
  }
}
