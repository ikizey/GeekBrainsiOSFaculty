import Foundation

extension SquareEquation: CustomStringConvertible {
    var description: String {
        if a == 0 && b == 0 && c == 0 { return "0 = 0" }
        
        var first: String
        var second: String
        var third: String
        let end = "= 0"
        
        first = format(a, pos: 1)
        second = format(b, pos: 2)
        third = format(c, pos: 3)
        
        return first + second + third + end
    }
    
    private func format(_ n: Double, pos: Int) -> String {
        if n ~= 0 { return "" }
        
        let f = formatDouble(n)
        let suffix = formatSuffix(pos: pos)
        let sign = formatSign(n)
        
        if pos == 1 && f == "1" {
            return "\(sign)\(suffix) "
        } else if pos == 2 && f == "1" {
            return "\(sign) \(suffix) "
        }
        
        return n == 0 ? "" : "\(sign) \(f)\(suffix) "
    }
    
    private func formatDouble(_ n: Double) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        return  String(describing: formatter.string(from: NSNumber(value: abs(n)))!)
    }
    
    private func formatSuffix(pos: Int) -> String {
        switch pos {
        case 1:
            return "x^2"
        case 2:
            return "x"
        default:
            return ""
        }
    }
    
    private func formatSign(_ n: Double) -> String {
        "\(n.sign.string)"
    }
}
