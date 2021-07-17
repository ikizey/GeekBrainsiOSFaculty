
func main() {
    var queue = Queue(["Alice", "Bob", "John", "Jack", "Martha", "Zoey"])
    
    print(queue)
    print(queue[0]!)
    print(queue[3]!)
    print(queue[-1] ?? "nil", queue[999] ?? "nil")
    print(queue.pop())
    queue.push(newElement: "Alice")
    
    print(queue.count)
    print(queue.first ?? "nil")
    
    let upperQ = queue.map { $0.uppercased() }
    print(upperQ)
    
    let q2 = queue.filter { $0 < "J" }
    print(q2)
    for element in q2 {
        print(element!)
    }
    
    let intQ = Queue(Array(0..<100))
    let evenIntQ = intQ.filter { $0.isMultiple(of: 2) }
    let squaredIntQ = intQ.map { $0 * $0 }
    print(intQ)
    print(evenIntQ)
    print(squaredIntQ)
    print(evenIntQ.reduce(0, +))
    
}

main()
