//
//  ViewController.swift
//  newnew
//
//  Created by USER on 10/8/16.
//  Copyright © 2016 Parallaxlogic Infotech. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let user = User()

    //@IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
   
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var name0: UITextField!
    @IBOutlet weak var emailt: UITextField!
    @IBOutlet weak var password: UITextField!

    @IBOutlet weak var phone0: UITextField!
    

    
    @IBAction func loginBtnPressed(sender: AnyObject) {
        if isSet() {
            user.doLogin()
        }
        
    }
    
    @IBAction func registerBtnPressed(sender: AnyObject) {
        
        if isFilled() {
            user.doRegistration()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //userName!.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func isFilled() -> Bool {
        user.name = String(name0.text!)
        user.email = String(emailt.text!)
        user.password = String(password.text!)
        user.phone = String(phone0.text!)
        return true
    }
    
    func isSet() -> Bool {
        user.name = String(userName.text!)
        user.password = String(passWord.text!)
        return true
    }
}

