import UIKit

class Logistics {
    
}

protocol Transport {
    func deliver()
}

class Truck: Transport {
    func deliver() {
        print("deliver by road")
    }
}

class Ship: Transport {
    func deliver() {
        print("deliver by water")
    }
}

protocol Creator {
    func createTransport() -> Transport
}

class TruckCreator: Creator {
    func createTransport() -> Transport {
        return Truck()
    }
}

class ShipCreator: Creator {
    func createTransport() -> Transport {
        return Ship()
    }
}


// Example with dialogs and buttons

protocol Dialog {
    func renderWindow()
    func createButton() -> Button
}

extension Dialog {
    func renderWindow() {
        let okButton = createButton()
        okButton.onClick()
        okButton.render()
    }
}

protocol Button {
    func render()
    func onClick()
}

class WindowsDialog: Dialog {
    func createButton() -> Button {
        return WindowsButton()
    }
}

class WebDialog: Dialog {
    func createButton() -> Button {
        return WebButton()
    }
}

class WindowsButton: Button {
    func render() {
        print("rendering windows button")
    }
    
    func onClick() {
        print("windows click action")
    }
}

class WebButton: Button {
    func render() {
        print("rendering web button")
    }
    
    func onClick() {
        print("web click action")
    }
}

class Application {
    private let dialog: Dialog
    
    init() {
        let config = getAppConfig()
        if config.OS == "windows" {
            dialog = WindowsDialog()
        } else {
            dialog = WebDialog()
        }
    }
    
    func main() {
        dialog.renderWindow()
    }
    
    private func getAppConfig() -> Config {
        return Config(OS: "windows")
    }
}

class Config {
    let OS: String
    
    init(OS: String) {
        self.OS = OS
    }
}
