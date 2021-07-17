import Foundation

class TrunkCar: Car {
    
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
    let volume: Double
    var usedVolume = 0.0
    
    init(model: String, year: Int, volume: Double) {
        self.model = model
        self.year = year
        self.volume = volume
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
        case .loadCargo(volume: let volume):
            if usedVolume + volume >= self.volume {
                print("Can't load cargo! Not enough space in \(model)!")
                return
            }
            usedVolume += volume
            print("Loaded \(volume) of cargo to \(model), \(self.volume - usedVolume) units of volume remaining")
        case .unloadCargo(volume: let volume):
            if usedVolume - abs(volume) < 0 {
                print("Can't unload cargo!. Not enough cargo in \(model)!")
                return
            }
            usedVolume -= volume
            print("Unoaded \(abs(volume)) of cargo from \(model), \(self.volume - usedVolume) units of volume remaining")
        default:
            break
        }
    }
}


extension TrunkCar: CustomStringConvertible {
    var description: String {
        """
        ==^==========***============^==
        This is a cool programmers car:
        Model: \(model)
        Year: \(year)
        Maximum capacity: \(volume)
        Current amount: \(usedVolume)
        Windows are opened: \(isWindowsOpen)
        Engine is started: \(isEngineStarted)
        o_______________}o{
        |              |   \\
        |    Swift     |____\\_____
        | _____        |    |_o__ |
        [/ ___ \\       |   / ___ \\|
        []_/.-.\\_\\______|__/_/.-.\\_[]
           |(O)|             |(O)|
            '-'               '-'
        ==mm=======================mm==
        """
    }
}
