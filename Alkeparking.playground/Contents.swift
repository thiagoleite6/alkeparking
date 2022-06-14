import UIKit

protocol Parkable {
    var plate: String { get }
    var type: VehicleType { get }
    var checkInTime: Date { get }
    var discountCard: String? { get }
    var parkedTime: Int? { get }
}

enum VehicleType {
    case car
    case motorcycle
    case bus
    case microBus
    
    var rate: Int {
        switch self {
        case .car:
            return 20
        case .motorcycle:
            return 15
        case .microBus:
            return 25
        case .bus:
            return 30
        }
    }
}

struct Vehicle: Parkable, Hashable {
    var plate: String
    let type: VehicleType
    var checkInTime: Date
    var discountCard: String?    //Tempo total no estacionamento
    var parkedTime: Int? {
        return Calendar.current.dateComponents([.minute], from:
                                                checkInTime, to: Date()).minute ?? 0
    }
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(plate.hashValue)
    }
    
    static func == (lhs: Vehicle, rhs: Vehicle) -> Bool {
        lhs.plate == rhs.plate
    }
}

struct Parking {
    var vehicles: Set<Vehicle> = Set()
}

var alkeParking = Parking()

let car = Vehicle(plate: "AA111AA", type: VehicleType.car, checkInTime: Date(), discountCard: "DISCOUNT_CARD_001")
let moto = Vehicle(plate: "B222BBB", type: VehicleType.motorcycle, checkInTime: Date(), discountCard: nil)
let miniBus = Vehicle(plate: "CC333CC", type: VehicleType.microBus, checkInTime: Date(), discountCard: nil)
let bus = Vehicle(plate: "DD444DD", type: VehicleType.bus, checkInTime: Date(), discountCard: "DISCOUNT_CARD_002")

let car2 = Vehicle(plate: "AA111AA", type: VehicleType.car,
                   checkInTime: Date(), discountCard: "DISCOUNT_CARD_003")

print(alkeParking.vehicles.insert(car).inserted)  // true
print(alkeParking.vehicles.insert(car2).inserted) //false
alkeParking.vehicles.insert(car)
alkeParking.vehicles.insert(moto)
alkeParking.vehicles.insert(miniBus)
alkeParking.vehicles.insert(bus)
alkeParking.vehicles.remove(moto)
print(alkeParking.vehicles)

