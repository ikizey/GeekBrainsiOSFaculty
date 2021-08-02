extension FloatingPointSign {
    var string: String {
        switch self {
        case .plus:
            return "+"
        case .minus:
            return "-"
        }
    }
}
