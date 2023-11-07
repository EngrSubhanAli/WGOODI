class OrderRequestModel {
  final int orderNumber;
  final String startPoint;
  final String stationName;
  final double fuelQuality;
  final String fuelType;
  bool? accepted;

  OrderRequestModel({
    required this.orderNumber,
    required this.startPoint,
    required this.stationName,
    required this.fuelQuality,
    required this.fuelType,
    this.accepted,
  });
}

List<OrderRequestModel> dummyOrders = [
  OrderRequestModel(
    orderNumber: 1,
    startPoint: "Start Point 1",
    stationName: "Station Name 1",
    fuelQuality: 10.0,
    fuelType: "Type 1",
    accepted: false,
  ),
  OrderRequestModel(
    orderNumber: 2,
    startPoint: "Start Point 2",
    stationName: "Station Name 2",
    fuelQuality: 15.0,
    fuelType: "Type 2",
    accepted: false,
  ),
  OrderRequestModel(
    orderNumber: 3,
    startPoint: "Start Point 3",
    stationName: "Station Name 3",
    fuelQuality: 12.5,
    fuelType: "Type 3",
    accepted: false,
  ),
];
