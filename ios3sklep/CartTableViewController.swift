//
//  CartTableViewController.swift
//  ios3sklep
//
//  Created by Krzysztof Grys on 6/12/17.
//  Copyright © 2017 pl. All rights reserved.
//

import UIKit

class CartTableViewController: UITableViewController {

    var cartItems: [CartItem] = Cart.Cartt.items
    var countOfItems: [Int] = Cart.countItems.countOfItems
    var sum : Double = 0
    @IBOutlet weak var sumOfPrice: UIBarButtonItem!
    
    @IBOutlet var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: Selector("functionToCall"), name: NSNotification.Name(rawValue: "notificationName"), object: nil)
        
//        if let viewControllers = self.navigationController?.viewControllers {
//            let count = viewControllers.count
//            if viewControllers.count > 1 && ((self.navigationController?.viewControllers[count-1] as? DetailViewController) != nil){
//                self.navigationController?.popToViewController(viewControllers[viewControllers.count - 2], animated: true)
//            }
//        }
        

    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        countSum()
        sumOfPrice.title = "Suma: "+String (Cart.countItems.sum)+"zł"
    }
    
    public func countSum(){
        sum = 0
        for i in 0..<Cart.Cartt.items.count{
            sum = sum + Cart.Cartt.items[i].price*Double(Cart.countItems.countOfItems[i])
        }
        Cart.countItems.sum = sum
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Cart.Cartt.items.count
    }
    


    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CartTableViewCell
        cell.author.text = Cart.Cartt.items[indexPath.row].author
        cell.titleOf.text = Cart.Cartt.items[indexPath.row].title
        cell.price.text = "\(Cart.Cartt.items[indexPath.row].price)"
        cell.coverImage.image = Cart.Cartt.items[indexPath.row].image
        cell.countOf.text = "\(Cart.countItems.countOfItems[indexPath.row])"
        cell.stepper.tag = indexPath.row
        cell.stepperVal.value = Double(Cart.countItems.countOfItems[indexPath.row])

        return cell
    }

    func functionToCall() {
        countSum()
        deleteEmpty()
        sumOfPrice.title = "Suma: "+String (Cart.countItems.sum)+"zł"
    }
    
    func deleteEmpty(){
      
        for i in 0..<Cart.Cartt.items.count{
            if(Cart.countItems.countOfItems[i]==0){
                Cart.Cartt.items.remove(at: i)
                Cart.countItems.countOfItems.remove(at: i)
                tableView.reloadData()
                print("usuwam")
                break
            }
        }
        tableView.reloadData()
    }
}
