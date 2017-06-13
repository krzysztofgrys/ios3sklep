//
//  DetailViewController.swift
//  ios3sklep
//
//  Created by Krzysztof Grys on 6/12/17.
//  Copyright © 2017 pl. All rights reserved.
//

import UIKit
import AVFoundation

class DetailViewController: UIViewController {

    var sound: AVAudioPlayer!
    var url: URL? = nil
    @IBOutlet weak var cover: UIImageView!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var titleCd: UILabel!
    @IBOutlet weak var countOfSum: UIBarButtonItem!
    var musicsList:[String] = ["cd1.mp3","muza9.mp3","muza12.mp3","muza4.mp3","muza6.mp3"]
    @IBAction func volumeBarAction(_ sender: Any) {
        if sound != nil {
            sound.setVolume(volumeBar.value, fadeDuration: 0.5)
            
        }
    }
    @IBOutlet weak var volumeBar: UISlider!
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var price: UILabel!
    
    @IBAction func playButtonAction(_ sender: Any) {
        do {
            sound = try AVAudioPlayer(contentsOf: url!)
            sound.play()
        } catch {
        }
    }
    @IBAction func stopButtonAction(_ sender: Any) {
        if sound != nil {
            sound.stop()
            sound = nil
        }
    }
    
    @IBAction func addToCart(_ sender: Any) {
        
        let result = cartContainItem(item: item!, carts: Cart.Cartt.items)
        if(result == -1){
            Cart.Cartt.items.append(item!)
            Cart.countItems.countOfItems.append(1)
        }else{
            Cart.countItems.countOfItems[result] = Cart.countItems.countOfItems[result]+1
        }
        
        
        
    }

    var item: CartItem? = nil
    
    override func viewWillDisappear(_ animated: Bool) {
        if sound != nil {
            sound.stop()
            sound = nil
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        countOfSum.title = "Suma: "+String(Cart.countItems.sum)+"zł"
    }
    
    func randomInt(min: Int, max:Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    func cartContainItem(item: CartItem, carts: [CartItem]) -> Int {
        for i in 0..<carts.count{
            if(carts[i].author == item.author && carts[i].title == item.title){
                return i
            }
        }
        return -1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let index = randomInt(min: 0, max: musicsList.count-1)
        print(index)
        
        volumeBar.value = 1
        countOfSum.title = String(Cart.countItems.sum)
        if(item != nil){
            cover.image = item?.image
            price.text = "Cena: "+"\(String(describing: (item?.price as! Double)))"+" zł"
            author.text = item?.author
            titleCd.text = item?.title
            
        }
        
        let path = Bundle.main.path(forResource: musicsList[index], ofType:nil)!
        url = URL(fileURLWithPath: path)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
