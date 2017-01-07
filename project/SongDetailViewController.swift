//
//  SongDetailViewController.swift
//  project
//
//  Created by user_13 on 2017/1/6.
//  Copyright © 2017年 user_03. All rights reserved.
//

import UIKit

class SongDetailViewController: UIViewController {
   
    var songInfoDic:[String:String]!
    /*
    @IBOutlet weak var song1: UILabel!
    @IBOutlet weak var song2: UILabel!
    @IBOutlet weak var song3: UILabel!
    @IBOutlet weak var song4: UILabel!
    @IBOutlet weak var song5: UILabel!
    @IBOutlet weak var song6: UILabel!
    @IBOutlet weak var song7: UILabel!
    @IBOutlet weak var song8: UILabel!
    @IBOutlet weak var song9: UILabel!
    @IBOutlet weak var song10: UILabel!
  */


   
    @IBOutlet weak var songsTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        songsTextView.text = songInfoDic["songlist"]!
     
        self.navigationItem.title = songInfoDic["song"]!
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
