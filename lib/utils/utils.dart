import 'package:flutter/material.dart';

import '../models/leaderboard_Item.dart';
import '../models/nav_bar_item_model.dart';
import '../painters/home.dart';
import '../painters/trophy.dart';
import '../screens/home/home.dart';
import '../screens/leader_board/leader_board.dart';

class Utils {
  static List<List<dynamic>> dashStats = [
    ["Calories", 400.0, "kcal"],
    ["Divider"],
    ['Speed Avg.', 3.0, 'km/h'],
    ["Divider"],
    ["Distance", 7.0, "Km"]
  ];

  static List<Widget> navBarScreens = [
    const HomeScreen(),
    const LeaderBoardScreen(),
  ];

  static List<NavbarItemModel> navBarItem = [
    NavbarItemModel(
      label: "Home",
      icon: CustomPaint(
        painter: HomeIconPainter(),
        size: const Size(22, 22),
      ),
    ),
    NavbarItemModel(
      label: "Profile",
      icon: CustomPaint(
        painter: TrophyPainter(),
        size: const Size(22, 22),
      ),
    ),
  ];

  static List<LeaderboardItem> leaderboardItems = [
    LeaderboardItem(
        name: "Usama Muzaffar",
        steps: 10500,
        url:
            'https://avatars.githubusercontent.com/u/101565812?v=4'),
    LeaderboardItem(
        name: "Awais Ahmad",
        steps: 9400,
        url:
            'https://media.istockphoto.com/photos/portrait-of-handsome-smiling-young-man-with-crossed-arms-picture-id1200677760?k=20&m=1200677760&s=612x612&w=0&h=JCqytPoHb6bQqU9bq6gsWT2EX1G5chlW5aNK81Kh4Lg='),
    LeaderboardItem(
        name: "Abid Ali",
        steps: 6340,
        url:
            'https://media.istockphoto.com/photos/senior-man-working-out-for-good-health-picture-id1135152361?k=20&m=1135152361&s=612x612&w=0&h=gFms3o8PeNtKpdZAGm70hHACA7ailZolmZATv90rysY='),
    LeaderboardItem(
        name: "Uzair Imran",
        steps: 5500,
        url:
            'https://media.istockphoto.com/photos/living-that-urban-life-picture-id1165314750?k=20&m=1165314750&s=612x612&w=0&h=QcN0aTHS8IpSbNEnSU9Vno8vUjCEFQs4gbZ72dG6yvM='),
  ];
  static List<LeaderboardItem> leaderboardWinners = [
    LeaderboardItem(
        name: "Usama Muzaffar",
        steps: 17300,
        url:
            'https://media.istockphoto.com/photos/smiling-handsome-middleaged-man-in-black-shirt-picture-id1248747884?k=20&m=1248747884&s=612x612&w=0&h=0GoQo0Z22bGTjJgYhY3Gq1CfBj-R3WO4w3loFigtIjg='),
    LeaderboardItem(
        name: "Awais Ahmad",
        steps: 22100,
        url:
            'https://avatars.githubusercontent.com/u/101565812?v=4'),
    LeaderboardItem(
        name: "Ali Asghar",
        steps: 13560,
        url:
            'https://media.istockphoto.com/photos/young-handsome-man-with-beard-wearing-casual-sweater-and-glasses-over-picture-id1212960962?k=20&m=1212960962&s=612x612&w=0&h=o2PGY4yhn51XSnYi60dMCQqvXQ0d-odkaKUVocbYYLk='),
  ];
}
