//
//  ScannnerViewController.swift
//  Hops-Hackaton
//
//  Created by Kary Martinez on 2/16/21.
//  Copyright © 2021 Kary Martinez. All rights reserved.
//

import UIKit
import Vision
import AVFoundation
import SafariServices

class ScannnerViewController: UIViewController {
      var captureSession = AVCaptureSession()

    var productCatalog = [ProductWrapper]()
    
      // TODO: Make VNDetectBarcodesRequest variable
      lazy var detectBarcodeRequest = VNDetectBarcodesRequest { request, error in
        guard error == nil else {
          self.showAlert(withTitle: "Barcode error", message: error?.localizedDescription ?? "error")
          return
        }
        self.processClassification(request)
      }
    private func NavigationBarTitle() {
        self.title = " Scan "
     view.tintColor = .systemGreen
    }
    
 
      // MARK: - Override Functions
      override func viewDidLoad() {
        super.viewDidLoad()
        checkPermissions()
        setupCameraLiveView()
      }
      override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // TODO: Stop Session
        captureSession.stopRunning()
      }
    }


    extension ScannnerViewController {
      // MARK: - Camera
      private func checkPermissions() {
        // TODO: Checking permissions
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .notDetermined:
          AVCaptureDevice.requestAccess(for: .video) { [self] granted in
            if !granted {
              self.showPermissionsAlert()
            }
          }
        case .denied, .restricted:
          showPermissionsAlert()
        default:
          return
        }
      }

      private func setupCameraLiveView() {
        // TODO: Setup captureSession
        captureSession.sessionPreset = .hd1280x720

        // TODO: Add input
        let videoDevice = AVCaptureDevice
          .default(.builtInWideAngleCamera, for: .video, position: .back)

        guard
          let device = videoDevice,
          let videoDeviceInput = try? AVCaptureDeviceInput(device: device),
          captureSession.canAddInput(videoDeviceInput) else {
            showAlert(
              withTitle: "Cannot Find Camera",
              message: "There seems to be a problem with the camera on your device.")
            return
          }

        captureSession.addInput(videoDeviceInput)

        // TODO: Add output
        let captureOutput = AVCaptureVideoDataOutput()
        // TODO: Set video sample rate
        captureOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: Int(kCVPixelFormatType_32BGRA)]
        captureOutput.setSampleBufferDelegate(self, queue: DispatchQueue.global(qos: DispatchQoS.QoSClass.default))
        captureSession.addOutput(captureOutput)

        configurePreviewLayer()

        // TODO: Run session
        captureSession.startRunning()
      }

      // MARK: - Vision
      func processClassification(_ request: VNRequest) {
        // TODO: Main logic
        guard let barcodes = request.results else { return }
        DispatchQueue.main.async { [self] in
          if self.captureSession.isRunning {
            self.view.layer.sublayers?.removeSubrange(1...)

            for barcode in barcodes {
              guard
                // TODO: Check for QR Code symbology and confidence score
                let potentialQRCode = barcode as? VNBarcodeObservation,
                potentialQRCode.symbology == .QR,
                potentialQRCode.confidence > 0.9
                else { return }

                self.observationHandler(for: potentialQRCode.payloadStringValue!)
            }
          }
        }
      }

      // MARK: - Handler
        private func observationHandler(for payload: String) {
          let alertVC = UIAlertController(title: "Vegan", message: "cheezits", preferredStyle: .alert)
                  alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                  present(alertVC, animated: true, completion: nil)
        }
        
//      func observationHandler(payload: String?) {
//        // TODO: Open it in Safari
//        guard
//          let payloadString = payload,
//          let url = URL(string: payloadString),
//          ["http", "https"].contains(url.scheme?.lowercased())
//        else { return }
//
//        let config = SFSafariViewController.Configuration()
//        config.entersReaderIfAvailable = true
//
//        let safariVC = SFSafariViewController(url: url, configuration: config)
//        safariVC.delegate = self
//        present(safariVC, animated: true)
//      }
    }


    // MARK: - AVCaptureDelegation
    extension ScannnerViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
      func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        // TODO: Live Vision
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }

        let imageRequestHandler = VNImageRequestHandler(
          cvPixelBuffer: pixelBuffer,
          orientation: .right)

        do {
          try imageRequestHandler.perform([detectBarcodeRequest])
        } catch {
          print(error)
        }
      }
    }


    // MARK: - Helper
    extension ScannnerViewController {
      private func configurePreviewLayer() {
        let cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        cameraPreviewLayer.videoGravity = .resizeAspectFill
        cameraPreviewLayer.connection?.videoOrientation = .portrait
        cameraPreviewLayer.frame = view.frame
        view.layer.insertSublayer(cameraPreviewLayer, at: 0)
      }

      private func showAlert(withTitle title: String, message: String) {
        DispatchQueue.main.async {
          let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
          alertController.addAction(UIAlertAction(title: "OK", style: .default))
          self.present(alertController, animated: true)
        }
      }

      private func showPermissionsAlert() {
        showAlert(
          withTitle: "Camera Permissions",
          message: "Please open Settings and grant permission for this app to use your camera.")
      }
    }


    // MARK: - SafariViewControllerDelegate
    extension ScannnerViewController: SFSafariViewControllerDelegate {
      func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        captureSession.startRunning()
      }
    
    
    

}



