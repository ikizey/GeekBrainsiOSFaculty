import Foundation

extension Roots: CustomStringConvertible {
    var description: String {
        let r1 = formatDouble(x1)
        if let x2 = x2 {
            let r2 = formatDouble(x2)
            return "Два корня: x1 = \(r1); x2 = \(r2)"
        }
        return "Один корень: x = \(r1)"
    }
    
    private func formatDouble(_ n: Double) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return  String(describing: formatter.string(from: NSNumber(value: n))!)
    }
}
