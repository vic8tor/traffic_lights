//
//  ViewController.swift
//  traffic_lights
//
//  Created by Victor on 08.12.2021.
//

import UIKit
enum CurrentLight {
    case red, yellow, green
}

class ViewController: UIViewController {
    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var greenView: UIView!
    @IBOutlet var switchButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    private let lithtIsOn: CGFloat = 1
    private let lightIsOff = 0.4
    private var currentLight = CurrentLight.red
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchButton.layer.cornerRadius = 10
        redView.alpha = lightIsOff
        yellowView.alpha = lightIsOff
        greenView.alpha = lightIsOff
}
    override func viewWillLayoutSubviews() {
        redView.layer.cornerRadius = redView.frame.size.width/2
        yellowView.layer.cornerRadius = yellowView.frame.size.width/2
        greenView.layer.cornerRadius = greenView.frame.size.width/2
    }
    
    @IBAction func startSwitch() {
        if switchButton.currentTitle == "Start" {
        switchButton.setTitle("Next", for: .normal)
        }
        switch currentLight {
        case .red:
            greenView.alpha = lightIsOff
            redView.alpha = lithtIsOn
            currentLight = .yellow
            messageLabel.textColor = .red
            messageLabel.text = "STOP"
        case .yellow:
            redView.alpha = lightIsOff
            yellowView.alpha = lithtIsOn
            currentLight = .green
            messageLabel.textColor = .yellow
            messageLabel.text = "WAIT"
        case .green:
            yellowView.alpha = lightIsOff
            greenView.alpha = lithtIsOn
            currentLight = .red
            messageLabel.textColor = .green
            messageLabel.text = "GO"
        }
    }
}
