import UIKit

protocol Parkable {
    var plate: String { get }
    var type: VehicleType { get }
    var checkInTime: Date { get }
    var discountCard: String? { get }
    var parkedTime: Int { get }
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
    var parkedTime: Int {
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
    var vehicles: Set<Vehicle> = []
    var parkingLimit: Int = 20
    var adminInfo = (totalCheckoutVehicles: 0, totalEarnings: 0)

    mutating func checkInVehicle(_ vehicle: Vehicle, onFinish:
                                 (Bool) -> Void) {
        guard vehicles.count < parkingLimit else {
            onFinish(false)
            return
        }

        guard !vehicles.contains(vehicle) else {
            onFinish(false)
            return
        }

        vehicles.insert(vehicle)
        onFinish(true)
    }

    mutating func checkOutVehicle(plate: String, onSuccess: (Int) -> Void, onError: () -> Void) {

        if let vehicle = vehicles.first(where: { $0.plate == plate }){
            let total = calculateFee(vehicleType: vehicle.type, parkedTime: vehicle.parkedTime, hasDiscountCard: vehicle.discountCard != nil)
            onSuccess(total)
            adminInfo.totalCheckoutVehicles += 1
            adminInfo.totalEarnings += total
            vehicles.remove(vehicle)
            return
        }
        onError()
    }
    
    func showAdminInfo() -> Void {
        print("\(adminInfo.totalCheckoutVehicles) vehicles have checked out and have earnings of $\(adminInfo.totalEarnings)")
    }

    func calculateFee(vehicleType: VehicleType, parkedTime: Int, hasDiscountCard: Bool) -> Int {

        var total = vehicleType.rate
        let initialTime = 120
        let extraTime = 15
        let costPerExtraTime = 5
        
        if parkedTime > initialTime {
            let timeExceeded = parkedTime - initialTime
            let surplus = timeExceeded / extraTime
            total += surplus * costPerExtraTime
        }

        if hasDiscountCard {
            let discount = total * 15 / 100
            total -= discount
        }

        return total
    }
    
    func listVehicles() {
        if vehicles.count > 0 {
            print("Total vehicles: \(vehicles.count) \n")
            for vehicle in vehicles {
                print("Plate: \(vehicle.plate) ????\n")
            }
        } else {
            print("Parking is empty! ????")
        }
    }
}

//let car = Vehicle(plate: "AA111AA", type: VehicleType.car, checkInTime: Date(), discountCard: "DISCOUNT_CARD_001")
//let moto = Vehicle(plate: "B222BBB", type: VehicleType.motorcycle, checkInTime: Date(), discountCard: nil)
//let miniBus = Vehicle(plate: "CC333CC", type: VehicleType.microBus, checkInTime: Date(), discountCard: nil)
//let bus = Vehicle(plate: "DD444DD", type: VehicleType.bus, checkInTime: Date(), discountCard: "DISCOUNT_CARD_002")
//let car2 = Vehicle(plate: "AA111AA", type: VehicleType.car,
//                   checkInTime: Date(), discountCard: "DISCOUNT_CARD_003")
//let car3 = Vehicle(plate: "AA111A2", type: VehicleType.car,
//                   checkInTime: Date(), discountCard: "DISCOUNT_CARD_003")
//
////print(alkeParking.vehicles.insert(car).inserted)  // true
//print(alkeParking.vehicles.insert(car2).inserted) //false
////alkeParking.vehicles.insert(car)
//alkeParking.vehicles.insert(moto)
//alkeParking.vehicles.insert(miniBus)
//alkeParking.vehicles.insert(bus)
//
//print(alkeParking.vehicles)

var alkeParking = Parking()

let vehicle1 = Vehicle(plate: "000001", type:
                        VehicleType.car, checkInTime: Date(), discountCard:
                        "DISCOUNT_CARD_001")
let vehicle2 = Vehicle(plate: "000002", type:
                        VehicleType.motorcycle, checkInTime: Date(), discountCard: nil)
let vehicle3 = Vehicle(plate: "000003", type:
                        VehicleType.microBus, checkInTime: Date(), discountCard:
                        nil)
let vehicle4 = Vehicle(plate: "000004", type:
                        VehicleType.bus, checkInTime: Date(), discountCard:
                        "DISCOUNT_CARD_002")
let vehicle5 = Vehicle(plate: "000005", type:
                        VehicleType.car, checkInTime: Date(), discountCard:
                        "DISCOUNT_CARD_003")
let vehicle6 = Vehicle(plate: "000006", type:
                        VehicleType.motorcycle, checkInTime: Date(), discountCard:
                        "DISCOUNT_CARD_004")
let vehicle7 = Vehicle(plate: "000007", type:
                        VehicleType.microBus, checkInTime: Date(), discountCard:
                        nil)

let vehicle8 = Vehicle(plate: "000008", type:
                        VehicleType.bus, checkInTime: Date(), discountCard:
                        "DISCOUNT_CARD_005")
let vehicle9 = Vehicle(plate: "000009", type:
                        VehicleType.car, checkInTime: Date(), discountCard: nil)
let vehicle10 = Vehicle(plate: "000010", type:
                            VehicleType.motorcycle, checkInTime: Date(), discountCard: nil)
let vehicle11 = Vehicle(plate: "000011", type:
                            VehicleType.microBus, checkInTime: Date(), discountCard:
                            nil)
let vehicle12 = Vehicle(plate: "000012", type:
                            VehicleType.bus, checkInTime: Date(), discountCard:
                            "DISCOUNT_CARD_006")
let vehicle13 = Vehicle(plate: "000013", type:
                            VehicleType.car, checkInTime: Date(), discountCard:
                            "DISCOUNT_CARD_007")
let vehicle14 = Vehicle(plate: "000014", type:
                            VehicleType.motorcycle, checkInTime: Date(), discountCard: nil)
let vehicle15 = Vehicle(plate: "0000015", type:
                            VehicleType.microBus, checkInTime: Date(), discountCard:
                            nil)
let vehicle16 = Vehicle(plate: "000016", type:
                            VehicleType.motorcycle, checkInTime: Date(), discountCard: nil)
let vehicle17 = Vehicle(plate: "000017", type:
                            VehicleType.microBus, checkInTime: Date(), discountCard:
                            nil)
let vehicle18 = Vehicle(plate: "000018", type:
                            VehicleType.bus, checkInTime: Date(), discountCard:
                            "DISCOUNT_CARD_006")
let vehicle19 = Vehicle(plate: "000019", type:
                            VehicleType.car, checkInTime: Date(), discountCard:
                            "DISCOUNT_CARD_007")

// Data especifica
let formatter = DateFormatter()
formatter.dateFormat = "yyyy/MM/dd HH:mm"
let someDateTime = formatter.date(from: "2022/06/15 14:05")

let vehicle20 = Vehicle(plate: "000020", type:
                            VehicleType.motorcycle, checkInTime: someDateTime ?? Date(), discountCard: nil)
let vehicle21 = Vehicle(plate: "000021", type:
                            VehicleType.microBus, checkInTime: Date(), discountCard:
                            nil)

var allVehicles: [Vehicle] = []

allVehicles.append(vehicle1)
allVehicles.append(vehicle2)
allVehicles.append(vehicle3)
allVehicles.append(vehicle4)
allVehicles.append(vehicle5)
allVehicles.append(vehicle6)
allVehicles.append(vehicle7)
allVehicles.append(vehicle8)
allVehicles.append(vehicle9)
allVehicles.append(vehicle10)
allVehicles.append(vehicle11)
allVehicles.append(vehicle12)
allVehicles.append(vehicle13)
allVehicles.append(vehicle14)
allVehicles.append(vehicle15)
allVehicles.append(vehicle16)
allVehicles.append(vehicle17)
allVehicles.append(vehicle18)
allVehicles.append(vehicle19)
allVehicles.append(vehicle20)
allVehicles.append(vehicle21)

allVehicles.forEach { vehicle in
    alkeParking.checkInVehicle(vehicle) { inserted in
        if inserted {
            print("Welcome to AlkeParking! ???")
        } else {
            print("Sorry, the check-in failed ???")
        }
    }
}

alkeParking.checkOutVehicle(plate: "000020") { totalRate in
    print("Your fee is \(totalRate)????. Come back soon")
} onError: {
    print("Sorry, the check-out failed ???")
}

alkeParking.listVehicles()
alkeParking.showAdminInfo()
