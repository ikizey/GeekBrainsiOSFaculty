import Foundation


func lamborghiniStory() {
    let lamborghini = SportCar(model: "Lamborghini Huracan",
                               year: 2014,
                               maxPassengers: 2,
                               color: "red")
    print(lamborghini)
    lamborghini.takeAction(.recolor(color: "yellow"))
    lamborghini.takeAction(.addPassenger)
    lamborghini.openWindows()
    lamborghini.move(to: "beach")
    lamborghini.stopEngine()
    lamborghini.closeWindows()
    lamborghini.takeAction(.removePassenger)
    lamborghini.takeAction(.removePassenger) //oops
    print(lamborghini)
}

func dodgeTruckStory() {
    let dodgeTruck  = TrunkCar(model: "Dodge Power Wagon",
                               year: 1950,
                               volume: 4_000.0)
    print(dodgeTruck)
    dodgeTruck.openWindows()
    dodgeTruck.move(to: "farm")
    dodgeTruck.takeAction(.loadCargo(volume: 501.3))
    dodgeTruck.takeAction(.loadCargo(volume: 50_000)) // oops
    dodgeTruck.move(to: "store")
    dodgeTruck.closeWindows()
    dodgeTruck.takeAction(.unloadCargo(volume: 500.3))
    print(dodgeTruck)
}

func coolCarStory() {
    let coolCar = SportCar(model: "Swift Car",
                           year: 2016,
                           maxPassengers: 8_000_000_000,
                           color: "orange")
    print(coolCar)
    coolCar.takeAction(.addPassenger)
    coolCar.openWindows()
    coolCar.move(to: "Solar System")
    coolCar.startEngine()
    coolCar.stopEngine()
    coolCar.closeWindows()
    print(coolCar)
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
