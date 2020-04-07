//
//  ParallaxCell.swift
//  wallpaper
//
//  Created by Sunghyup Kim on 2020/04/06.
//  Copyright © 2020 SunghyupKim. All rights reserved.
//

import UIKit
import CoreMotion

class ParallaxCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var motionManager: CMMotionManager!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupParallax()
//        motionManager = CMMotionManager()
//        motionManager.startAccelerometerUpdates(to: .main, withHandler: setupMotionEffect(data:error:))
        
    }
    
    func configureCell(withImage image: UIImage, andDescription desc: String) {
        itemImageView.image = image
        descriptionLabel.text = desc
    }
    
    func setupParallax() {
        let min = CGFloat(-30)
        let max = CGFloat(30)
        
        let xMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.x", type: .tiltAlongHorizontalAxis)
        xMotion.minimumRelativeValue = min
        xMotion.maximumRelativeValue = max
        
        let yMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.y", type: .tiltAlongVerticalAxis)
        yMotion.minimumRelativeValue = min
        yMotion.maximumRelativeValue = max
        
        let motionEffectGroup = UIMotionEffectGroup()
        motionEffectGroup.motionEffects = [xMotion, yMotion]
        
        itemImageView.addMotionEffect(motionEffectGroup)
        
    }
//
//    func setupMotionEffect(data: CMAccelerometerData?, error: Error?) {
//        guard let accelerometerData = data else { return }
//
//        let x = accelerometerData.acceleration.x
//        let y = accelerometerData.acceleration.y
//
//
//    }
}
