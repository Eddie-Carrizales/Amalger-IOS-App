//
//  LoginViewController.swift
//  Twitter
//
//  Created by Eddie Carrizales on 3/12/22.
//  Copyright © 2022 Eddie Carrizales. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    let myUrl = "https://api.twitter.com/oauth/request_token"
    
    @IBAction func onLoginButton(_ sender: Any) {
        TwitterAPICaller.client?.login(url: myUrl, success: {
            
            //everytime a user logs in, the program will create a key called "userLoggedIn" and set it to true
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { Error in
            print("Could not log in!")
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
