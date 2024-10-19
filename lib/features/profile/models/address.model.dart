class AddressModel {
  AddressModel({
    required this.name,
    required this.address,
  });

  final String name, address;
}

// Our demo CategoryModel

List<AddressModel> domoAddressModel = [
  AddressModel(
      name: 'Home', address: '1901 Thornridge Cir. Shiloh, Hawaii 81063'),
  AddressModel(
      name: 'Office', address: '1901 Thornridge Cir. Shiloh, Hawaii 81063'),
  AddressModel(
      name: 'Parent’s House',
      address: '8502 Preston Rd. Inglewood, Maine 98380'),
  AddressModel(
      name: 'Friend’s House', address: '2464 Royal Ln. Mesa, New Jersey 45463'),
];
