import UIKit

protocol Shape {
    func move(x: CGFloat, y: CGFloat)
    func draw()
    func accept(v: Visitor)
}

extension Shape {
    func move(x: CGFloat, y: CGFloat) {
        print("moving")
    }
    
    func draw() {
        print("drawing")
    }
}

protocol Visitor {
    func visitDot(d: Dot)
    func visitRectangle(r: Rectangle)
    func visitTriangle(t: Triangle)
}

// Shape implementations

class Dot: Shape {
    func accept(v: Visitor) {
        v.visitDot(d: self)
    }
    
    func draw() {
        print("drawing dot")
    }
    
    deinit {
        print("deinitializing dot")
    }
}

class Rectangle: Shape {
    func accept(v: Visitor) {
        v.visitRectangle(r: self)
    }
    
    func draw() {
        print("drawing rectangle")
    }
}

class Triangle: Shape {
    func accept(v: Visitor) {
        v.visitTriangle(t: self)
    }
    
    func draw() {
        print("drawing triangle")
    }
}

// Visitor implementations

class XMLVisitor: Visitor {
    func visitDot(d: Dot) {
        d.draw()
    }
    
    func visitTriangle(t: Triangle) {
        t.draw()
    }
    
    func visitRectangle(r: Rectangle) {
        r.draw()
    }
    
    deinit {
        print("deinitializing xmlvisitor")
    }
}

let allShapes: [Shape] = [Dot(), Rectangle(), Triangle()]
let xmlExportVisitor = XMLVisitor()

for shape in allShapes {
    shape.accept(v: xmlExportVisitor)
}
