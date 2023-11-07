class StationManagerModel {
  final String stationName;
  final String lastOrder;
  final FuelType fuelType;
  final Map<FuelType, String> prices;
  final int orderNumber;
  final String station;
  final String receiptNumber;
  final int amount;
  final String expectedDate;
  final int tip;
  Status status; // Add the 'status' property here.

  StationManagerModel({
    required this.stationName,
    required this.lastOrder,
    required this.fuelType,
    required this.prices,
    required this.orderNumber,
    required this.station,
    required this.receiptNumber,
    required this.amount,
    required this.expectedDate,
    required this.tip,
    required this.status, // Include 'status' in the constructor.
  });
}

final List<StationManagerModel> dummyStations = [
  StationManagerModel(
    stationName: "Station A",
    lastOrder: "2023-11-01",
    fuelType: FuelType.gasoline,
    prices: {
      FuelType.gasoline: "2000/5000",
      FuelType.diesel: "1000/2000",
      FuelType.electric: "2000/4000",
    },
    orderNumber: 1001,
    station: "Location X",
    receiptNumber: "ABCD123",
    amount: 250,
    expectedDate: "2023-11-05",
    tip: 10,
    status: Status.active, // Set the status for this station.
  ),
  StationManagerModel(
    stationName: "Station A",
    lastOrder: "2023-11-01",
    fuelType: FuelType.gasoline,
    prices: {
      FuelType.gasoline: "2000/5000",
      FuelType.diesel: "1000/2000",
      FuelType.electric: "2000/4000",
    },
    orderNumber: 1001,
    station: "Location X",
    receiptNumber: "ABCD123",
    amount: 250,
    expectedDate: "2023-11-05",
    tip: 10,
    status: Status.active, // Set the status for this station.
  ),
  StationManagerModel(
    stationName: "Station B",
    lastOrder: "2023-11-02",
    fuelType: FuelType.diesel,
    prices: {
      FuelType.gasoline: "2000/5000",
      FuelType.diesel: "1000/2000",
      FuelType.electric: "2000/4000",
    },
    orderNumber: 1002,
    station: "Location Y",
    receiptNumber: "EFGH456",
    amount: 300,
    expectedDate: "2023-11-06",
    tip: 15,
    status: Status.pending, // Set the status for this station.
  ),
  StationManagerModel(
    stationName: "Station C",
    lastOrder: "2023-11-03",
    fuelType: FuelType.electric,
    prices: {
      FuelType.gasoline: "2000/5000",
      FuelType.diesel: "1000/2000",
      FuelType.electric: "2000/4000",
    },
    orderNumber: 1003,
    station: "Location Z",
    receiptNumber: "IJKL789",
    amount: 350,
    expectedDate: "2023-11-07",
    tip: 12,
    status: Status.cancelled, // Set the status for this station.
  ),
  StationManagerModel(
    stationName: "Station D",
    lastOrder: "2023-11-04",
    fuelType: FuelType.naturalGas,
    prices: {
      FuelType.gasoline: "2000/5000",
      FuelType.diesel: "1000/2000",
      FuelType.electric: "2000/4000",
    },
    orderNumber: 1004,
    station: "Location W",
    receiptNumber: "MNOP123",
    amount: 400,
    expectedDate: "2023-11-08",
    tip: 18,
    status: Status.active, // Set the status for this station.
  ),
];

enum FuelType {
  gasoline,
  diesel,
  electric,
  naturalGas,
  other,
}

enum Status{
  pending,
  active,
  cancelled
}