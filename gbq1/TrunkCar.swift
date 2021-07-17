import Foundation

class TrunkCar: Car {
    
    let volume: Double
    var usedVolume = 0.0
    
    init(model: String, year: Int, volume: Double) {
        self.volume = volume
        super.init(model: model, year: year)
    }
    
    override func takeAction(_ action: Action) {
        super.takeAction(action)
        
        switch action {
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
    
    override var description: String {
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
