//
//  CameraDetailsViewModel.swift
//  MVVM_camera
//
//  Created by Ildar Garifullin on 19/10/2022.
//

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
