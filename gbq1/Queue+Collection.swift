extension Queue: Collection {
    func index(after i: Int) -> Int {
        elements.index(after: i)
    }
    
    var startIndex: Int {
        elements.startIndex
    }
    
    var endIndex: Int {
        elements.endIndex
    }
    
    subscript(_ index: Int) -> T? {
        guard elements.indices.contains(index) else { return nil }
        return elements[index]
    }
}
