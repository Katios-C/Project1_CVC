//
//  ViewController.swift
//  Project1
//
//  Created by Екатерина Чернова on 14.12.2020.
//

import UIKit

class ViewController: UICollectionViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var pictures = [String]()
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        performSelector(inBackground: #selector(loadImages), with: nil)
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    
    @objc func loadImages() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath! // где я могу найти фотки для моего приложения
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                // this is a picture to load
                pictures.append(item)
                pictures.sort()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? LabelCell else {fatalError("ОШИБКА")
            
        }
        
        let picture = pictures[indexPath.item]
        cell.label.text = picture.description
    
        return cell
    
        

    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
//
//
//        let ac = UIAlertController(title: "Input image name", message: nil, preferredStyle: .alert)
//        ac.addTextField()
//
//
//        ac.addAction(UIAlertAction(title: "OK", style: .default) { [weak self, weak ac] _ in
//            guard let newName = ac?.textFields?[0].text else { return }
//            image.name = newName
//            self?.collectionView.reloadData()
//
//        })
//        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
//        present(ac, animated: true)
//
    }


//import UIKit
//
//class ViewController: UITableViewController {
//    var pictures = [String]()
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        performSelector(inBackground: #selector(loadImages), with: nil)
//
//
//        title = "Storm Viewer"
//        navigationController?.navigationBar.prefersLargeTitles = true }
//
//
//    @objc func loadImages() {
//        let fm = FileManager.default
//        let path = Bundle.main.resourcePath! // где я могу найти фотки для моего приложения
//        let items = try! fm.contentsOfDirectory(atPath: path)
//
//        for item in items {
//            if item.hasPrefix("nssl") {
//                // this is a picture to load
//                pictures.append(item)
//                pictures.sort()
//            }
//
////            tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
//
//// MARK:
////            performSelector(onMainThread: #selector(errorMessage), with: nil, waitUntilDone: false)
//
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
//
//
////        tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
//
//
//
//    }
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return pictures.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
//        cell.textLabel?.text = pictures[indexPath.row]
//        return cell
//    }
//
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
//            vc.selectedImage = pictures[indexPath.row]
//            navigationController?.pushViewController(vc, animated: true)
//        }
//    }
//
//
//
//
//
//    @objc func errorMessage() {
//
//    }
//}
//
}
