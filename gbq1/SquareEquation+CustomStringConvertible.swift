import Foundation

extension SquareEquation: CustomStringConvertible {
    // почти идеально форматирует
    // не хватает логики поиска реальной позиции для a b c
    var description: String {
        if a == 0 && b == 0 && c == 0 { return "0 = 0" }
        
        let first = format(a, atPosition: 1)
        let second = format(b, atPosition: 2)
        let third = format(c, atPosition: 3)
        let end = "= 0"

        return first + second + third + end
    }
    
    private func format(_ n: Double, atPosition position: Int) -> String {
        guard n != 0 else { return "" } //? !(n ~= 0)
        
        let sign = formatSign(n, for: position)
        let space = position == 1 ? "" : " "
        var value = formatDouble(n)
        let suffix = formatSuffix(for: position)
        
        if value == "1" && position != 3 {
            value = ""
        }
        
        return n == 0 ? "" : "\(sign)\(space)\(value)\(suffix) "
    }
    
    private func formatDouble(_ n: Double) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return  String(describing: formatter.string(from: NSNumber(value: abs(n)))!)
    }
    
    private func formatSuffix(for position: Int) -> String {
        switch position {
        case 1:
            return "x^2"
        case 2:
            return "x"
        default:
            return ""
        }
    }
    
    private func formatSign(_ n: Double, for position: Int) -> String {
        position == 1 && n.sign.string == "+"
            ? "" : "\(n.sign.string)"
    }
}
