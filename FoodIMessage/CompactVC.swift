//
//  CompactVC.swift
//  FoodAppIMessage
//
//  Created by ShrawanKumar Sharma on 15/09/16.
//  Copyright © 2016 FoodApp. All rights reserved.
//

import UIKit

class CompactVC: UIViewController {

    
    var  delegate:ExpandVCDelegate?
    static var storyboardIdentifier = "CompactVC"

    @IBAction func expandVC(_ sender: AnyObject) {
        
        self.delegate?.expandVCDelagate()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

}


protocol ExpandVCDelegate {
    func expandVCDelagate()
}
