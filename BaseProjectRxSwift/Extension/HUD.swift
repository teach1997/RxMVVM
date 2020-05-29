//
//  HUD.swift
//  BaseProjectRxSwift
//
//  Created by Kiều anh Đào on 5/29/20.
//  Copyright © 2020 Anhdk. All rights reserved.
//

import Foundation
import UIKit

class HUD: UIVisualEffectView {

    static let shared = HUD()
    
    let activityIndictor: UIActivityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.white)
    let blurEffect = UIBlurEffect(style: .dark)
    let vibrancyView: UIVisualEffectView
    let labelLoad: UILabel = UILabel()
    var width: CGFloat = 60.0
    var height: CGFloat = 60.0
    
    init() {
        self.vibrancyView = UIVisualEffectView(effect: UIVibrancyEffect(blurEffect: blurEffect))
        super.init(effect: blurEffect)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.vibrancyView = UIVisualEffectView(effect: UIVibrancyEffect(blurEffect: blurEffect))
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func setup() {
        contentView.addSubview(vibrancyView)
        contentView.addSubview(activityIndictor)
        activityIndictor.startAnimating()
    }
    
    func setLoadingText() {
        width = 100.0
        height = 80.0
        labelLoad.text = "Loading..."
        contentView.addSubview(labelLoad)
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        var setFrame: CGFloat = 2
        if height == 80.0 {
            setFrame = 3
        }
        
        if let superview = self.superview {
            let activityIndicatorSize: CGFloat = 40
            self.frame = CGRect(x: superview.frame.size.width / 2 - width / 2,
                                y: superview.frame.height / 2 - height / 2,
                                width: width,
                                height: height)
            labelLoad.frame = CGRect(x: 0,
                                 y: (height / setFrame - activityIndicatorSize / 2) + activityIndicatorSize,
                                 width: width,
                                 height: 30)
            labelLoad.textColor = UIColor.black
            labelLoad.font = UIFont.boldSystemFont(ofSize: 11)
            labelLoad.textAlignment = NSTextAlignment.center
            vibrancyView.frame = self.bounds
            activityIndictor.frame = CGRect(x: (width - activityIndicatorSize) / 2,
                                            y: height / setFrame - activityIndicatorSize / 2,
                                            width: activityIndicatorSize,
                                            height: activityIndicatorSize)
            layer.cornerRadius = 8.0
            layer.masksToBounds = true
        }
    }
    
    func showHUD() {
        self.isHidden = false
    }
    
    func hideHUD() {
        self.isHidden = true
    }
}

