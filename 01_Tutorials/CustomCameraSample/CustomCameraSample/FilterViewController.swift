//
//  FilterViewController.swift
//  CustomCameraSample
//
//  Created by Samuel K on 2018. 3. 20..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

import UIKit
import AVFoundation

class FilterViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
  
  //캡쳐 세션 가지고 오기
  var captureSession = AVCaptureSession()
  
  //각각 카메라 세팅
  var backCamera: AVCaptureDevice?
  var frontCamera: AVCaptureDevice?
  var currentCamera: AVCaptureDevice?
  
  //사진 아웃풋에 대한 프로퍼티 설정
  var photoOutput: AVCapturePhotoOutput?
  var orientation: AVCaptureVideoOrientation = .portrait
  
  //필터 사용시 사용할 컨텍스트 설정
  let context = CIContext()
  
  //뷰 화면
  @IBOutlet weak var filteredImage: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupDevice()
    setupInputOutput()
  }
  
  override func viewDidLayoutSubviews() {
    //레이아웃 설정
    orientation = AVCaptureVideoOrientation(rawValue: UIApplication.shared.statusBarOrientation.rawValue)!
  }
  
  //뷰가 나타날때마다 작동하는 메서드를 호출한다.
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    
    //비디오 타입이 인증이 되면, 메인 큐에서 인풋 파일을 확인한다.
    if AVCaptureDevice.authorizationStatus(for: AVMediaType.video) != .authorized
    {
      
      AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler:
        { (authorized) in
          DispatchQueue.main.async
            {
              if authorized
              {
                self.setupInputOutput()
              }
          }
      })
    }
  }
  
  func setupDevice() {
    let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: AVMediaType.video, position: AVCaptureDevice.Position.unspecified)
    let devices = deviceDiscoverySession.devices
    
    for device in devices {
      if device.position == AVCaptureDevice.Position.back {
        backCamera = device
      }
      else if device.position == AVCaptureDevice.Position.front {
        frontCamera = device
      }
    }
    
    currentCamera = backCamera
  }
  
  func setupInputOutput() {
    do {
      setupCorrectFramerate(currentCamera: currentCamera!)
      let captureDeviceInput = try AVCaptureDeviceInput(device: currentCamera!)
      captureSession.sessionPreset = AVCaptureSession.Preset.hd1280x720
      if captureSession.canAddInput(captureDeviceInput) {
        captureSession.addInput(captureDeviceInput)
      }
      let videoOutput = AVCaptureVideoDataOutput()
      
      videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "sample buffer delegate", attributes: []))
      if captureSession.canAddOutput(videoOutput) {
        captureSession.addOutput(videoOutput)
      }
      captureSession.startRunning()
    } catch {
      print(error)
    }
  }
  
  
  func setupCorrectFramerate(currentCamera: AVCaptureDevice) {
    for vFormat in currentCamera.formats {
      //see available types
      //print("\(vFormat) \n")
      
      //프레임 레이트를 설정한다.
      var ranges = vFormat.videoSupportedFrameRateRanges as [AVFrameRateRange]
      let frameRates = ranges[0]
      
      do {
        //set to 240fps - available types are: 30, 60, 120 and 240 and custom
        // lower framerates cause major stuttering
        if frameRates.maxFrameRate == 240 {
          try currentCamera.lockForConfiguration()
          currentCamera.activeFormat = vFormat as AVCaptureDevice.Format
          //for custom framerate set min max activeVideoFrameDuration to whatever you like, e.g. 1 and 180
          currentCamera.activeVideoMinFrameDuration = frameRates.minFrameDuration
          currentCamera.activeVideoMaxFrameDuration = frameRates.maxFrameDuration
        }
      }
      catch {
        print("Could not set active format")
        print(error)
      }
    }
  }
  
  func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
    connection.videoOrientation = orientation
    let videoOutput = AVCaptureVideoDataOutput()
    videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue.global())
    
    let comicEffect = CIFilter(name: "CISepiaTone") // 실제 필터링이 적용되는 값
    
    let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer)
    let cameraImage = CIImage(cvImageBuffer: pixelBuffer!)
    
    //필터링의 세부 내용이 적용 되는 값
    comicEffect!.setValue(cameraImage, forKey: kCIInputImageKey)
    comicEffect?.setValue(0.7, forKey: kCIInputIntensityKey)
    
    let cgImage = self.context.createCGImage(comicEffect!.outputImage!, from: cameraImage.extent)!
    
    //스레드를 메인큐로 돌림
    DispatchQueue.main.async {
      let filteredImage = UIImage(cgImage: cgImage)
      self.filteredImage.image = filteredImage
    }
  }
}
