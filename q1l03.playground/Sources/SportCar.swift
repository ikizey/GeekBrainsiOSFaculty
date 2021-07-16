import Foundation

public struct SportCar {
    
    public enum Windows: String {
        case open
        case closed
    }
    
    public let model: String
    public let year: Int
    public var color: String {
        didSet {
            print("\(model)'s color is now \(color)")
        }
    }
    public let maxPassengers: Int
    var passengers = 0 {
        didSet {
            print("\(model) now has \(passengers) passengers of \(maxPassengers) max")
        }
    }
    public var windows: Windows = .closed {
        didSet {
            guard oldValue != windows else { return }
            print("\(model)'s windows are \(windows.rawValue)")
        }
    }
    var isEngineStarted = false {
        didSet {
            guard oldValue != isEngineStarted else { return }
            let state = isEngineStarted ? "started" : "stopped"
            print("\(model)'s engine is \(state)")
        }
    }
    
    public init(model: String, year: Int, color: String, maxPassengers: Int) {
        self.model = model
        self.year = year
        self.color = color
        self.maxPassengers = maxPassengers
    }
    
    public mutating func setWindows(_ windows: Windows) {
        self.windows = windows
    }
    
    public mutating func addPassenger() {
        if passengers == maxPassengers {
            print("no more seats in \(model)")
            return
        }
        passengers += 1
    }
    
    public mutating func removePassenger() {
        if passengers == 0 {
            print("there is nobody to remove in \(model)")
            return
        }
        passengers -= 1
    }
    
    public mutating func recolor(with color: String) {
        self.color = color
    }
    
    public mutating func startEngine() {
        self.isEngineStarted = true
    }
    
    public mutating func stopEngine() {
        self.isEngineStarted = false
    }
    
    public mutating func move(to location: String) {
        print("\(model) is moving to \(location)\n...\n...\n\(model) is at \(location) now!")
    }
}
