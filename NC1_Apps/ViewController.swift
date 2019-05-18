//
//  ViewController.swift
//  NC1_Apps
//
//  Created by I Putu Krisna on 17/05/19.
//  Copyright © 2019 I Putu Krisna. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

//    var audioPlayer: AVAudioPlayer?
    var recordButton: UIButton!
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    
    @IBOutlet weak var tryButton: RoundedButton!
    override func viewDidLoad() {
        
//        AVAudioSession.sharedInstance().requestRecordPermission()
        super.viewDidLoad()
        recordSound()
        
    }
    
    var session: AVAudioSession = AVAudioSession.sharedInstance()
    @IBAction func tryButtonTapped(_ sender: RoundedButton) {
        
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: .curveEaseOut, animations: {
            self.tryButton.frame = CGRect(x: CGFloat.random(in: 100...self.view.frame.width-100),
                                          y: CGFloat.random(in: 100...self.view.frame.height-100),
                                          width: 100, height: 100)
            self.tryButton.backgroundColor = UIColor(red: CGFloat.random(in: 0...255)/255, green: CGFloat.random(in: 0...255)/255, blue: CGFloat.random(in: 0...255)/255, alpha: 1)
    
        })
        
//        let session = AVAudioSession.sharedInstance()
//        if (session.responds(to: #selector(AVAudioSession.requestRecordPermission(_:)))) {
//            AVAudioSession.sharedInstance().requestRecordPermission({(granted: Bool)-> Void in
//                if granted {
//                    print("granted")
//
//                    do {
//                        try self.session.setCategory(AVAudioSession.Category.playAndRecord)
//                        try self.session.setActive(true)
//                    }
//                    catch {
//
//                        print("Couldn't set Audio session category")
//                    }
//                } else{
//                    print("not granted")
//                }
//            })
//        }
        recordSound()
        
    }

    func recordSound() {
        
        recordingSession = AVAudioSession.sharedInstance()
        
        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission() { [unowned self] allowed in
                DispatchQueue.main.async {
                    if allowed {
                        self.loadRecordingUI()
                    } else {
                        // failed to record!
                    }
                }
            }
        } catch {
            // failed to record!
        }
    
    }
    
    func loadRecordingUI() {
        
        recordButton = RoundedButton(frame: CGRect(x: 64, y: 64, width: 128, height: 64))
        recordButton.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        recordButton.setTitle("Tap to Record", for: .normal)
        recordButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
        recordButton.addTarget(self, action: #selector(recordTapped), for: .touchUpInside)
        view.addSubview(recordButton)
        
    }
    
    func startRecording() {
        
        let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.m4a")
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.delegate = self as? AVAudioRecorderDelegate
            audioRecorder.record()
            
            recordButton.setTitle("Tap to Stop", for: .normal)
        } catch {
            finishRecording(success: false)
        }
        
    }
    
    func getDocumentsDirectory() -> URL {
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
        
    }
    
    func finishRecording(success: Bool) {
        
        audioRecorder.stop()
        audioRecorder = nil
        
        if success {
            recordButton.setTitle("Tap to Re-record", for: .normal)
        } else {
            recordButton.setTitle("Tap to Record", for: .normal)
            // recording failed :(
        }
        
    }
    
    @objc func recordTapped() {
        
        if audioRecorder == nil {
            startRecording()
        } else {
            finishRecording(success: true)
        }
        
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        
        if !flag {
            finishRecording(success: false)
        }
        
    }
    
}

