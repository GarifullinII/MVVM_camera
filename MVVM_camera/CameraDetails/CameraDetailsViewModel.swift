//
//  CameraDetailsViewModel.swift
//  MVVM_camera
//
//  Created by Ildar Garifullin on 19/10/2022.
//

import AVFoundation
import Foundation
import UIKit

protocol CameraDetailsViewModelProtocol {
    var isFlashEnabled: Bool { get set }
    var isLivePhotoEnabled: Bool { get set }
    var isWideScreenAvailable: Bool { get }
    var isWideScreenEnabled: Bool { get set }
    var isCameraFlipAvailable: Bool { get }
    
    func getAvailableCameraMode() -> [CameraModel]
    func getRecentImage() -> UIImage?
}

// MARK: - CameraDetailsViewModel
class CameraDetailsViewModel {
    let userDefaults = UserDefaults.standard
    let dbManager = DBManager()
}

extension CameraDetailsViewModel: CameraDetailsViewModelProtocol {
    var isFlashEnabled: Bool {
        get {
            userDefaults.bool(forKey: "isFlashEnabled")
        }
        set {
            userDefaults.set(newValue, forKey: "isFlashEnabled")
        }
    }
    
    var isLivePhotoEnabled: Bool {
        get {
            userDefaults.bool(forKey: "isLivePhotoEnabled")
        }
        set {
            userDefaults.set(newValue, forKey: "isLivePhotoEnabled")
        }
    }
    
    var isWideScreenAvailable: Bool {
        if let _ = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) {
            return true
        } else {
            return false
        }
    }
    
    var isWideScreenEnabled: Bool {
        get {
            userDefaults.bool(forKey: "isWideScreenEnabled")
        }
        set {
            userDefaults.set(newValue, forKey: "isWideScreenEnabled")
        }
    }
    
    var isCameraFlipAvailable: Bool {
        if #available(iOS 3.0, *) {
            return true
        } else {
            return false
        }
    }
    
    func getAvailableCameraMode() -> [CameraModel] {
        var modes = [CameraModel]()
        
        modes.append(.photo)
        modes.append(.video)
        
        if let _ = AVCaptureDevice.default(.builtInDualWideCamera, for: .video, position: .back ) {
            modes.append(.portrait)
        }
        
        if #available(iOS 11.0, *) {
            modes.append(.slowMotion)
        }
        modes.append(.panorama)
        
        return modes
    }
    
    func getRecentImage() -> UIImage? {
        dbManager.getRecentImage()
    }
    
}
