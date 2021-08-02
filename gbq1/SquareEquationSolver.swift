import Foundation

enum SquareEquationSolverError: String, Error {
    case notSquareEquation = "Уравнение не является квадратным"
    case noRoots = "Уравнение не имеет корней"
}

struct Roots {
    let x1: Double
    let x2: Double?
    
    init(x1: Double, x2: Double? = nil) {
        self.x1 = x1
        self.x2 = x2
    }
}

extension Roots: CustomStringConvertible {
    var description: String {
        if let x2 = x2 {
            return "Two roots: x1 = \(x1); x2 = \(x2)"
        }
        return "One root: x1 = \(x1)"
    }
}

class SquareEquation {
    
    private let a: Double
    private let b: Double
    private let c: Double
    
    private var discriminant: Double {
        (b * b) - (4 * a * c)
    }
    
    private var isSquare: Bool {
        a != 0
    }
    
    init(a: Double, b: Double, c: Double) {
        self.a = a
        self.b = b
        self.c = c
    }
    
    private var twoRootsSolve: Roots {
        let x1 = (-b + sqrt(discriminant)) / (2 * a)
        let x2 = (-b - sqrt(discriminant)) / (2 * a)
        return Roots(x1: x1, x2: x2)
    }
    
    private var oneRootSolve: Roots {
        let x1 = -b / (2 * a)
        return Roots(x1: x1)
    }
    
    func solve() -> (Roots?, SquareEquationSolverError?) {
        guard isSquare else { return (nil, .notSquareEquation) }
        guard discriminant >= 0 else { return (nil, .noRoots) }
        
        let roots =  discriminant > 0 ? twoRootsSolve : oneRootSolve
        return (roots, nil)
    }
}

extension SquareEquation: CustomStringConvertible {
    var description: String {
        var first: String
        var second: String
        var third: String
        var end = " = 0"
        first = a == 0 ? "" : "\(a)x^2 "
        
        if b == 0 {
            second = ""
        } else if b > 0 {
            second = "+ \(b) "
        }
    }
}
