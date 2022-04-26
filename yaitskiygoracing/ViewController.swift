//
//  ViewController.swift
//  yaitskiygoracing
//
//  Created by Гость on 26.04.2022.
//

import UIKit

class ViewController: UIViewController {
    //1
    
    @IBOutlet weak var pcCar: UIImageView!
    @IBOutlet weak var UserCar: UIImageView!
    @IBOutlet weak var lineFinish: UIImageView!
    @IBOutlet weak var semaforLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    //2
    var stateSemafor: Int = 1
    var timerGame: Timer!
    var timerPC: Timer!
    
    //4
    @objc func intervalTimer() {
        
        stateSemafor += 1
        
        if stateSemafor > 2 {
            stateSemafor = 1
        }
        switch stateSemafor {
        case 1:
            semaforLabel.text = "STOP"
            semaforLabel.textColor = .red
        case 2:
            semaforLabel.text = "DRIVE"
            semaforLabel.textColor = .green
        default:
            break
        }
    }
    @objc func pcDrive() {
        //6
        if stateSemafor == 2 {
            pcCar.center.x += 10
            
        }
        
        if pcCar.center.x > lineFinish.center.x {
            resultLabel.isHighlighted = false
            resultLabel.text = "YOU LOSE!"
            resultLabel.textColor = .red
            timerPC.invalidate()
            timerGame.invalidate()
        }
    }

    @IBAction func startGame(_ sender: UIButton) {
        semaforLabel.isHidden = false
        
        //3
        timerGame =
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(intervalTimer), userInfo: nil, repeats: true)
        timerPC = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(pcDrive), userInfo: nil, repeats: true)
        
        
    }
    @IBAction func driveGame(_ sender: UIButton) {
        if stateSemafor == 2 {
            UserCar.center.x += 10
        } else if stateSemafor == 1 {
            UserCar.center.x -= 10
            
        }
        if UserCar.center.x > lineFinish.center.x {
            resultLabel.isHidden = false
            resultLabel.text = "YOU WIN!"
            resultLabel.textColor = .green
            timerPC.invalidate()
            timerGame.invalidate()
        }
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

