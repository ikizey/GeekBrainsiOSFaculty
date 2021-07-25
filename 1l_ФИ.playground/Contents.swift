import Foundation

// 1. Решить квадратное уравнение.
func sqrEquation(a: Double, b: Double, c: Double) -> (x1: Double?, x2: Double?) {
    /// Решение квадратного уравнения вида ax^2 + bx + c = 0
    
    /// Если a = 0; то уравнение не квадратное
    guard a != 0 else { return (nil, nil) }
    /// Дискриминант
    let D = (b * b) - (4 * a * c)
    
    if D ~= 0 { // ~= 0
        /// Если D = 0: оба крня равны, возврящаем один корень
        let x1 = -b / (2 * a)
        return (x1, nil)
    } else if D > 0 {
        /// Если D > 0: 2 корня
        let x1 = (-b + sqrt(D)) / (2 * a)
        let x2 = (-b - sqrt(D)) / (2 * a)
        return (x1, x2)
    }
    /// Если D < 0: нет корней
    return (nil, nil)
}
// test:
var (x1, x2) = sqrEquation(a: 24, b: 3, c: 4)
print("x1: \(x1); x2: \(x2);")
(x1, x2) = sqrEquation(a: 1, b: -2, c: -3)
print("x1: \(x1); x2: \(x2);")
(x1, x2) = sqrEquation(a: 1, b: 12, c: 36)
print("x1: \(x1); x2: \(x2);")

print("\n==========\n")

/////

// 2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

struct RightTriangle {
    let cathetusA: Double
    let cathetusB: Double
    
    var hypotenuse: Double { sqrt(cathetusA * cathetusA + cathetusB * cathetusB) }
    var area: Double { (cathetusA * cathetusB) / 2 }
    var perimeter: Double { cathetusA + cathetusB + hypotenuse }
    
    init(cathetusA: Double, cathetusB: Double) {
        if !(cathetusA > 0 && cathetusB > 0) {
            self.cathetusA = 0.0001
            self.cathetusB = 0.0001
        } else {
            self.cathetusA = cathetusA
            self.cathetusB = cathetusB
        }
    }
}
//test triangle
let EgyptianTriangle = RightTriangle(cathetusA: 3, cathetusB: 4)
print("Area of EgyptianTriangle: \(EgyptianTriangle.area)")
print("Hypotenuse of EgyptianTriangle: \(EgyptianTriangle.hypotenuse)")
print("Perimeter if EgyptianTriangle: \(EgyptianTriangle.perimeter)")

print("\n==========\n")

/////

// 3. * Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

func calculateDepositWithCompoundInterest(initialSum sum: Double, withInterest interest: Double, forYears years: Int = 5) -> Double? {
    guard sum >= 0 && interest >= 0 && years >= 0 else { return nil }
    var result = sum
    
    for _ in 0..<years {
        let yearResult = result * interest
        result += yearResult
    }
    return result
}
//test
let totalSumin5Years = calculateDepositWithCompoundInterest(initialSum: 1000, withInterest: 0.1)
print("Final sum = \(totalSumin5Years)")
let totalSumin0Years = calculateDepositWithCompoundInterest(initialSum: 1000, withInterest: 0.1, forYears: 0)
print("Final sum = \(totalSumin0Years)")
let totalSumWith0Interest = calculateDepositWithCompoundInterest(initialSum: 1000, withInterest: 0, forYears: 100)
print("Final sum = \(totalSumWith0Interest)")
let totalSumWith0Deposit = calculateDepositWithCompoundInterest(initialSum: 0, withInterest: 1000, forYears: 1000)
print("Final sum = \(totalSumWith0Deposit)")
