//
//  FIRService.swift
//  Continue
//
//  Created by lee jaeeun on 2016/11/17.
//  Copyright © 2016年 lee jaeeun. All rights reserved.
//

import UIKit
import Firebase

let _FIRServiceSharedInstance = FIRService()

class FIRService: NSObject {

    let rootRef = FIRDatabase.database().reference() //FirebaseDatabaseのルートを指定
    let userRef = FIRDatabase.database().reference(withPath: "user-items")

    var userId: String?
    
    class var sharedInstance : FIRService {
        return _FIRServiceSharedInstance
    }
    
    func login() {
        
        print(#function)
        
        FIRAuth.auth()?.signInAnonymously(completion: { (user, error) in
            
            let isAnonymous = user!.isAnonymous  // true
            self.userId = user?.uid
            
            print("isAnonymous:\(isAnonymous), uid:\(self.userId)")
        })
        
    }
    
    func logout() {
        
        print(#function)
        
        do {
            try FIRAuth.auth()?.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    func isLogin() -> Bool {
        return FIRAuth.auth()?.currentUser != nil ? true : false
    }
    
    //REMARK: CRUD
    func createHabit(_ habit: Habit) {
        
        if (isLogin() == true) {
            if let user = FIRAuth.auth()?.currentUser {
                self.userRef.child(user.uid).childByAutoId().setValue(habit.convertToDictionary())
            }
        }
    }
    
    func fetchAllHabits(result:@escaping (Array<Habit>) -> Void) {
        
        if (isLogin() == true) {
            if let user = FIRAuth.auth()?.currentUser {
                
                userRef.child(user.uid).observe(FIRDataEventType.value, with: { (snapshot: FIRDataSnapshot) in
                    
                    if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                        
                        var habit_items = [Habit]()
                        
                        for snap in snapshots {
                            let dict = snap.value as! Dictionary<String, Any>
                            let habit = Habit()
                            habit.setValuesForKeys(dict)
                            habit.key = snap.key
                            
                            habit_items.append(habit)
                            
                        }
                        
                        result(habit_items)
                    }
                })
            }
        }
    }
    
    func completeHabit(habit:Habit) {
        
        if (isLogin() == true) {
            if let user = FIRAuth.auth()?.currentUser {
                
                userRef.child(user.uid).child(habit.key!).observe(FIRDataEventType.value, with: { (snapshot: FIRDataSnapshot) in
                    
                    habit.completeFlag = true
                    
                    self.userRef.child(user.uid).child(habit.key!).setValue(habit.convertToDictionary())
                    
                })
            }
        }
        
        
    }
    
}
