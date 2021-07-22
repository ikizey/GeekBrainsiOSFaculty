import Foundation


func lamborghiniStory() {
    let lamborghini = SportCar(model: "Lamborghini Huracan",
                               year: 2014,
                               maxPassengers: 2,
                               color: "red")
    lamborghini.show()
    lamborghini.takeAction(.recolor(color: "yellow"))
    lamborghini.takeAction(.addPassenger)
    lamborghini.takeAction(.openWindows)
    lamborghini.takeAction(.move(to: "Solar system"))
    lamborghini.takeAction(.stopEngine) // already stopped
    lamborghini.takeAction(.closeWindows)
    lamborghini.takeAction(.removePassenger)
    lamborghini.takeAction(.removePassenger) //oops
    lamborghini.show()
}

func dodgeTruckStory() {
    let dodgeTruck  = TrunkCar(model: "Dodge Power Wagon",
                               year: 1950,
                               volume: 4_000.0)
    dodgeTruck.show()
    dodgeTruck.takeAction(.move(to: "farm"))
    dodgeTruck.takeAction(.loadCargo(volume: 501.3))
    dodgeTruck.takeAction(.loadCargo(volume: 50_000)) // oops
    dodgeTruck.takeAction(.move(to: "store"))
    dodgeTruck.takeAction(.closeWindows)
    dodgeTruck.takeAction(.unloadCargo(volume: 500.3))
    dodgeTruck.show()
}

func coolCarStory() {
    let coolCar = SportCar(model: "Swift Car",
                           year: 2016,
                           maxPassengers: 8_000_000_000,
                           color: "orange")
    coolCar.show()
    coolCar.takeAction(.addPassenger)
    coolCar.takeAction(.openWindows)
    coolCar.takeAction(.move(to: "Solar system"))
    coolCar.takeAction(.startEngine)
    coolCar.takeAction(.stopEngine)
    coolCar.takeAction(.closeWindows)
    coolCar.show()
}

func main() {
    print("SportCar story: \n\n")
    lamborghiniStory()
    print("\n\n==========\n\n")
    print("TrunkCar story: \n\n")
    dodgeTruckStory()
    print("\n\n==========\n\n")
    print("CoolCar story: \n\n")
    coolCarStory()
}

main()
