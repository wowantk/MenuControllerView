//
//  MenuViewController.swift
//  Menu
//
//  Created by macbook on 20.01.2021.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var groupsMenu: UICollectionView!
    @IBOutlet weak var collectionView: UICollectionView!
    var menu:Menu = Menu()
    var selectRow:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(UINib(nibName: "MenuCell", bundle: nil), forCellWithReuseIdentifier: "MenuCell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.groupsMenu.register(UINib(nibName: "GroupCell", bundle: nil), forCellWithReuseIdentifier: "GroupCell")
        self.groupsMenu.dataSource = self
        self.groupsMenu.delegate = self
        // Do any additional setup after loading the view.
    }
    

  

}
extension MenuViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == groupsMenu{
            return menu.groups.count
        }else{
            return menu.groups[selectRow].products.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == groupsMenu{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroupCell", for: indexPath) as! GroupCell
            let group = menu.groups[indexPath.item]
            cell.setup(group: group)
            return cell
        }else{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! MenuCell
        let group = menu.groups[selectRow]
        let product = group.products[indexPath.item]
        cell.setup(product: product)
        return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == groupsMenu{
            let groupName = menu.groups[indexPath.row].name.widthOfString(usingFont: UIFont.systemFont(ofSize: 17))
            return CGSize(width: groupName + 10, height: collectionView.frame.height)

        }else{
        return CGSize(width: UIScreen.main.bounds.width -  10, height: UIScreen.main.bounds.height)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectRow = indexPath.row
        self.collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: false)
        collectionView.reloadData()
    }
    
    
}
