//
//  ViewController.swift
//  Challenge2
//
//  Created by Christian Roese on 10/6/18.
//  Copyright © 2018 Nothin But Scorpions, LLC. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
  
  var imageNames: [String]!
  var images: [UIImage]!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    let fm = FileManager.default
    let resourcePath = Bundle.main.resourcePath!
    imageNames = try! fm.contentsOfDirectory(atPath: resourcePath).filter {$0.hasSuffix(".png")}
    images = imageNames.map { UIImage(named: $0)! }
    title = "Flags"
    navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return images.count
  }
  
  func removeFileType(from s: String) -> String {
    let index = s.lastIndex(of: ".") ?? s.endIndex
    return String(s[..<index])
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    let imageName = imageNames[indexPath.row]
    cell.textLabel?.text = removeFileType(from: imageName).uppercased()
    cell.imageView?.image = images[indexPath.row]
    cell.imageView?.layer.borderWidth = 1
    cell.imageView?.layer.borderColor = UIColor.lightGray.cgColor
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
      vc.imageToLoad = images[indexPath.row]
      vc.name = removeFileType(from: imageNames[indexPath.row])
      navigationController?.pushViewController(vc, animated: true)
    }
  }
}

