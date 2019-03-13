import UIKit

protocol Strategy {
    func execute(a: Int, b: Int) -> Int
}

class AddStrategy: Strategy {
    func execute(a: Int, b: Int) -> Int {
        return a + b
    }
}

class SubstractStrategy: Strategy {
    func execute(a: Int, b: Int) -> Int {
        return a - b
    }
}

class Context {
    private var strategy: Strategy
    
    init(strategy: Strategy) {
        self.strategy = strategy
    }
    
    func setStrategy(_ strategy: Strategy) {
        self.strategy = strategy
    }
    
    func executeStrategy(a: Int, b: Int) -> Int {
        return strategy.execute(a: a, b: b)
    }
}

let context = Context(strategy: AddStrategy())
let sum = context.executeStrategy(a: 3, b: 4)
context.setStrategy(SubstractStrategy())
let difference = context.executeStrategy(a: 5, b: 3)
print(sum, difference)
