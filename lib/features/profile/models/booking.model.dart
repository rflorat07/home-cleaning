import '../enums/booking_type.enum.dart';

class BookingModel {
  BookingModel({
    required this.cost,
    required this.name,
    required this.type,
    required this.service,
    required this.booking,
    required this.address,
    required this.category,
  });

  final BookingType type;
  final String cost, name, category, service, booking, address;
}

// Our demo CategoryModel

List<BookingModel> domoBookingModel = [
  BookingModel(
    cost: '\$100.00',
    name: 'Bessie Cooper',
    category: 'Car Repairing',
    type: BookingType.upcoming,
    service: 'SUV Car Repairing',
    booking: 'October 04, 2023 | 10:00 AM',
    address: '1901 Thornridge Cir. Shiloh, Hawaii 81063',
  ),
  BookingModel(
    cost: '\$180.00',
    name: 'Jenny Wilson',
    category: 'Home Cleaning',
    type: BookingType.upcoming,
    service: 'Deep House Cleaning',
    booking: 'October 04, 2023 | 10:00 AM',
    address: '1901 Thornridge Cir. Shiloh, Hawaii 81063',
  ),
  BookingModel(
    cost: '\$160.00',
    name: 'Leslie Alexander',
    type: BookingType.upcoming,
    category: 'Gardening',
    service: 'Garden Cutting',
    booking: 'October 04, 2023 | 10:00 AM',
    address: '1901 Thornridge Cir. Shiloh, Hawaii 81063',
  ),
  BookingModel(
    cost: '\$150.00',
    name: 'Joshua Doe',
    category: 'AC Repair',
    type: BookingType.completed,
    service: 'AC Repairing & Services',
    booking: 'October 04, 2023 | 10:00 AM',
    address: '1901 Thornridge Cir. Shiloh, Hawaii 81063',
  ),
  BookingModel(
    cost: '\$180.00',
    name: 'Jenny Wilson',
    category: 'Electrician',
    type: BookingType.completed,
    service: 'Electric Wiring',
    booking: 'October 04, 2023 | 10:00 AM',
    address: '1901 Thornridge Cir. Shiloh, Hawaii 81063',
  ),
  BookingModel(
    cost: '\$120.00',
    name: 'Joshua Doe',
    category: 'Home Cleaning',
    type: BookingType.completed,
    service: 'Glass Cleaning',
    booking: 'October 04, 2023 | 10:00 AM',
    address: '1901 Thornridge Cir. Shiloh, Hawaii 81063',
  ),
  BookingModel(
    cost: '\$240.00',
    name: 'Martin Smith',
    category: 'Painter',
    type: BookingType.cancelled,
    service: 'Home Painting',
    booking: 'October 04, 2023 | 10:00 AM',
    address: '1901 Thornridge Cir. Shiloh, Hawaii 81063',
  ),
  BookingModel(
    cost: '\$170.00',
    name: 'Leslie Alexander',
    category: 'Appliance',
    type: BookingType.cancelled,
    service: 'Appliance Repairing',
    booking: 'October 04, 2023 | 10:00 AM',
    address: '1901 Thornridge Cir. Shiloh, Hawaii 81063',
  ),
  BookingModel(
    cost: '\$270.00',
    name: 'Leslie Alexander',
    category: 'Car painter',
    type: BookingType.cancelled,
    service: 'Car painting for Home',
    booking: 'October 04, 2023 | 10:00 AM',
    address: '1901 Thornridge Cir. Shiloh, Hawaii 81063',
  ),
];
