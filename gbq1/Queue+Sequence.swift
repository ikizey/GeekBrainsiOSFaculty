//extension Queue: Sequence {
//    func makeIterator() -> IndexingIterator<[T]> {
//        return elements.makeIterator()
//    }
//}


// this works too
//extension Queue: Sequence {
//        func makeIterator() -> QueueIterator<T> {
//            return QueueIterator(self)
//        }
//}
//
//struct QueueIterator<T>: IteratorProtocol where T: Comparable {
//    let queue: Queue<T>
//
//    var times = 0
//
//    init(_ queue: Queue<T>) {
//        self.queue = queue
//    }
//
//    mutating func next() -> T? {
//        guard times < queue.count - 1 else { return nil }
//
//        let nextElement = queue[times + 1]
//        times += 1
//        return nextElement
//    }
//}

