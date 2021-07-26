import Foundation

protocol Car {
    
    var model: String { get }
    var year: Int { get }
    var isWindowsOpen: Bool { get set }
    var isEngineStarted: Bool { get set }
    func takeAction(_ action: Action)
}

extension Car {
    func openWindows() {
        takeAction(.openWindows)
    }
    
    func closeWindows() {
        takeAction(.openWindows)
    }
}

extension Car {
    func startEngine() {
        takeAction(.startEngine)
    }
    
    func stopEngine() {
        takeAction(.stopEngine)
    }
}

extension Car {
    func move(to location: String) {
        takeAction(.move(to: location))
    }
}
