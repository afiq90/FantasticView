//
//  FantasticView.swift
//  FantasticView
//
//  Created by Afiq Hamdan on 19/04/2019.
//  Copyright © 2019 amtrust. All rights reserved.
//

import UIKit

@IBDesignable class FantasticView: UIView {
    
    @IBInspectable var color: UIColor {
        set {
            backgroundColor = newValue
        }
        get {
            return backgroundColor!
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
            print("corner radius \(cornerRadius)")
        }
        get {
            self.clipsToBounds = true
            return layer.cornerRadius
        }
    }
    
    lazy var myLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 10, width: 50, height: 100))
        label.text = "This is fantastic view"
        label.textColor = UIColor.black
        label.numberOfLines = 0
        
        return label
    }()
    
    let colors : [UIColor] = [.red, .orange, .yellow, .green, .blue, .purple]
    var colorCounter = 0
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        // fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        let tap = UITapGestureRecognizer(target:self, action: #selector(changeBackgroundWithTimer))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tap)
        self.addSubview(myLabel)
    }
    
    
    @objc func changeBackgroundWithTimer() {
        let myTimer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { (timer) in
            UIView.animate(withDuration: 2.0, animations: {
                self.backgroundColor = self.colors[self.colorCounter % 6]
                self.colorCounter += 1
            })
        }
        
        myTimer.fire()
    }
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
    }
    
}
