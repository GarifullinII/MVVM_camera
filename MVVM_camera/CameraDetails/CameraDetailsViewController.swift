//
//  ViewController.swift
//  MVVM_camera
//
//  Created by Ildar Garifullin on 19/10/2022.
//

import UIKit

class CameraDetailsViewController: UIViewController {

    @IBOutlet private var flashButton: UIButton!
    @IBOutlet private var livePhotoButton: UIButton!
    
    var viewModel: CameraDetailsViewModelProtocol = CameraDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureFlashButton()
        configureLivePhotoButton()
    }
    
    @IBAction func didTapFlashButton() {
        viewModel.isFlashEnabled = !viewModel.isFlashEnabled
        configureFlashButton()
    }
    
    @IBAction func didTapLivePhotoButton() {
        viewModel.isLivePhotoEnabled = !viewModel.isLivePhotoEnabled
        configureLivePhotoButton()
    }
    
    private func configureFlashButton() {
        let systemName = viewModel.isFlashEnabled ? "lightbulb" : "lightbulb.slash"
        flashButton.setImage(UIImage(systemName: systemName), for: .normal)
    }
    
    private func configureLivePhotoButton() {
        let systemName = viewModel.isFlashEnabled ? "livephoto" : "livephoto.slash"
        livePhotoButton.setImage(UIImage(systemName: systemName), for: .normal)
    }
}

