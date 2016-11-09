//
//  StartViewController.swift
//  Continue
//
//  Created by lee jaeeun on 2016/10/25.
//  Copyright © 2016年 lee jaeeun. All rights reserved.
//

import UIKit

class StartViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView : UIScrollView!
    @IBOutlet weak var pageContol : UIPageControl!
    
    var habitViews = [HabitView]()  //습관화 확인뷰 모음
    let pageCount = 4               //임시로 설정한 값
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //initialize controls
        self.initControls()
        
        #if false
        // Do any additional setup after loading the view.
        let dispatchTime: DispatchTime = DispatchTime.now() + Double(Int64(0.1 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: dispatchTime, execute: {
            // your function here
            self.tabBarController?.selectedIndex = 1;
        })
        #endif
        
        //맨 뒷 페이지는 습관추가 화면으로 하자
        
        
        
    }

    override func viewDidLayoutSubviews() {
        
        //adjuest content size
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width * CGFloat(pageCount),
                                        height: scrollView.frame.size.height)
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
    
    //REMARK: class methods
    func initControls() {
        
        self.loadHabitViews()
        
        scrollView.layoutIfNeeded()
    }
    
    func loadHabitViews() {
        
        //서버로부터 데이타를 받아서 뷰를 만든다.
        //일단은 가라로 뷰를 만들어 붙여보는 연습만..
        let hview1 = CheckHabitView.createView(style: HabitViewStyle.CheckViewStyle)
        
        let page_width = CGFloat(hview1.frame.size.width)
        
        hview1.frame = CGRect(origin: CGPoint(x:page_width * 0, y:0), size: hview1.frame.size)
        let tmpview1 : CheckHabitView = hview1 as! CheckHabitView
        tmpview1.pageLabel.text = "1 page."
        scrollView.addSubview(tmpview1)
        
        
        let hview2 = CheckHabitView.createView(style: HabitViewStyle.CheckViewStyle)
        hview2.frame = CGRect(origin: CGPoint(x:page_width * 1, y:0), size: hview1.frame.size)
        let tmpview2 : CheckHabitView = hview2 as! CheckHabitView
        tmpview2.pageLabel.text = "2 page."
        scrollView.addSubview(tmpview2)
        
        let hview3 = CheckHabitView.createView(style: HabitViewStyle.CheckViewStyle)
        hview3.frame = CGRect(origin: CGPoint(x:page_width * 2, y:0), size: hview1.frame.size)
        let tmpview3 : CheckHabitView = hview3 as! CheckHabitView
        tmpview3.pageLabel.text = "3 page."
        scrollView.addSubview(tmpview3)
        
        let cview = CreateHabitView.createView(style: HabitViewStyle.CreateViewStyle)
        cview.frame = CGRect(origin: CGPoint(x:page_width * 3, y:0), size: hview1.frame.size)
        let tmpcview : CreateHabitView = cview as! CreateHabitView
        scrollView.addSubview(tmpcview)
        
    
        
        
    }
    
    //REMARK: UIScroll delegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageContol.currentPage = Int(pageNumber)
    }
}
