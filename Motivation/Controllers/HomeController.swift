//
//  HomeController.swift
//  Motivr
//
//  Created by John Nik on 12/27/17.
//  Copyright © 2017 jonik703. All rights reserved.
//

import UIKit
import AFMActionSheet

class HomeController: UICollectionViewController {
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
}

extension HomeController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CardCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.size.width / 2 , height: view.frame.size.height / 2 - 30)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

//MARK: handle actionsheet for add/edit card
extension HomeController {
    
    @objc fileprivate func handleActionSheetForAddEditCard() {
        
        self.showAFMActionSheet(firstActionName: "Add Card Stack", secondActionName: "Edit Card Stack", firstAction: { (add) in
            self.handleAddCardStack()
        }) { (edit) in
            
        }
        
    }
    
    private func handleAddCardStack() {
        
        let addCardStackController = AddCardStackController()
        navigationController?.pushViewController(addCardStackController, animated: true)
        
    }
    
}

extension HomeController {
    
    fileprivate func setupViews() {
        
        setupNavBar()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .vertical
        }
        
        collectionView?.register(CardCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView?.backgroundColor = StyleGuideManager.mainLightBeigeBackgroundColor
    }
    
    private func setupNavBar() {
        
        navigationItem.title = "Motivr"
        
        let menuImage = UIImage(named: AssetName.menuIcon.rawValue)?.withRenderingMode(.alwaysOriginal)
        let menuButton = UIBarButtonItem(image: menuImage, style: .plain, target: self, action: nil)
        menuButton.tintColor = .black
        
        navigationItem.leftBarButtonItem = menuButton
        
        let moreImage = UIImage(named: AssetName.moreIcon.rawValue)?.withRenderingMode(.alwaysOriginal)
        let moreButton = UIBarButtonItem(image: moreImage, style: .plain, target: self, action: #selector(handleActionSheetForAddEditCard))
        moreButton.tintColor = .black
        
        navigationItem.rightBarButtonItem = moreButton
    }
}
