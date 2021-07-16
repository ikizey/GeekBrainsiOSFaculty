import Foundation

// 1. Написать функцию, которая определяет, четное число или нет.
func isEven(number: Int) -> Bool {
    number.isMultiple(of: 2)
    //number % 2 == 0
}

// 2. Написать функцию, которая определяет, делится ли число без остатка на 3.
func isMultipleOfThree(number: Int) -> Bool {
    number.isMultiple(of: 3)
    //number % 3 == 0
}

// 3. Создать возрастающий массив из 100 чисел.
func makeArrayof100() -> [Int] {
    Array(0..<100)
//    var arr = [Int]()
//    for i in 0..<100 {
//        arr.append(i)
//    }
//    return arr
}
print(makeArrayof100())


// 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
func removeMulitplesOfThreeFromArray(arr: [Int]) -> [Int] {
    var newArr = arr
    newArr.removeAll { $0.isMultiple(of: 3) }
    newArr.removeAll { $0.isMultiple(of: 2) }
    return newArr
//    var newArr = [Int]()
//    for index in 0..<arr.count {
//        if !isMultipleOfThree(number: arr[index]) {
//            newArr.append(arr[index])
//        }
//    }
//    return newArr
}
print(removeMulitplesOfThreeFromArray(arr: makeArrayof100()))

// 5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.

func add50FibTo(array: [Int]) -> [Int] {
    
    func fib(_ num: Int) -> Int {
        guard num > 1 else { return num }
        var a = 0
        var b = 1
        var c = 0
        for _ in 2..<num {
            c = a + b
            a = b
            b = c
        }
        return a + b
    }
    
    var newArr = array
    for n in 0..<50 {
        newArr.append(fib(n))
    }
    return newArr
}

let arr = makeArrayof100()
let arrAndFib = add50FibTo(array: arr)
print(arrAndFib.count - arr.count == 50)


// 6. * Заполнить массив элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n (пусть будет 100), следуя методу Эратосфена, нужно выполнить следующие шаги:
/* a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
    b. Пусть переменная p изначально равна двум — первому простому числу.
    c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p.
    d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
    e. Повторять шаги c и d, пока возможно.
*/

func primes(upTo n: Int = 100) -> [Int] {
    guard n > 2 else { return [0] }
    var result = [Int]()
    var arr = Array(2..<n)
    
    while !arr.isEmpty {
        result.append(arr.removeFirst())
        
        arr.removeAll { $0.isMultiple(of: result.last!) }
    }
    return result
}

print(primes())
print(primes(upTo: 5))
