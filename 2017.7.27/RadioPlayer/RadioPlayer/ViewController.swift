//
//  ViewController.swift
//  RadioPlayer
//
//  Created by Benny Davidovitz on 27/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var urlString = "http://jradio.ilcast.com:8000/livemusic"
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet var pauseButton: UIButton!
    var player : AVPlayer?
    

    @IBAction func playAction(_ sender: Any) {
        playButton.isEnabled = false
        pauseButton.isEnabled = true
        
        player?.play()
    }
    
    @IBAction func pauseAction(_ sender: UIButton) {
        sender.isEnabled = false
        playButton.isEnabled = true
        
        player?.pause()
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        player?.volume = sender.value
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do{
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print(error)
        }
        
        try? AVAudioSession.sharedInstance().setMode(AVAudioSessionCategoryPlayback)
        
        if let url = URL(string: urlString){
            self.player = AVPlayer(url: url)
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

