extension Queue: CustomStringConvertible {
    var description: String {
        "Queue<\(T.self)>: <\(elements)>"
    }
}
