//
//  CategoryViewController.swift
//  ios3sklep
//
//  Created by Krzysztof Grys on 6/12/17.
//  Copyright © 2017 pl. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    @IBOutlet weak var countOfSum: UIBarButtonItem!

    @IBAction func DanceButton(_ sender: Any) {
        self.performSegue(withIdentifier: "danceCategory", sender: self)
    }
    @IBAction func JazzButton(_ sender: Any) {
        self.performSegue(withIdentifier: "jazzCategory", sender: self)
    }
    
    @IBAction func CountryButton(_ sender: Any) {
        self.performSegue(withIdentifier: "countryCategory", sender: self)

    }
    
    @IBAction func rap(_ sender: Any) {
        self.performSegue(withIdentifier: "rapCategory", sender: self)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        countOfSum.title = "Suma: "+String(Cart.countItems.sum)+"zł"
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "danceCategory"){
            if let destination = segue.destination as? CategoryTableViewController{
                destination.category = "dance"
            }
        }
        if(segue.identifier == "jazzCategory"){
            if let destination = segue.destination as? CategoryTableViewController{
                destination.category = "jazz"
            }
        }
        if(segue.identifier == "countryCategory"){
            if let destination = segue.destination as? CategoryTableViewController{
                destination.category = "country"
            }
        }
        if(segue.identifier == "rapCategory"){
            if let destination = segue.destination as? CategoryTableViewController{
                destination.category = "rap"
            }
        }
    }
}
