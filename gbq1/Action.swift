import Foundation

public enum Action {
    case move(to: String)
    case openWindows
    case closeWindows
    case recolor(color: String)
    case startEngine
    case stopEngine
    case addPassenger
    case removePassenger
    case loadCargo(volume: Double)
    case unloadCargo(volume: Double)
}
