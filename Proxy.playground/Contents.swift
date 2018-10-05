import UIKit

/*
 Example with Service and Proxy classes
 */

protocol ServiceInterface {
    func operation()
}

class Service: ServiceInterface {
    func operation() {
        print("some heavy task is done here")
    }
}

class Proxy: ServiceInterface {
    
    private let realService: Service
    
    init(service: Service) {
        self.realService = service
    }
    
    func operation() {
        if checkAccess() {
            realService.operation()
        } else {
            print("some random task is done here")
        }
    }
    
    func checkAccess() -> Bool {
        return true
    }
}

/*
 Example with ThirdPartyYoutubeClass (real service) and CachedYoutubeClass (proxy service)
 */

protocol ThirdPartyYoutubeLib {
    func listVideos() -> [String]
    func getVideoInfo(id: Int) -> [String: Any]
    func downloadVideo(id: Int) -> Data
}

class ThirdPartyYoutubeClass {
    func listVideos() -> [String] {
        return []
    }
    
    func getVideoInfo(id: Int) -> [String: Any] {
        return [:]
    }
    
    func downloadVideo(id: Int) -> Data {
        return Data()
    }
}

class CachedYoutubeClass: ThirdPartyYoutubeLib {
    
    private let youtubeService: ThirdPartyYoutubeClass
    private let cache: [String]
    private let videoCache: [String: Any]
    private var needReset: Bool
    
    init(realService: ThirdPartyYoutubeClass) {
        self.youtubeService = realService
    }
    
    func listVideos() -> [String] {
        if needReset {
            cache = youtubeService.listVideos()
        }
        
        return cache
    }
    
    func getVideoInfo(id: Int) -> [String : Any] {
        if needReset {
            videoCache = youtubeService.getVideoInfo(id: id)
        }
        
        return videoCache
    }
    
    func downloadVideo(id: Int) -> Data {
        if let video = videoCache["\(id)"] as? Data {
            return video
        }
        if needReset {
            return youtubeService.downloadVideo(id: id)
        }
    }
}

class YoutubeManager {
    private let service: ThirdPartyYoutubeLib
    
    init(service: ThirdPartyYoutubeLib) {
        self.service = service
    }
    
    func renderVideoPage(id: Int) {
        let info = service.getVideoInfo(id: id)
    }
    
    func renderListPanel(id: Int) {
        let list = service.listVideos()
    }
}

let youtubeService = ThirdPartyYoutubeClass()
let youtubeProxy = CachedYoutubeClass(realService: youtubeService)
let manager = YoutubeManager(service: youtubeProxy)

