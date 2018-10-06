//
//  DetailViewController.swift
//  Challenge2
//
//  Created by Christian Roese on 10/6/18.
//  Copyright © 2018 Nothin But Scorpions, LLC. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet var imageView: UIImageView!
  var imageToLoad: UIImage!
  var name: String!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    imageView.image = imageToLoad
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action,
                                                        target: self, action: #selector(shareTapped))
    title = name.uppercased()
    navigationController?.navigationBar.prefersLargeTitles = false
    navigationController?.hidesBarsOnTap = true
    
    imageView.layer.borderColor = UIColor.lightGray.cgColor
    imageView.layer.borderWidth = 1
  }
  
  @objc func shareTapped() {
    let ac = UIActivityViewController(activityItems: [imageToLoad], applicationActivities: nil)
    ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
    present(ac, animated: true)
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
