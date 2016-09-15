//
//  ExpandVC.swift
//  FoodAppIMessage
//
//  Created by ShrawanKumar Sharma on 15/09/16.
//  Copyright © 2016 FoodApp. All rights reserved.
//

import UIKit

class ExpandVC: UIViewController {

    static var storyboardIdentifier = "ExpandVC"

     var  delegate2 :SendMessageToCustomer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendButtonAction(_ sender: AnyObject) {
        
        self.delegate2?.sendFood()
        
    }

    @IBOutlet weak var sendMessageToUser: UIButton!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}



protocol  SendMessageToCustomer{
    func sendFood()
}
