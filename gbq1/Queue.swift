struct Queue<T> where T: Comparable {
    /// FIFO queue
    
    internal var elements: [T]
    
    init() {
        self.elements = []
    }
    
    init<S: Sequence>(_ sequence: S) where S.Element == T {
        self.elements = [T]()
        for element in sequence {
            elements.append(element)
        }
    }
    
    mutating func push(newElement: T) {
        elements.append(newElement)
    }
    
    mutating func pop() -> T {
        elements.removeFirst()
    }
    
    func filter(_ function: (T) -> Bool) -> Queue<T> {
        var newElements = [T]()
        for element in self {
            if let element = element {
                if function(element) {
                    newElements.append(element)
                }
            }
        }
        return Queue(newElements)
    }
    
    func map(_ function: (T) -> T) -> Queue<T> {
        var newElements = [T]()
        for element in self {
            if let element = element {
                let newElement = function(element)
                newElements.append(newElement)
            }
        }
        return Queue(newElements)
    }
    
    func reduce(_ startValue: T, _ function: (T, T) -> T) -> T {
        var value = startValue
        for element in self {
            if let element = element {
                value = function(value, element)
            }
        }
        return value
    }
}
