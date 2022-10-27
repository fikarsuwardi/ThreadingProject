//
//  ViewController.swift
//  ThreadingProject
//
//  Created by Zulfikar Abdul Rahman Suwardi on 27/10/22.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var imageView: UIImageView!
  
  let urlStrings = ["https://images5.alphacoders.com/523/523521.jpg", "https://images5.alphacoders.com/907/907775.jpg"]
  var data = Data()
  var tracker = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    tableView.delegate = self
    tableView.dataSource = self
    
    data = try! Data(contentsOf: URL(string: urlStrings[tracker])!)
    imageView.image = UIImage(data: data)
    
    self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(changeImage))
  }
    
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.textLabel?.text = "THREADING TEST"
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 25
  }
  
  @objc func changeImage() {
    if tracker == 0 {
      tracker += 1
    } else {
      tracker -= 1
    }
    
    data = try! Data(contentsOf: URL(string: urlStrings[tracker])!)
    imageView.image = UIImage(data: data)
  }

}

