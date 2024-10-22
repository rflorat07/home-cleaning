class NotificationModel {
  NotificationModel({
    required this.header,
    required this.items,
  });

  final String header;
  final List<NotificationItem> items;
}

class NotificationItem {
  NotificationItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final String title, subtitle, icon;
}

List<NotificationModel> demoNotificationList = [
  NotificationModel(
    header: 'TODAY',
    items: [
      NotificationItem(
        title: 'Service Booked Successfully',
        icon: 'calendar-tick',
        subtitle:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      ),
      NotificationItem(
        title: '50% Off on Home Cleaning',
        icon: 'ticket-star',
        subtitle:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      ),
      NotificationItem(
        title: 'Service Review Request',
        icon: 'star_1',
        subtitle:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      ),
    ],
  ),
  NotificationModel(
    header: 'YESTERDAY',
    items: [
      NotificationItem(
        title: 'Service Booked Successfully',
        icon: 'calendar-tick',
        subtitle:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      ),
      NotificationItem(
        title: 'New Paypal Added',
        icon: 'ticket-star',
        subtitle:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      ),
    ],
  ),
];
