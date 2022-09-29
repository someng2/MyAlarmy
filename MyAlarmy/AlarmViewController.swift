//
//  AlarmViewController.swift
//  MyAlarmy
//
//  Created by 백소망 on 2022/09/28.
//

import UIKit

class AlarmViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var floatingButton: UIButton!
    
    let list: [Alarm] = Alarm.list
    
    var datasource: UICollectionViewDiffableDataSource<Section, Item>!
    
    typealias Item = Alarm
    enum Section {
        case main
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // <Presentation, Data, Layout>
        
        // Diffable Datasource -> Presentation
        
        datasource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlarmCell", for: indexPath) as? AlarmCell else {
                return nil
            }
            cell.configure(item)
            return cell
        })
        
        // snapshot -> Data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(list, toSection: .main)
        datasource.apply(snapshot)
        
        collectionView.collectionViewLayout = layout()
        
        self.navigationItem.title = "9시간 20분 후에 울림"
        self.navigationItem.titleView?.backgroundColor = .white
//        self.navigationItem.titleView = titleView()
        
        floatingButton.layer.cornerRadius = 35
        floatingButton.clipsToBounds = true
        floatingButton.tintColor = .systemPink
        
    }
    
    private func layout() -> UICollectionViewCompositionalLayout{
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.33))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.33))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//        group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 15
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    private func titleView() -> UIStackView {
        
        let subtitleLabel = UILabel()
        subtitleLabel.font = UIFont.systemFont(ofSize: 13.0)
        subtitleLabel.textColor = .gray.withAlphaComponent(0.7)
        subtitleLabel.text = "다음 알람"
        subtitleLabel.textAlignment = .left
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 27.0, weight: .bold)
        titleLabel.textColor = .white
        titleLabel.text = "9시간 14분 후에 알림"
        
        let stackView = UIStackView(arrangedSubviews: [subtitleLabel, titleLabel])
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.spacing = 3
        
        return stackView
    }
    
    @IBAction func floatingButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "NewAlarm", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "NewAlarmViewController") as! NewAlarmViewController
//        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    

}
