//
//  AddMusicTableViewController.swift
//  project
//
//  Created by user_03 on 2016/12/29.
//  Copyright © 2016年 user_03. All rights reserved.
//

import UIKit

class AddMusicTableViewController: UITableViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        selectPhotoBut.setBackgroundImage(image,for: .normal)
        selectPhotoBut.setTitle(nil,for: .normal)
        dismiss(animated:true,completion: nil)//將呼叫的程式關掉
    }
    @IBAction func selectPhoto(_ sender: Any) {
        let controller = UIImagePickerController()
        controller.sourceType = .photoLibrary
        controller.delegate = self
        present(controller,animated: true,completion: nil)
        
    }
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var songTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var selectPhotoBut: UIButton!
    @IBOutlet weak var starTextField: UITextField!
    @IBOutlet weak var songsTextView: UITextView!
    @IBAction func end(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @IBAction func end1(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @IBAction func end2(_ sender: Any) {
        self.view.endEditing(true)
        
    }
    @IBAction func end3(_ sender: Any) {
        
    }

    @IBAction func Save(_ sender: AnyObject)
    {
        print("\(dateTextField.text!) \(songTextField.text!)\(nameTextField.text!)\(starTextField.text!)")
       
        if dateTextField.text!.characters.count  == 0 || songTextField.text!.characters.count == 0 || nameTextField.text!.characters.count == 0{
            
            let controller = UIAlertController(title: "錯誤", message: "有欄位尚未填寫", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            controller.addAction(action)
            
            
            present(controller, animated: true, completion: nil)
            
            
            return
        }
        
        
       
        let image = selectPhotoBut.backgroundImage(for: .normal)
        let data = UIImagePNGRepresentation(image!)
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("\(nameTextField.text!).png")
        
        try? data?.write(to: url!)
        let dic = [
                "name":nameTextField.text!,
                "date":dateTextField.text!,
                "song":songTextField.text!,
                "star":starTextField.text!,
                "songlist":songsTextView.text!
                ]
       

        let notiName=Notification.Name("addSong")
        NotificationCenter.default.post(name:notiName,object:nil,userInfo:dic)
        self.navigationController?.popViewController(animated: true)
        

    }
   
    override func viewDidLoad() {
        super.viewDidLoad()

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

    /*override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }*/

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

}
