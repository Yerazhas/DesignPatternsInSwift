import UIKit

class CircleHole {
    private let radius: Double
    
    init(radius: Double)  {
        self.radius = radius
    }
    
    func getRadius() -> Double {
        return radius
    }
    
    func fits(peg: CirclePeg) -> Bool {
        return getRadius() >= peg.getRadius()
    }
}

class CirclePeg {

    private let radius: Double
    
    init(radius: Double) {
        self.radius = radius
    }
    
    func getRadius() -> Double {
        return radius
    }
}

class SquarePeg {
    
    private let width: Double
    
    init(width: Double) {
        self.width = width
    }
    
    func getWidth() -> Double {
        return width
    }
}

class SquareAdapter: CirclePeg {

    private let peg: SquarePeg
    
    init(squarePeg: SquarePeg) {
        self.peg = squarePeg
        super.init(radius: 0)
    }
    
    override func getRadius() -> Double {
        return pow(2 * pow(peg.getWidth(), 2), 1/2)
    }
}


let circleHole = CircleHole(radius: 10.0)
let circlePeg = CirclePeg(radius: 10.0)
let squarePeg = SquarePeg(width: 5.0)
let squareAdapter = SquareAdapter(squarePeg: squarePeg)

print(circleHole.fits(peg: circlePeg))
print(circleHole.fits(peg: squareAdapter))
