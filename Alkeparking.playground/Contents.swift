import UIKit

protocol Parkable {
    var plate: String { get }
    var type: VehicleType { get }
    var checkInTime: Date { get }
    var discountCard: String? { get }
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
