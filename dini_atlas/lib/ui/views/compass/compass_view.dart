import 'package:dini_atlas/extensions/num_extensions.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/widgets/appbar.dart';
import 'package:dini_atlas/ui/widgets/banner_ad_widget.dart';
import 'package:dini_atlas/ui/widgets/location_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:stacked/stacked.dart';
import 'compass_viewmodel.dart';

class CompassView extends StackedView<CompassViewModel> {
  const CompassView({super.key});

  @override
  Widget builder(
    BuildContext context,
    CompassViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBarWidget(
        title: "Kıble Pusulası",
        actions: [
          if (viewModel.compassType == CompassType.compass)
            IconButton(
              onPressed: () {
                viewModel.getUserSettings();
                viewModel.setCompassType(CompassType.map);
              },
              icon: const Icon(Icons.map_outlined),
            ),
          if (viewModel.compassType == CompassType.map)
            IconButton(
              onPressed: () => viewModel.setCompassType(CompassType.compass),
              icon: const Icon(Icons.blur_circular),
            ),
        ],
      ),
      body: Center(
        child: viewModel.isBusy
            ? const CircularProgressIndicator()
            : !viewModel.locationPermission
                ? LocationErrorWidget(
                    message: "Kıble pusulası için konum izni gerekiyor.",
                    onRetry: () => viewModel.checkLocationPermission(),
                  )
                : viewModel.deviceSupport &&
                        viewModel.compassType == CompassType.compass
                    ? _qiblaCompass(viewModel)
                    : _mapCompass(viewModel),
      ),
    );
  }

  Widget _qiblaCompass(CompassViewModel viewModel) {
    return Padding(
      padding: paddingLarge,
      child: StreamBuilder(
        stream: FlutterQiblah.qiblahStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.hasData) {
            final QiblahDirection qiblahDirection = snapshot.data!;
            final double angle =
                (qiblahDirection.qiblah).degreesToRadians() * -1;

            final int diff =
                (qiblahDirection.offset - qiblahDirection.direction).toInt();

            final bool isCorrectDirection = diff > -45 && diff < 45;

            final bool isLeft = diff > 180;

            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BannerAdWidget(bannerAd: viewModel.bannerAd),
                Text("Manyetik Alan: %${viewModel.magneticPercentage}"),
                Text(
                  "${qiblahDirection.offset.toStringAsFixed(3)}°",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: kcPrimaryColorDark,
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform.rotate(
                      angle: angle,
                      child: SvgPicture.asset(kiCompassCircle),
                    ),
                    Transform.rotate(
                      angle: angle,
                      child: SvgPicture.asset(kiCompassPlaceholder),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      isCorrectDirection
                          ? Icons.check
                          : isLeft
                              ? Icons.arrow_back_rounded
                              : Icons.arrow_forward_rounded,
                      color: kcGrayColor,
                    ),
                    verticalSpace(15),
                    Text(
                      isCorrectDirection
                          ? "Kıble Yönü"
                          : "Cihazı ${isLeft ? 'Sola' : 'Sağa'} Çevir",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: kcPrimaryColorDark,
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  Widget _mapCompass(CompassViewModel viewModel) {
    return viewModel.userLocation == null
        ? const CircularProgressIndicator()
        : FlutterMap(
            options: MapOptions(
              center: LatLng(viewModel.userLatitude, viewModel.userLongtitude),
              zoom: 17.5,
              maxZoom: 18,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.rw.dini_atlas',
              ),
              PolylineLayer(
                polylines: [
                  Polyline(
                    borderStrokeWidth: 2,
                    borderColor: kcPrimaryColor,
                    color: kcPrimaryColorLight,
                    points: [
                      // User
                      LatLng(viewModel.userLatitude, viewModel.userLongtitude),
                      // Kaabah
                      const LatLng(21.422487, 39.826206),
                    ],
                  ),
                ],
              ),
            ],
          );
  }

  @override
  CompassViewModel viewModelBuilder(BuildContext context) => CompassViewModel();

  @override
  void onViewModelReady(CompassViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(CompassViewModel viewModel) {
    FlutterQiblah().dispose();
    super.onDispose(viewModel);
  }
}
