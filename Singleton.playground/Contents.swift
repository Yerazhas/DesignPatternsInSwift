import UIKit

class DataProvider {
    
    static let shared = DataProvider()
    
    private init() {  }
 
    func getData() -> [Data] {
        return []
    }
}

func main() {
    let provider = DataProvider.shared
    
    let data = provider.getData()
}
