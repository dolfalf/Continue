//
//  TestViewController.swift
//  Continue
//
//  Created by lee jaeeun on 2016/11/14.
//  Copyright © 2016年 lee jaeeun. All rights reserved.
//

import UIKit
import Firebase //Firebaseをインポート

class TestViewController: UIViewController, UITextFieldDelegate {

    let rootRef = FIRDatabase.database().reference() //FirebaseDatabaseのルートを指定
    let childRef = FIRDatabase.database().reference(withPath: "TestItem")

    
    @IBOutlet var textField: UITextField!
    @IBOutlet var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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

    @IBAction func post(sender: UIButton) {
        //create
        create()
    }
    
    @IBAction func fetch(sender: UIButton) {
        //
        fetch()
    }
    
    //データの送信のメソッド
    func create() {
        
        
        FIRAuth.auth()?.signInAnonymously(completion: { (user, error) in
            
            let isAnonymous = user!.isAnonymous  // true
            let rToken = user!.refreshToken
            
            print("isAnonymous:\(isAnonymous), token:\(rToken)")
            
            
            self.childRef.setValue("aaa2")
            
            //self.rootRef.child("users").child(user!.uid).setValue(["username": "test user"])
            
//            self.rootRef.child("users/(user.uid)/username").setValue("test user 일")
            
            
            
            
        })
        
//        let itemRef = self.rootRef.child("user-items")
//        
//        //textFieldになにも書かれてない場合は、その後の処理をしない
//        guard let text = textField.text else { return }
//        
////        let testItem = TestItem(test: text)
//        let testItemRef = itemRef.child(text.lowercased())
//        testItemRef.setValue("aaa1")
    }
    
    func fetch() {
        
        if (FIRAuth.auth()?.currentUser) != nil {
            
            let refHandle = self.childRef.observe(FIRDataEventType.value, with: { (snapshot) in
                
                let postDict = snapshot.value as! String //[String : AnyObject]
                
                self.displayLabel.text = postDict
            })
            
            
        }
        
        
    }
    
    //REMARK: UITextField delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

