import Foundation


func lamborghiniStory() {
    var lamborghini = SportCar(model: "Lamborghini Huracan", year: 2014, color: "red", maxPassengers: 2)
    lamborghini.recolor(with: "yeallow")
    lamborghini.addPassenger()
    lamborghini.setWindows(.open)
    lamborghini.startEngine()
    lamborghini.move(to: "track")
    lamborghini.stopEngine()
    lamborghini.stopEngine() // redundant
    lamborghini.removePassenger()
    lamborghini.removePassenger() // oops
}

func dodgeTruckStory() {
    var dodgeTruck  = TrunkCar(model: "Dodge Power Wagon", year: 1950, volume: 4000.0)
    dodgeTruck.move(to: "farm")
    
    dodgeTruck.moveCargo(volume: [400.0, 501.3])
    dodgeTruck.moveCargo(volume: [5000.0]) // oops
    
    dodgeTruck.move(to: "store")
    
    dodgeTruck.moveCargo(volume: [-1000.0]) // oops
    dodgeTruck.moveCargo(volume: [-900.0])
}

func main() {
    print("SportCar story: \n\n")
    lamborghiniStory()
    print("\n\n==========\n\n")
    print("TrunkCar story: \n\n")
    dodgeTruckStory()
}

main()
