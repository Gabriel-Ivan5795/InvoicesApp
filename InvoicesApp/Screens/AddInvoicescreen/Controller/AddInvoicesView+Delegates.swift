//
//  AddInvoicesView+Delegates.swift
//  InvoicesApp
//
//  Created by Gabriel Ivan on 09.05.2022.
//

import UIKit
import VisionKit

extension AddInvoicesViewController: UIGestureRecognizerDelegate, VNDocumentCameraViewControllerDelegate {
    
    @available(iOS 13.0, *)
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        controller.dismiss(animated: true) { [weak self] in
            self?.addInvoicesUIView.getScannedImageView().image = scan.imageOfPage(at: 0)
            
            self?.showAlert(_errorMessage: "Done")
        }
    }
    
    @available(iOS 13.0, *)
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
        controller.dismiss(animated: true) { [weak self] in
            self?.addInvoicesUIView.getScannedImageView().image = nil
        }
    }
    
    @available(iOS 13.0, *)
    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
        controller.dismiss(animated: true) { [weak self] in
            self?.addInvoicesUIView.getScannedImageView().image = nil
        }
    }
}

