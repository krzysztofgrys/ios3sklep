//
//  CategoryTableViewController.swift
//  ios3sklep
//
//  Created by Krzysztof Grys on 6/12/17.
//  Copyright © 2017 pl. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {

    var category:String = ""
    var items = [CartItem]()
    let products = ShopProdList()
    
    @IBOutlet weak var countOfItems: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(category)
        countOfItems.title = String(Cart.countItems.sum)
        for i in 0..<products.products.count{
            if products.products[i].category == category {
                items.append(products.products[i])
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        countOfItems.title = "Suma: "+String(Cart.countItems.sum)+"zł"


    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "detail") as! DetailViewController
        destination.item = self.items[indexPath.row]
        navigationController?.pushViewController(destination, animated: true)
    }
    
    
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProductTableViewCell
        cell.author.text = items[indexPath.row].title
        cell.title.text = items[indexPath.row].author
        cell.price.text = "\(items[indexPath.row].price)"+" zł"
        cell.imageOfCd.image = items[indexPath.row].image
        return cell
    }
    
}
