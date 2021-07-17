import Foundation

class SportCar: Car {
    var model: String
    var year: Int
    var isWindowsOpen = false {
        didSet {
            guard oldValue != isWindowsOpen else { return }
            let windowsState = isWindowsOpen ? "open" : "close"
            print("\(model)'s windows are \(windowsState)")
        }
    }
    var isEngineStarted = false {
        didSet {
            guard oldValue != isEngineStarted else { return }
            let state = isEngineStarted ? "started" : "stopped"
            print("\(model)'s engine is \(state)")
        }
    }
    
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
        self.model = model
        self.year = year
        self.maxPassengers = maxPassengers
        self.color = color
    }
    
    func takeAction(_ action: Action) {
        switch action {
        case .move(let location):
            isEngineStarted = true
            print("\(model) is moving to \(location)\n...\n...\n\(model) is at \(location) now!")
            isEngineStarted = false
        case .openWindows:
            isWindowsOpen = true
        case .closeWindows:
            isWindowsOpen = false
        case .startEngine:
            isEngineStarted = true
        case .stopEngine:
            isEngineStarted = false
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
}


extension SportCar: CustomStringConvertible {
    var description: String {
        """
        ==^==========***============^==
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
