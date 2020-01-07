//
//  ImageViewController.swift
//  CatchTheStewie
//
//  Created by Emir Kalkan on 25.11.2019.
//  Copyright © 2019 Emir Kalkan. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

class ImageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var userEmailArray = [String]()
    var userCommentArray = [String]()
    var userImageArray = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationController?.navigationBar.topItem?.hidesBackButton = true //for hiding back button
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
        
        getDataFromFirestore()
    }
    
    func getDataFromFirestore() {
        let firestoreDatabase = Firestore.firestore()
        
        firestoreDatabase.collection("Posts").order(by: "date", descending: true).addSnapshotListener { (snapshot, error) in //ordering to date
            if error != nil {
                print(error?.localizedDescription)
            } else {
                if snapshot?.isEmpty != true && snapshot != nil {
                    
                    self.userImageArray.removeAll(keepingCapacity: false) //cleaning data arrays
                    self.userEmailArray.removeAll(keepingCapacity: false)
                    self.userCommentArray.removeAll(keepingCapacity: false)
                    
                    for document in snapshot!.documents {
                        //let documentId = document.documentID
                        
                        if let postedBy = document.get("postedBy") as? String {
                            self.userEmailArray.append(postedBy)
                        }
                        if let postComment = document.get("postComment") as? String {
                            self.userCommentArray.append(postComment)
                        }
                        if let imageUrl = document.get("imageUrl") as? String {
                            self.userImageArray.append(imageUrl)
                        }
                    }
                    self.tableView.reloadData()
                    
                }
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userEmailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ImageCell //for casting my imageCell and cells can reusable
        cell.backgroundColor = UIColor.systemYellow
        cell.userEmailLabel.text = "Email: \(userEmailArray[indexPath.row])"
        cell.commentLabel.text = "Comment: \(userCommentArray[indexPath.row])"
        cell.userImageView.sd_setImage(with: URL(string: self.userImageArray[indexPath.row])) //pod downloaded for this
        
        return cell
    }
    
}
