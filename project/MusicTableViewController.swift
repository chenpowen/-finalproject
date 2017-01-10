//
//  MusicTableViewController.swift
//  project
//
//  Created by user_03 on 2016/12/29.
//  Copyright © 2016年 user_03. All rights reserved.
//

import UIKit

class MusicTableViewController: UITableViewController {

    var songs = [[AnyHashable:String]]()
    var isAddSong = false
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
        if isAddSong
        {
            isAddSong = false
            let indexPath = IndexPath(row: 0, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .automatic)
            
        }
    }
    func updateFile()
    {
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("songs.txt")
        print("url \(url)")
        let result = (songs as NSArray).write(to: url!, atomically: true)
        print("result \(result)")
    }
    func addSongNoti(noti:Notification)
    {
        let dic=noti.userInfo as! [AnyHashable:String]
        songs.insert(dic,at:0)
        // self.tableView.reloadData()
         updateFile()
        isAddSong = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory,
                             in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("songs.txt")
        let array = NSArray(contentsOf: url!)
        if array != nil{
            songs = array as! [[String:String]]
        }
        let notiName=Notification.Name("addSong")
        NotificationCenter.default.addObserver(self, selector: #selector(MusicTableViewController.addSongNoti(noti:)), name: notiName, object: nil)
       // let file
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()

    }
    
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return songs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath) as! TableViewCell
        
        let dic = songs[indexPath.row]
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("\(dic["name"]!).png")
   

        cell.songImageView.image = UIImage(contentsOfFile: url!.path)
        cell.nameLabel.text = dic["name"]
        cell.songLabel.text = dic["song"]
        cell.dateLabel.text = dic["date"]
        cell.starImageView.image = UIImage(named: dic["star"]!)
      
      
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    

   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        songs.remove(at: indexPath.row)
        updateFile()
        self.tableView.reloadData()
    
    }
  


    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showDetail" {
            let indexPath = self.tableView.indexPathForSelectedRow
            let dic:[String:String]
            dic = songs[indexPath!.row] as! [String : String]
            
            
            let controller = segue.destination as! SongDetailViewController
            controller.songInfoDic = dic
         
        }
        
    }

}
