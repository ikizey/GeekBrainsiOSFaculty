import Foundation

enum SquareEquationError: String, Error {
    case notSquareEquation = "Уравнение не является квадратным"
    case noRoots = "Уравнение не имеет корней"
}

class SquareEquation {
    
    let a: Double
    let b: Double
    let c: Double
    
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
    
    func solve() -> (Roots?, SquareEquationError?) {
        guard isSquare else {
            return (nil, .notSquareEquation)
        }
        guard discriminant >= 0 else {
            return (nil, .noRoots)
        }
        
        let roots =  discriminant > 0 ? twoRootsSolve : oneRootSolve
        return (roots, nil)
    }
}


extension SquareEquation {
    func solveTry() throws -> Roots {
        guard isSquare else {
            throw SquareEquationError.notSquareEquation
        }
        guard discriminant >= 0 else {
            throw SquareEquationError.noRoots
        }
        
        let roots =  discriminant > 0 ? twoRootsSolve : oneRootSolve
        return roots
    }
}
