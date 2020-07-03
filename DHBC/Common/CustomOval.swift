//
//  CustomOval.swift
//  DHBC
//
//  Created by Kiều anh Đào on 7/3/20.
//  Copyright © 2020 Anhdk. All rights reserved.
//

import UIKit

class CustomOval: UIView {
    
    var color: UIColor
    var width: Double
    var height: Double
    var x: Double
    var y: Double
    
    init(color: UIColor, width: Double, height: Double, x: Double, y: Double) {
        self.color = color
        self.width = width
        self.height = height
        self.x = x
        self.y = y
        super.init(frame: CGRect(x: self.x, y: self.y, width: self.width, height: self.height))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect)
    {
        let ovalPath = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: self.width, height: self.height
        ))
        color.setFill()
        ovalPath.fill()
    }
}
