//
//  SettingTableViewCell.swift
//  Continue
//
//  Created by lee jaeeun on 2016/10/31.
//  Copyright © 2016年 lee jaeeun. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var descLabel : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func updateCell(title: String, desc: String) {
        //
    }
}

class SettingTableViewSwitchCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var switchControl : UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //REMARK: IBAction
    @IBAction func switchChanged(_ sender: AnyObject) {
        let tappedSwitch:UISwitch = sender as! UISwitch
        
        print(#function, tappedSwitch.isOn)
        
        
    }
    
}
