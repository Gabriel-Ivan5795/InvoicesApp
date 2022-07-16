//
//  AddInvoicesView+Delegates.swift
//  InvoicesApp
//
//  Created by Gabriel Ivan on 09.05.2022.
//

import UIKit
import Vision
import VisionKit

extension AddInvoicesViewController: UIGestureRecognizerDelegate, VNDocumentCameraViewControllerDelegate, UITextFieldDelegate {
    
    @available(iOS 13.0, *)
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        controller.dismiss(animated: true) { [weak self] in
            self?.addInvoicesUIView.getScannedImageView().image = scan.imageOfPage(at: 0)
            
            self?.showAlert(_errorMessage: "Done")
            self?.hasScannedImage = true
            
            guard let cgImage = self?.addInvoicesUIView.getScannedImageView().image?.cgImage else { return }
            
            let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            let request = VNRecognizeTextRequest(completionHandler: self?.recognizeTextHandler)
            do {
                // Perform the text-recognition request.
                try handler.perform([request])
            } catch {
                print("Unable to perform the requests: \(error).")
            }
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField.isEqual(self.addInvoicesUIView.getTitleField().getInvoicesAppTextField().getField())) {
            self.addInvoicesUIView.getTitleField().getInvoicesAppTextField().getField().resignFirstResponder()
            self.addInvoicesUIView.getDescriptionField().getInvoicesAppTextField().getField().becomeFirstResponder()
        }
        
        if (textField.isEqual(self.addInvoicesUIView.getDescriptionField().getInvoicesAppTextField().getField())) {
            self.addInvoicesUIView.getDescriptionField().getInvoicesAppTextField().getField().resignFirstResponder()
        }
        
        return true
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if (textField.isEqual(self.addInvoicesUIView.getTitleField().getInvoicesAppTextField().getField())) {
            if (textField.text?.isValid() == true) {
                self.addInvoicesUIView.getTitleField().showLabelPlaceholder()
            } else {
                self.addInvoicesUIView.getTitleField().hideLabelPlaceholder()
            }
        }
        
        if (textField.isEqual(self.addInvoicesUIView.getDescriptionField().getInvoicesAppTextField().getField())) {
            if (textField.text?.isValid() == true) {
                self.addInvoicesUIView.getDescriptionField().showLabelPlaceholder()
            } else {
                self.addInvoicesUIView.getDescriptionField().hideLabelPlaceholder()
            }
        }
    }
    
    func recognizeTextHandler(request: VNRequest, error: Error?) {
        if #available(iOS 13.0, *) {
            guard let observations =
                    request.results as? [VNRecognizedTextObservation] else {
                return
            }
            let recognizedStrings = observations.compactMap { observation in
                // Return the string of the top VNRecognizedText instance.
                return observation.topCandidates(1).first?.string
            }
            
            print(recognizedStrings)
            var stringBuilder = String.init(format: "%@", "")
            for stringRecognized in recognizedStrings {
                if (stringRecognized.contains("Nume")) {
                    stringBuilder = String.init(format: "%@ %@", stringBuilder, stringRecognized)
                }
            }
            self.addInvoicesUIView.getDescriptionField().setValueField(_value: stringBuilder)
            // Process the recognized strings.
            //processResults(recognizedStrings)
        } else {
            // Fallback on earlier versions
        }
    }
}

