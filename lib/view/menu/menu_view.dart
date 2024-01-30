import 'package:cab_connect/common/color_extension.dart';
import 'package:cab_connect/common/icon_title_cell.dart';
import 'package:cab_connect/view/menu/earning_view.dart';
import 'package:cab_connect/view/menu/ratings_view.dart';
import 'package:cab_connect/view/menu/service_type.dart';
import 'package:cab_connect/view/menu/settings_view.dart';
import 'package:cab_connect/view/menu/summary_view.dart';
import 'package:cab_connect/view/menu/wallet_view.dart';
import 'package:flutter/material.dart';

import '../../common/menu_row.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: TColor.primaryText,
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            context.pop();
                          },
                          icon: Image.asset(
                            "assets/img/close.png",
                            width: 20,
                            height: 20,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              "assets/img/question_mark.png",
                              width: 20,
                              height: 20,
                              color: Colors.white,
                            ),
                            Text(
                              "Help",
                              style: TextStyle(
                                color: TColor.primaryTextW,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconTitleCell(
                          title: "Earnings",
                          icon: "assets/img/earnings.png",
                          onPressed: () {
                            context.push(const EarningView());
                          },
                        ),
                        InkWell(
                          onTap: () {},
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.asset(
                                      "assets/img/u1.png",
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 2),
                                    color: Colors.white,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(
                                          "assets/img/rate_profile.png",
                                          width: 15,
                                          height: 15,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            context.push(const RatingsView());
                                          },
                                          child: Text(
                                            "4.67",
                                            style: TextStyle(
                                              color: TColor.primaryText,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Neeraj Mehta",
                                style: TextStyle(
                                  color: TColor.primaryTextW,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                        IconTitleCell(
                          title: "Wallet",
                          icon: "assets/img/wallet.png",
                          onPressed: () {
                            context.push(const WalletView());
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              context.push(const ServiceTypeView());
            },
            child: Container(
              color: TColor.lightWhite.withOpacity(.4),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/img/service.png",
                    width: 35,
                    height: 35,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Switch Service Type",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: TColor.primaryText,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Change your service type",
                          style: TextStyle(
                            fontSize: 15,
                            color: TColor.secondaryText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Image.asset(
                    "assets/img/next.png",
                    width: 25,
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MenuRow(
                    icon: 'assets/img/home.png',
                    onPressed: () {},
                    title: 'Home',
                  ),
                  MenuRow(
                    icon: 'assets/img/summary.png',
                    onPressed: () {
                      context.push(const SummaryView());
                    },
                    title: 'Summary',
                  ),
                  MenuRow(
                    icon: 'assets/img/my_subscription.png',
                    onPressed: () {},
                    title: 'My Subscriptions',
                  ),
                  MenuRow(
                    icon: 'assets/img/notification.png',
                    onPressed: () {},
                    title: 'Notifications',
                  ),
                  MenuRow(
                    icon: 'assets/img/setting.png',
                    onPressed: () {
                      context.push(const SettingsView());
                    },
                    title: 'Settings',
                  ),
                  MenuRow(
                    icon: 'assets/img/logout.png',
                    onPressed: () {},
                    title: 'Logout',
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
