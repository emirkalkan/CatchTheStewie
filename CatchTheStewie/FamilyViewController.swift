//
//  FamilyViewController.swift
//  CatchTheStewie
//
//  Created by Emir Kalkan on 19.11.2019.
//  Copyright © 2019 Emir Kalkan. All rights reserved.
//

import UIKit

class FamilyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var myGriffins = [Griffins]()
    var chosenGriffin : Griffins?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //navigationController?.navigationBar.topItem?.hidesBackButton = true //for hiding back button
        navigationItem.title = "Family Guy (Griffin Family)"
               
        tableView.dataSource = self
        tableView.delegate = self
        
        let peter = Griffins(nameInit: "Peter Griffin", jobInit: "Safety inspector", imageInit: UIImage(named: "peter")!)
        let lois = Griffins(nameInit: "Lois Griffin", jobInit: "Housewife", imageInit: UIImage(named: "lois")!)
        let chris = Griffins(nameInit: "Chris Griffin", jobInit: "Student", imageInit: UIImage(named: "chris")!)
        let meg = Griffins(nameInit: "Meg Griffin", jobInit: "Student", imageInit: UIImage(named: "meg")!)
        let brian = Griffins(nameInit: "Brian Griffin", jobInit: "Dog", imageInit: UIImage(named: "brian")!)
        
        myGriffins.append(peter)
        myGriffins.append(lois)
        myGriffins.append(chris)
        myGriffins.append(meg)
        myGriffins.append(brian)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGriffins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = myGriffins[indexPath.row].name
        cell.backgroundColor = UIColor.systemYellow
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { //when row selected
        chosenGriffin = myGriffins[indexPath.row]
        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.selectedGriffin = chosenGriffin
        }
    }

}
