//
//  User.swift
//  newnew
//
//  Created by USER on 10/9/16.
//  Copyright © 2016 Parallaxlogic Infotech. All rights reserved.
//

import Foundation
import Alamofire

class User {
    
    private var _name:String!
    private var _email: String!
    private var _password: String!
    private var _phone: String!
    private var _device_id: String!
    private var _isLogged: Bool!
    
    var name: String{
        get{
            if(self._name == nil)
            {
                return "";
            }
            return self._name;
        }
        set(_name)
        {
            self._name = _name;
        }
    }
    
    var email: String{
        get{
            if self._email == nil {return ""}; return self._email;
        }
        set(_email){
            self._email = _email;
        }
    }
    
    var password: String{
        get{
            if self._password != nil {
                return self._password;
            }else{
                return "";
            }
        }
        set(_password){
            self._password = _password;
        }
    }
    
    var phone: String{
        get{
            if self._phone != nil {
                return self._phone;
            }else{
                return "";
            }
        }
        set(_phone)
        {
            self._phone = _phone
        }
    }
    
    var device_id: String{
        get{
            if self._device_id != nil {
                return self._device_id;
            }else{
                return "";
            }
        }
        set(_phone)
        {
            self._device_id = _phone
        }
    }
    
    var isLogged: Bool{
        
        get{ return _isLogged;}
        set(_isLogged){self._isLogged = _isLogged}
    }
    
    init(){
        
        self._device_id = ""
        self._email = ""
        self._name = ""
        self._password = ""
        self._phone = ""
        self._isLogged = false
        
    }
    
    
    func doRegistration(){
        var ProfileDic = [String : String]();
        
        ProfileDic["name"] = self.name
        ProfileDic["email"] = self.email
        ProfileDic["password"] = self.password
        ProfileDic["phone"] = self.phone
        ProfileDic["device_id"] = "kojo123"
      
        
        Alamofire.request(.POST,registerUrl, parameters: ProfileDic).responseJSON { response in
            
            switch(response.result)
            {
                
            case .Success:
                if let r = response.result.value {
                    print(r,"\n")
                    
                    let jsonResponse = JSON(data : response.data!);
                    
                                          print(ProfileDic)
                    
                                       print(jsonResponse,"\n")
                                       print("\n",jsonResponse["response"])
                                      print("\n",jsonResponse["meta"])
                                       print("\n",jsonResponse["meta"]["status"])
                                       print("\n",jsonResponse["meta"]["code"])
                }
                break;
                
            case .Failure(let error):
                
                print(error)
                
                break;
                
            }
            
        }
        
    } //end of doRegistration
    
    func doLogin() {
        var profileDic = [String:String]();
        profileDic["email"] = self.name;
        profileDic["password"] = self.password;
        profileDic["device_id"] = "mymac123"
        print(profileDic)
        Alamofire.request(.POST, loginUrl, parameters: profileDic).responseJSON{
            response in
            
            
            switch(response.result)
            {
                
                
            case .Success:
                if let r = response.result.value {
                    print(r,"\n")
                    
                    let jsonResponse = JSON(data : response.data!);
                    
                    print(jsonResponse,"\n")
                    
                    if jsonResponse["meta"]["status"] == "success"
                    {
                        let session_id = jsonResponse["response"][0]["sessionID"]
                        print("Session ID : ",session_id)
                        
                        
                        let defaults = NSUserDefaults.standardUserDefaults()
                        
                        defaults.setObject("\(session_id)", forKey: "userNameKey")
                        
                        self.isLogged = true
                        print("in user : ",self.isLogged)
                        defaults.setBool(self.isLogged, forKey: "userLogin")
                    }
                    
                    
                    
                }
                break;
                
            case .Failure(let error):
                print(error)
                break;
                
            }
            
            
        }
    }
    
    
} //end of class

