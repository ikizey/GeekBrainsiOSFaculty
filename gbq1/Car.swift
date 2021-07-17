import Foundation

class Car: CustomStringConvertible {
    
    let model: String
    let year: Int
    var isWindowsOpen: Bool = false {
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
    
    init(model: String, year: Int) {
        self.model = model
        self.year = year
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
        default:
            break
        }
    }
    
    var description: String {
    """
    ==^==========***============^==
    This is a car:
    Model: \(model)
    Year: \(year)
    ==mm=======================mm==
    """
    }
    
    func show() {
        print(self)
    }
}
