import Foundation

public struct TrunkCar {
    
    public enum Engine: String {
        case started
        case stopped
    }
    
    public let model: String
    public let year: Int
    public let volume: Double
    var usedVolume = 0.0
    var engine: Engine = .stopped {
        didSet {
            guard oldValue != engine else { return }
            print("\(model)'s engine is \(engine.rawValue)")
        }
    }
    
    public init(model: String, year: Int, volume: Double) {
        self.model = model
        self.year = year
        self.volume = volume
    }
        
    private mutating func loadCargo(ofVolume volume: Double) {
        if usedVolume + volume >= self.volume {
            print("Can't load cargo! Not enough space in \(model)!")
            return
        }
        usedVolume += volume
        print("Loaded \(volume) of cargo to \(model), \(self.volume - usedVolume) units of volume remaining")
    }
    
    private mutating func unloadCargo(ofVolume volume: Double) {
        if usedVolume - abs(volume) < 0 {
            print("Can't unload cargo!. Not enough cargo in \(model)!")
            return
        }
        usedVolume -= volume
        print("Unoaded \(abs(volume)) of cargo from \(model), \(self.volume - usedVolume) units of volume remaining")
    }
    
    public mutating func moveCargo(volume: [Double]) {
        /// loads and unloads cargo from truck
        /// if volume is positive : load
        /// if volume is negative : unload
        let totalVolume = volume.reduce(0, +)
        
        totalVolume < 0 ?
            unloadCargo(ofVolume: totalVolume) :
            loadCargo(ofVolume: totalVolume)
    }
    
    public mutating func setEngine(_ engine: Engine) {
        self.engine = engine
    }
    
    public mutating func move(to location: String) {
        self.setEngine(.started)
        print("\(model) is moving to \(location)\n...\n...\n\(model) is at \(location) now!")
        self.setEngine(.stopped)
    }
}
