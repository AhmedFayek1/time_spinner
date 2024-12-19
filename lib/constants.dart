import 'package:flutter/cupertino.dart';

/// mobile < 600
bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 600;

/// tablet >= 600 && tablet <= 900

bool isTablet(BuildContext context) =>
    MediaQuery.of(context).size.width >= 600 &&
    MediaQuery.of(context).size.width <= 900;

/// Desktop >900
bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width > 900;

/// Notification types
// Parents
const waitingForPassenger = 'waiting_for_passenger';
const lateTrip = 'late_parent_trip';
const parentMaintenanceMalfunction = 'parent_maintenance_malfunction';
const parentTrafficIssues = 'parent_traffic_jam';
const parentHealthCrisis = 'parent_health_crisis';

// User
const userMaintenanceMalfunction = 'user_maintenance_malfunction';
const userTrafficIssues = 'user_traffic_jam';
const userHealthCrisis = 'user_health_crisis';
const userRequestAccepted = 'user_request_accepted';
const userRequestRejected = 'user_request_rejected';

// General
const chat = 'chat';

const String imageUrlTemp =
    'https://t4.ftcdn.net/jpg/02/61/11/69/360_F_261116904_IogJ41Ey5N9GqSV9zEafHZLbkGJ53QoC.jpg';

const String profileImageTemp =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTNjkaQHLXfokbl1GiKnXl6v7GNgnG8rb3JA&s';
