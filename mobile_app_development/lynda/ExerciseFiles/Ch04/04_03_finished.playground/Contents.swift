
import Foundation

let binarySequence = sequence(first: 1, next: { $0 * 2 })

for x in binarySequence.prefix(11) {
    print(x)
}

let sequence1 = 1...3
let sequence2 = 4...6

let sequence3 = 7...100

struct State {
    var current: Int
    var iterators: [ClosedRangeIterator<Int>]
}

let state = State(current: 0, iterators: [
    sequence1.makeIterator(),
    sequence2.makeIterator(),
    sequence3.makeIterator()
])

let next = { (element: inout State) -> Int? in
    let e = element
    let c = element.current
    
    let next = c == e.iterators.count - 1 ? 0 : c + 1
    element.current = next
    return element.iterators[c].next()
}

for i in sequence(state: state, next: next) {
    print(i)
}
