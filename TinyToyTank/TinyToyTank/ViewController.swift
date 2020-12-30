//
//  ViewController.swift
//  TinyToyTank
//
//  Created by njuios on 2020/12/21.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var arView: ARView!
    var isActionPlaying: Bool = false
    var tankAnchor: TinyToyTank._TinyToyTank?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Load the "Box" scene from the "Experience" Reality File
        let tankAnchor = try! TinyToyTank.load_TinyToyTank()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(tankAnchor)
        
        tankAnchor.actions.actionComplete.onAction = { _ in
          self.isActionPlaying = false
        }
    }
    
    @IBAction func turretleftpressed(_ sender: UIButton)
    {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }
        tankAnchor!.notifications.turretLeft.post()

    }
    
    @IBAction func turretrightpressed(_ sender: UIButton)
    {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }
        tankAnchor!.notifications.turretRight.post()
        
    }
    
    @IBAction func turretfirepressed(_ sender: UIButton)
    {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }
        tankAnchor!.notifications.cannonFire.post()
    }
    
    @IBAction func tankleftpressed(_ sender: UIButton)
    {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }
        tankAnchor!.cannon?.setParent(
          tankAnchor!.tank, preservingWorldTransform: true)
        tankAnchor!.notifications.tankLeft.post()

    }
    
    @IBAction func tankforwardpressed(_ sender: UIButton)
    {
        tankAnchor!.cannon?.setParent(
          tankAnchor!.tank, preservingWorldTransform: true)
        tankAnchor!.notifications.tankForward.post()
    }
    
    @IBAction func tankrightpressed(_ sender: UIButton)
    {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }
        tankAnchor!.cannon?.setParent(
          tankAnchor!.tank, preservingWorldTransform: true)
        tankAnchor!.notifications.tankRight.post()
    }
    
    
}
