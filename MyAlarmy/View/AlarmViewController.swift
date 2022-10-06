//
//  AlarmViewController.swift
//  MyAlarmy
//
//  Created by 백소망 on 2022/09/28.
//

import UIKit
import Combine

class AlarmViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var floatingButton: UIButton!
    
    var datasource: UICollectionViewDiffableDataSource<Section, Item>!
    
    typealias Item = Alarm
    enum Section {
        case main
    }
    
    var subscriptions = Set<AnyCancellable>()
    @Published var viewModel: AlarmViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = AlarmViewModel(storage: AlarmStorage())
        
        configureCollectionView()
        bind()
        configureUI()
        viewModel.fetch()
        
        NotificationCenter.default.addObserver(
                  self,
                  selector: #selector(self.didDismissDetailNotification(_:)),
                  name: NSNotification.Name("ModalDismissNC"),
                  object: nil
              )
    }
    
    @objc func didDismissDetailNotification(_ notification: Notification) {
          DispatchQueue.main.async {
              self.viewModel.fetch()
//              self.collectionView.reloadData()
          }
      }
    
    private func configureUI() {
        self.navigationItem.title = "9시간 20분 후에 울림"
        self.navigationItem.titleView?.backgroundColor = .white
//        self.navigationItem.titleView = titleView()
        
        floatingButton.layer.cornerRadius = 35
        floatingButton.clipsToBounds = true
        floatingButton.tintColor = .systemPink
    }
    
    func bind() {
        viewModel.$alarms
            .receive(on: RunLoop.main)
            .sink { list in
                let new = list.sorted(by: {$0.time < $1.time})
                self.applySectionItems(new)
                print("---> [AlarmViewController] update list >>> \(new)")
            }.store(in: &subscriptions)
        
        viewModel.selectedAlarm
            .compactMap{ $0 }   // nil이 아닐 때
            .receive(on: RunLoop.main)
            .sink { alarm in
                let sb = UIStoryboard(name: "AlarmDetail", bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: "AlarmDetailViewController") as! AlarmDetailViewController
                vc.viewModel = AlarmDetailViewModel(alarm: alarm)
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }.store(in: &subscriptions)
        
    }
    
    private func applySectionItems(_ items: [Item], to section: Section = .main) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([section])
        snapshot.appendItems(items, toSection: section)
        datasource.apply(snapshot)
    }
    
    private func configureCollectionView() {
        // Diffable Datasource -> Presentation
        
        datasource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlarmCell", for: indexPath) as? AlarmCell else {
                return nil
            }
            cell.configure(item)
            return cell
        })
        
        collectionView.collectionViewLayout = layout()
        collectionView.delegate = self
    }
    
    private func layout() -> UICollectionViewCompositionalLayout{
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.33))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.33))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 15
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
//    private func titleView() -> UIStackView {
//
//        let subtitleLabel = UILabel()
//        subtitleLabel.font = UIFont.systemFont(ofSize: 13.0)
//        subtitleLabel.textColor = .gray.withAlphaComponent(0.7)
//        subtitleLabel.text = "다음 알람"
//        subtitleLabel.textAlignment = .left
//
//        let titleLabel = UILabel()
//        titleLabel.font = UIFont.systemFont(ofSize: 27.0, weight: .bold)
//        titleLabel.textColor = .white
//        titleLabel.text = "9시간 14분 후에 알림"
//
//        let stackView = UIStackView(arrangedSubviews: [subtitleLabel, titleLabel])
//        stackView.alignment = .leading
//        stackView.axis = .vertical
//        stackView.spacing = 3
//
//        return stackView
//    }
    
    @IBAction func floatingButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "NewAlarm", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "NewAlarmViewController") as! NewAlarmViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }

}

extension AlarmViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelect(at: indexPath)
    }
}
