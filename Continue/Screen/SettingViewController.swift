//
//  SettingViewController.swift
//  Continue
//
//  Created by lee jaeeun on 2016/10/25.
//  Copyright © 2016年 lee jaeeun. All rights reserved.
//

import UIKit

enum MenuItem: Int {
    case Manage     = 0
    case Version    = 1
    case About      = 2
    case Introduce  = 3
    case Lisence    = 4
    case Count      = 5
}

class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var settingTableView: UITableView!
    
    let menuItems = ["目標管理",
                     "バージョン",
                     "KJCodeについて",
                     "KJCodeアプリ紹介",
                     "オープンライセンス"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        testControl()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func testControl() {
        
        let test_button = UIBarButtonItem(title: "test",
                                          style: UIBarButtonItemStyle.done,
                                          target: self,
                                          action: #selector(testButtonTouched(sender:)))
        
        self.navigationItem.rightBarButtonItems = [test_button]
        
        
        
        
    }
    
    func testButtonTouched(sender: UIBarButtonItem) {
        print(#function)
        
        performSegue(withIdentifier: "TestSegue", sender: self)
    }
    
    //REMARK : tableview delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuItem.Count.rawValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: SettingTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as! SettingTableViewCell
        
        //cell.textLabel?.text = texts[indexPath.row]
        
        //cell .updateCell(title: <#T##String#>, desc: <#T##String#>)
        
        switch indexPath.row {
        case MenuItem.Manage.rawValue:
            cell.textLabel?.text = "目標管理"
            break
        case MenuItem.Version.rawValue:
            cell.textLabel?.text = "バージョン"
            break
        case MenuItem.About.rawValue:
            cell.textLabel?.text = "KJCodeについて"
            break
        case MenuItem.Introduce.rawValue:
            cell.textLabel?.text = "KJCodeアプリ紹介"
            break
        case MenuItem.Lisence.rawValue:
            cell.textLabel?.text = "オープンライセンス"
            break
        default:
            break
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //TODO:
    }

}
