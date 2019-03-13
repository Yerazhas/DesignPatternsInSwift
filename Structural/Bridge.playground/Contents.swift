import UIKit

class Remote {
    private let device: Device
    
    init(device: Device) {
        self.device = device
    }
    
    func togglePower() {
        device.isEnabled.toggle()
    }
    
    func volumeDown() {
        device.setVolume(device.getVolume() - 10)
    }
    
    func volumeUp() {
        device.setVolume(device.getVolume() + 10)
    }
}

class Device {
    var isEnabled = false
    private var volume = 0
    
    func enable() {
        isEnabled = true
    }
    
    func disable() {
        isEnabled = false
    }
    
    func setVolume(_ percent: Int) {
        self.volume = volume
    }
    
    func getVolume() -> Int {
        return volume
    }
}

class TV: Device {
    //override superclass methods if needed
}

class Radio: Device {
    // override superclass methods if needed
}

let tv = TV()
var remote = Remote(device: tv)
remote.togglePower()

let radio = Radio()
remote = Remote(device: radio)
remote.togglePower()
remote.volumeUp()
remote.volumeUp()
remote.volumeUp()


