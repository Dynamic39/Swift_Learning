//
//  ViewController.swift
//  CustomCameraSample
//
//  Created by Samuel K on 2018. 3. 19..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

import UIKit
import AVFoundation // 해당 기능을 활용하여 캡쳐 기능을 활성화 한다.

class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
  
  //캡쳐 세션 활성화
  var captureSession = AVCaptureSession()
  
  //앞뒤 카메라를 설정한 프로퍼티를 설정한다.
  var backCamera:AVCaptureDevice?
  var frontCamera:AVCaptureDevice?
  var currentCamera:AVCaptureDevice?
  
  //아웃풋 내용을 담을 프로퍼티
  var photoOutput: AVCapturePhotoOutput?
  
  //카메라 레이아웃을 설정한다.
  var cameraPreviewLayer: AVCaptureVideoPreviewLayer?
  var image:UIImage?
  
  //Camera에 실시간으로 필터를 씌우기 위한 작업을 한다.
  let videoOutput = AVCaptureVideoDataOutput()
  

  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupCaptureSession()
    setupDevice()
    setupInputOutput()
    setupPreviewLayer()
    startRunningCaptureSession()
    
  }
  
  func setupCaptureSession() {
    captureSession.sessionPreset = AVCaptureSession.Preset.photo // 포토 프리셋 설정
    
  }
  
  func setupDevice() {
    
    //AvcaptureDevice를 사용할 타입 및 카메라를 설정한다.
    let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: AVMediaType.video, position: AVCaptureDevice.Position.unspecified)
    //디바이스를 설정한다.
    let devices = deviceDiscoverySession.devices
    
    for device in devices {
      //앞/뒤 어떤 카메라를 쓸지 결정한다.
      if device.position == AVCaptureDevice.Position.back {
        backCamera = device
      } else if device.position == AVCaptureDevice.Position.front {
        frontCamera = device
      }
    }
    
    currentCamera = backCamera
    
  }
  
  //캡쳐 내용의 인풋/아웃풋 내역을 작성한다.
  func setupInputOutput() {
    
    do {
      //캡쳐 인풋 데이터를 작성한다.
      let captureDeviceInput = try AVCaptureDeviceInput(device: currentCamera!)
      captureSession.addInput(captureDeviceInput)
      //아웃풋으로 나올 타입을 정한다(jpeg타입)
      photoOutput = AVCapturePhotoOutput()
      photoOutput?.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format: [AVVideoCodecKey:AVVideoCodecType.jpeg])], completionHandler: nil)
      captureSession.addOutput(photoOutput!)
      
      
    } catch {
      print("error")
      
    }
  }
  
  //Preview의 layer를 설정한다.
  func setupPreviewLayer() {
    
    //캡쳐 세션의 프리뷰레이어의 인스턴스 생성
    cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
    cameraPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill // 뷰 타입 설정
    cameraPreviewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait // 위치 설정
    
    //위치설정
    cameraPreviewLayer?.frame = self.view.frame
    self.view.layer.insertSublayer(cameraPreviewLayer!, at: 0)
    
  }
  
  func startRunningCaptureSession() {
    captureSession.startRunning()
    
  }
  
  func realTimeFilterAccess() {
    
    //videoOutput.setSampleBufferDelegate(self, queue: dispatch_queue_create("sample buffer delegate", DISPATCH_QUEUE_SERIAL))
    videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue.global())
    captureSession.addOutput(videoOutput)
    
  }
  
  @IBAction func cameraBtn(_ sender: Any) {
    let settings = AVCapturePhotoSettings()
    photoOutput?.capturePhoto(with: settings, delegate: self)
    
    
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showPhotoSegue" {
      let previewVC = segue.destination as! PreviewViewController
      previewVC.image = image
      
    }
  }
}

extension ViewController: AVCapturePhotoCaptureDelegate {
  
  //사진 캡쳐가 끝난 다음에 메서드
  func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
    if let imageData = photo.fileDataRepresentation() {
      image = UIImage(data: imageData)
      performSegue(withIdentifier: "showPhotoSegue", sender: nil)
      
    }
  }
  
  
}

