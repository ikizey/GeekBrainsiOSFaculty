import Foundation

class SportCar: Car {
    
    let maxPassengers: Int
    var color: String {
        didSet {
            print("\(model)'s color is now \(color)")
        }
    }
    var passengers = 0 {
        didSet {
            print("\(model) now has \(passengers) passengers of \(maxPassengers) max")
        }
    }
    
    init(model: String, year: Int, maxPassengers: Int, color: String) {
        self.maxPassengers = maxPassengers
        self.color = color
        super.init(model: model, year: year)
    }
    
    override func takeAction(_ action: Action) {
        super.takeAction(action)
        
        switch action {
        case .addPassenger:
            if passengers == maxPassengers {
                print("no more seats in \(model)")
                return
            }
            passengers += 1
        case .removePassenger:
            if passengers == 0 {
                print("there is nobody to remove in \(model)")
                return
            }
            passengers -= 1
        case .recolor(color: let color):
            self.color = color
        default:
            break
        }
    }
    
    override var description: String {
        """
        ==^==========***============^==
        This is a cool programmers car:
        Model: \(model)
        Year: \(year)
        Maximum capacity: \(maxPassengers)
        Current amount of passengers: \(passengers)
        Windows are opened: \(isWindowsOpen)
        Engine is started: \(isEngineStarted)
         ______
        /|_||_\\`.__
        (  Swift _ _\\
        =`-(_)--(_)-'
        ==mm=======================mm==
        """
    }
}
