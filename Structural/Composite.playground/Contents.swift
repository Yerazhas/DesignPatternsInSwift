import UIKit

protocol OrderElement {
    func getPrice() -> Double
}

extension OrderElement {
    func getPrice() -> Double {
        return 5.0
    }
}

class Product: OrderElement {
    func getPrice() -> Double {
        return 13.0
    }
}

class Apple: Product {
    override func getPrice() -> Double {
        return 12.0
    }
}

class Box: OrderElement {
    private var products: [OrderElement]
    
    init(products: [OrderElement]) {
        self.products = products
    }
    
    func add(_ product: OrderElement) {
        products.append(product)
    }
    
    func removeLast() {
        products.removeLast()
    }
    
    func getPrice() -> Double {
        var price: Double = 0.0
        for product in products {
            price += product.getPrice()
        }
        
        return price
    }
}


let apple1: OrderElement = Apple()
let apple2 = Apple()
let randomProduct1: OrderElement = Product()
let randomProduct2 = Product()

let box = Box(products: [apple1, apple2, randomProduct1, randomProduct2, Box(products: [apple1, apple2, apple1])])
print(box.getPrice()) // 86.0

/*Enum variant for calculating price of order
 Works with only primitive types as associated values in enum cases,
 otherwise better to work with Composite pattern using classes, structs.
 */

indirect enum OrderElement1 {
    case Product(price: Double)
    case Box([OrderElement1])
}

func getPrice(_ orderElement: OrderElement1) -> Double {
    var sum: Double = 0.0
    switch orderElement {
    case .Product(let price):
        sum += price
    case .Box(let orderElements):
        for orderElement in orderElements {
            sum += getPrice(orderElement)
        }
    }
    
    return sum
}

let apple1 = OrderElement1.Product(price: 12.0)
let apple2 = OrderElement1.Product(price: 15.0)
let apple3 = OrderElement1.Product(price: 17.0)

let smallerBox = OrderElement1.Box([apple1, apple2, apple3, apple3])
let biggerBox = OrderElement1.Box([apple2, apple1, apple3, smallerBox])

print(getPrice(biggerBox)) // 105.0
