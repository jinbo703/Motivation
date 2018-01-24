//
//  SelectCoverController.swift
//  Motivr
//
//  Created by John Nik on 12/27/17.
//  Copyright © 2017 jonik703. All rights reserved.
//

import UIKit

class SelectConverController: UIViewController {
    
    let cardCoverColorCellId = "cardCoverColorCellId"
    let cardPhotoCellId = "cardPhotoCellId"
    
    lazy var tableView: UITableView = {
        
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
}

extension SelectConverController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 2
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cardCoverColorCellId, for: indexPath) as! CardCoverColorCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: cardPhotoCellId, for: indexPath) as! CardPhotoCell
            
            if indexPath.row == 0 {
                cell.photoImageView.backgroundColor = .yellow
                cell.textLabel?.text = "Pictures"
                cell.detailTextLabel?.text = "256"
            } else {
                cell.photoImageView.backgroundColor = .gray
                cell.textLabel?.text = "My Panoramas"
                cell.detailTextLabel?.text = "42"
            }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let label = self.label(forHeaderText: "SOLID COLOR")
            return label
            
        } else if section == 1 {
            let label = self.label(forHeaderText: "OR SELECT A PHOTO")
            return label
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 1 {
            return 70
        }
        
        return 50
    }
}

extension SelectConverController {
    
    fileprivate func label(forHeaderText text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.backgroundColor = StyleGuideManager.mainMediumBeigeBackgroundColor
        label.padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        return label
    }
    
    @objc fileprivate func handleDismissController() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension SelectConverController {
    
    fileprivate func setupViews() {
        
        view.backgroundColor = .white
        
        setupNavBar()
        setupTableView()
    }
    
    private func setupNavBar() {
        
        navigationItem.title = "Add Card Stack"
        
        let backImage = UIImage(named: AssetName.leftArrowIcon.rawValue)
        let backButton = UIButton(type: .system)
        backButton.setImage(backImage, for: .normal)
        backButton.setTitle("Back", for: .normal)
        backButton.tintColor = StyleGuideManager.buttonBlueBackgroundColor
        backButton.addTarget(self, action: #selector(handleDismissController), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
        let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: nil)
        saveButton.tintColor = StyleGuideManager.buttonBlueBackgroundColor
        navigationItem.rightBarButtonItem = saveButton
    }
    
    private func setupTableView() {
        
        tableView.register(CardCoverColorCell.self, forCellReuseIdentifier: cardCoverColorCellId)
        tableView.register(CardPhotoCell.self, forCellReuseIdentifier: cardPhotoCellId)
        
        view.addSubview(tableView)
        
        _ = tableView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    }
}
