//
//  AddCardStackController.swift
//  Motivr
//
//  Created by John Nik on 12/27/17.
//  Copyright © 2017 jonik703. All rights reserved.
//

import UIKit

class AddCardStackController: UIViewController {
    
    let cardNameCellId = "cardNameCellId"
    let cardColorCellId = "cardColorCellId"
    let cardCoverCellId = "cardCoverCellId"
    let cardAlarmCellId = "cardAlarmCellId"
    let cardPreviewCellId = "cardPreviewCellId"
    
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

extension AddCardStackController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else if section == 2 {
            return 2
        }
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cardNameCellId, for: indexPath) as! CardNameCell
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cardColorCellId, for: indexPath) as! CardBandColorCell
            return cell
        } else if indexPath.section == 2 {
            
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: cardCoverCellId, for: indexPath) as! CardCoverCell
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: cardAlarmCellId, for: indexPath) as! CardAlarmCell
                return cell
            }
            
        } else if indexPath.section == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cardPreviewCellId, for: indexPath) as! CardPreviewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 2 && indexPath.row == 0 {
            let selectCoverController = SelectConverController()
            navigationController?.pushViewController(selectCoverController, animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let label = self.label(forHeaderText: "NAME OF THE CARD STACK")
            return label
            
        } else if section == 1 {
            let label = self.label(forHeaderText: "RUBBER BAND COLOR")
            return label
        } else if section == 2 {
            let label = self.label(forHeaderText: "CARD COVER, ALARM")
            return label
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 3 {
            return 0
        }
        
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 3 {
            return 400
        }
        
        return 50
    }
}

extension AddCardStackController {
    
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

extension AddCardStackController {
    
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
        
        tableView.register(CardNameCell.self, forCellReuseIdentifier: cardNameCellId)
        tableView.register(CardBandColorCell.self, forCellReuseIdentifier: cardColorCellId)
        tableView.register(CardCoverCell.self, forCellReuseIdentifier: cardCoverCellId)
        tableView.register(CardAlarmCell.self, forCellReuseIdentifier: cardAlarmCellId)
        tableView.register(CardPreviewCell.self, forCellReuseIdentifier: cardPreviewCellId)
        
        view.addSubview(tableView)
        
        _ = tableView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    }
}
