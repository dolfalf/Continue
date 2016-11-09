//
//  HabitView.swift
//  Continue
//
//  Created by lee jaeeun on 2016/11/08.
//  Copyright © 2016年 lee jaeeun. All rights reserved.
//

import UIKit

enum HabitViewStyle: Int {
    case CreateViewStyle
    case CheckViewStyle
}

class HabitView: UIView {

    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    static func createView(style: HabitViewStyle) -> (HabitView) {
        
        switch style {
        case .CreateViewStyle:
            let hview:HabitView = UINib(nibName: "HabitView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! HabitView
            return hview;
        case .CheckViewStyle:
            let hview:HabitView = UINib(nibName: "HabitView", bundle: nil).instantiate(withOwner: self, options: nil)[1] as! HabitView
            return hview;
        }
    }
    
}
