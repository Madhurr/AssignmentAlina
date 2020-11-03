//
//  ExploreViewController.swift
//  AlinaAssignment
//
//  Created by madhur on 03/11/20.
//  Copyright © 2020 Madhur. All rights reserved.
//

import UIKit
class ExploreViewController: UIViewController {

    let items = ["Category" , "Themes" , "Trending"]
    let tableView = UITableView(frame: .zero, style: .plain)
    let collectionView:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    var selectedSegment = 0
    lazy var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: items)
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
        return control
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Explore"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CategoryCell.nib, forCellReuseIdentifier: CategoryCell.identifier)
        tableView.register(TrendingCell.nib, forCellReuseIdentifier: TrendingCell.identifier)
        collectionView.register(ThemeTVC.nib, forCellWithReuseIdentifier: ThemeTVC.identifier)
        collectionView.isHidden = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        //collectionViewLayout?.sectionInset =
        // some UIEdgeInset collectionViewLayout?.invalidateLayout()
        setupViews()
    }
    
    fileprivate func setupViews(){
        view.backgroundColor = .white
        let stackView = UIStackView(arrangedSubviews: [
        segmentedControl,collectionView ,tableView
        ])
        stackView.axis = .vertical
        view.addSubview(stackView)
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .zero)
    }
    
    @objc func handleSegmentChange(){
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            selectedSegment = 0
            tableView.reloadData()
            collectionView.isHidden = true
            tableView.isHidden = false
        case 1:
            collectionView.isHidden = false
            tableView.isHidden = true
            collectionView.reloadData()
        default:
            selectedSegment = 2
            tableView.reloadData()
            collectionView.isHidden = true
            tableView.isHidden = false
        }
    }
    

    
    
}
// Segemented First and Last table Views
extension ExploreViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if selectedSegment == 0 {
            return 1
        }else{
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 && selectedSegment == 2{
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))

            let label = UILabel()
            label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
            label.text = "Top Gainers"
            label.font = UIFont.boldSystemFont(ofSize: 16.0)

            headerView.addSubview(label)

            return headerView
        }else if section == 1{
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))

            let label = UILabel()
            label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
            label.text = "Top Sellers"
            label.font = UIFont.boldSystemFont(ofSize: 16.0)
            
            headerView.addSubview(label)
            
            return headerView
        }
      let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedSegment == 0 {
            return 3
        }else{
            if section == 0{
                return 4
            }else{
                return 2
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if selectedSegment == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.identifier) as? CategoryCell else { return UITableViewCell() }
            if indexPath.row == 0{
                cell.backGroundView.backgroundColor = #colorLiteral(red: 0.6470588235, green: 0.6431372549, blue: 0.968627451, alpha: 1)
                cell.imgView.image = UIImage(named: "icons8-stocks-64")
                cell.headingLabel.text = "Stocks"
            }
            if indexPath.row == 1{
                cell.backGroundView.backgroundColor = #colorLiteral(red: 0.3058823529, green: 0.3098039216, blue: 0.7843137255, alpha: 1)
                cell.imgView.image = UIImage(named: "icons8-bitcoin-64")
                cell.headingLabel.text = "ETFs"
            }
            if indexPath.row == 2{
                cell.backGroundView.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
                cell.imgView.image = UIImage(named: "icons8-bitcoin-64")
                cell.headingLabel.text = "Crypto"
            }
            return cell
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TrendingCell.identifier) as? TrendingCell else { return UITableViewCell() }
            if indexPath.row == 1{
                cell.brandLogo.image = UIImage(named: "icons8-slack-40")
                cell.brandNameLabel.text = "Slack"
                cell.shortName.text = "SLK"
                
            }
            if indexPath.row == 2{
                cell.brandLogo.image = UIImage(named: "icons8-google-40")
                cell.brandNameLabel.text = "Google"
                cell.shortName.text = "GooG"
                cell.valueView.backgroundColor = UIColor.red
                cell.val.text = "-23.22"
            }
            if indexPath.row == 3{
                cell.brandLogo.image = UIImage(named: "icons8-facebook-circled-40")
                cell.brandNameLabel.text = "Facebook"
                cell.shortName.text = "FB"
                cell.valueView.backgroundColor = UIColor.red
                cell.val.text = "-27.22"
                      }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedSegment == 0{
            return 120
        }else{
            return 80
        }
        
    }
}

// Center Of Segmented Controll
extension ExploreViewController:UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThemeTVC.identifier, for: indexPath) as? ThemeTVC else { return UICollectionViewCell() }
        if indexPath.row == 0{
            cell.image.image = UIImage(named: "icons8-cannabis-100")
            cell.label.text = "Cannabis"
        }
        if indexPath.row == 1{
            cell.image.image = UIImage(named: "icons8-facebook-96")
            cell.label.text = "facebook"
        }
        if indexPath.row == 2{
            cell.image.image = UIImage(named: "slack")
            cell.label.text = "Slack"
        }
        if indexPath.row == 3{
            cell.image.image = UIImage(named: "icons8-bitcoin-96")
            cell.label.text = "Bitcoin"
        }
        if indexPath.row == 4{
            cell.image.image = UIImage(named: "icons8-fashion-trend-96")
            cell.label.text = "Fashion"
        }
        if indexPath.row == 5{
                  cell.image.image = UIImage(named: "icons8-cannabis-100")
                             cell.label.text = "Cannabis"
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 40)/2, height: collectionView.frame.height / 3.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 10, bottom: 0, right: 10)
        
    }
}
