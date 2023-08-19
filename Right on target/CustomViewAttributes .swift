//
//  CustomViewAttributes .swift
//  Right on target
//
//  Created by Nasim Nozirov on 11.08.2023.
//

import UIKit


class CustomLabel: UILabel {
    
    init(title: String, font: UIFont) {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 200)
        super.init(frame: frame)
        
        self.font = font
        self.backgroundColor = .yellow
        self.textColor = .black
        textAlignment = .center
        text = title
        translatesAutoresizingMaskIntoConstraints = false
        numberOfLines = 0
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class CustomButton: UIButton {

    init(
         withTitle title: String,
         textAlignment: NSTextAlignment,
         font: CGFloat
    ) {
        
        let frame = CGRect(x: 0, y: 0, width: 100, height: 200)
        super.init(frame: frame)
        backgroundColor = .black
        layer.cornerRadius = 5
        titleLabel?.textAlignment = textAlignment
        titleLabel?.font = UIFont.systemFont(ofSize: font)
        self.setTitle(title, for: .normal)
        translatesAutoresizingMaskIntoConstraints  = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class CustomSlider: UISlider {
    
    init() {
        
        
        let frame = CGRect(x: 0, y: 0, width: 100, height: 200)
        super.init(frame: frame)
        
        minimumValue = 1
        maximumValue = 50
        setValue(25, animated: true)
        minimumTrackTintColor = .red
        maximumTrackTintColor = .blue
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .yellow
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
