func main() {
    
    let eq1 = SquareEquation(a: 0, b: 20, c: 30)
    let eq2 = SquareEquation(a: 3, b: 7, c: -6)
    let eq3 = SquareEquation(a: 1, b: -1, c: 3)
    let eq4 = SquareEquation(a: 1, b: 12, c: 36)
    let eq5 = SquareEquation(a: 3, b: 0, c: -27)
    let eq6 = SquareEquation(a: -22, b: 0, c: 0)
    let equations = [eq1, eq2, eq3, eq4, eq5, eq6]
    
    print("==========")
    print("Optional binding\n")
    letSolve(equations)

    print("\n==========")
    print("Throws\n")
    trySolve(equations)
}

func trySolve(_ eqs: [SquareEquation]) {
    for eq in eqs {
        do {
            print(eq)
            let roots = try eq.solveTry()
            print(roots)
        } catch SquareEquationError.noRoots {
            print(SquareEquationError.noRoots.rawValue)
        } catch SquareEquationError.notSquareEquation {
            print(SquareEquationError.notSquareEquation.rawValue)
        } catch {
            print(error.localizedDescription)
        }
        print()
    }
}

func letSolve(_ eqs: [SquareEquation]) {
    for eq in eqs {
        let result = eq.solve()
        print(eq)
        if let roots = result.0 {
            print(roots)
        } else if let error = result.1 {
            print(error.rawValue)
        }
        print()
    }
}

main()
