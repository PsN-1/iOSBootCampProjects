//protocol CanFly {
//    func fly()
//}
//
//class Bird {
//
//    var isFemale = true
//
//    func layEgg() {
//        if isFemale {
//            print("The bird makes a new bird in a shall.")
//        }
//    }
//
//}
//
//class Eagle: Bird, CanFly {
//    func fly() {
//        print("The eagle flaps its wings and liftrs off into the sky.")
//    }
//
//    func soar() {
//        print("The eagle glides i nthe air using air currents.")
//    }
//}
//
//class Penguin: Bird {
//    func swim() {
//        print("The penguin paddles through the water.")
//    }
//}
//
//struct FlyingMuseum {
//    func flyingDemo(flyingObject: CanFly) {
//        flyingObject.fly()
//    }
//}
//
//class AirPlane: CanFly {
//
//    func fly() {
//        print("test")
//    }
//    func hasEngines() {
//        print("the airplane has engines")
//    }
//
//}
//
//
//let myEagle = Eagle()
//myEagle.fly()
//myEagle.layEgg()
//myEagle.soar()
//
//
//let myPenguin = Penguin()
//myPenguin.layEgg()
//myPenguin.swim()
////myPenguin.fly()
//
//let myAirplane = AirPlane()
//myAirplane.hasEngines()
//
//let museum = FlyingMuseum()
//museum.flyingDemo(flyingObject: myAirplane)


protocol AdvanceLifeSupport {
    func PerformCPR()
}

class EmergancyCallHandler {
    var delegate: AdvanceLifeSupport?
    
    func assessSituation() {
        print("Can you tell me what happened?")
        
    }
    
    func medicalEmergency() {
        delegate?.PerformCPR()
    }
}

struct Paramedic: AdvanceLifeSupport {
    
    init(handler: EmergancyCallHandler) {
        handler.delegate = self
    }
    
    func PerformCPR() {
        print("The paramedic does chest compression, 30 per second.")
    }
    
}

class Doctor: AdvanceLifeSupport {
    
    init(handler: EmergancyCallHandler) {
        handler.delegate = self
    }
    
    func PerformCPR() {
        print("The paramedic does chest compression, 30 per second.")
    }
    
    func useStethescope() {
        print("Listening for heart sounds.")
    }
}

class Surgeon: Doctor {
    override func PerformCPR() {
        super.PerformCPR()
        print("Sings staying alive by the BeeGees")
    }
    
    func useElectricDrill() {
        print("Whirr...")
    }
}

let emilio = EmergancyCallHandler()
//let pete = Paramedic(handler: emilio)

let angela = Surgeon(handler: emilio)

emilio.assessSituation()
emilio.medicalEmergency()

