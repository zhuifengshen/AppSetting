//
//  ViewController.swift
//  AppSetting
//
//  Created by 张楚昭 on 16/6/9.
//  Copyright © 2016年 tianxing. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    @IBOutlet weak var username: UILabel!
    
    @IBOutlet weak var password: UILabel!
    
    @IBOutlet weak var clearCache: UILabel!
    
    @IBOutlet weak var flowLimit: UILabel!
    
    @IBOutlet weak var serverName: UILabel!
    
    @IBOutlet weak var notiSound: UILabel!
    
    @IBOutlet weak var notiVibrate: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.getData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.prefersStatusBarHidden()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getData() {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        self.username.text = defaults.stringForKey("name_preference")
        self.password.text = defaults.stringForKey("password_preference")
        
        if defaults.boolForKey("enabled_preference"){
            self.clearCache.text = "YES"
        }else{
            self.clearCache.text = "NO"
        }
        NSLog(":\(defaults.boolForKey("enabled_preference"))")
        let sliderStr = NSString(format: "%.2fGB", defaults.doubleForKey("slider_preference"))
        self.flowLimit.text = sliderStr as String
        
        self.serverName.text = defaults.stringForKey("multivalue_preference")
        
        if defaults.boolForKey("sound_enabled_preference"){
            self.notiSound.text = "YES"
        }else{
            self.notiSound.text = "NO"
        }
        
        if defaults.boolForKey("vibrate_enabled_preference"){
            self.notiVibrate.text = "YES"
        }else{
            self.notiVibrate.text = "NO"
        }
    }

}

