### UICollectionView와 Combine, MVVM 공부를 목적으로 평소 애용하는 '알라미' 앱 UI를 비슷하게 만들어 보았습니다 👩🏻‍💻


#### 🎈 UICollectionView 을 구성하기 위해 사용된 방법
- UICollectionViewDiffableDataSource
- snapshot
- Compositinal Layout


#### 🎈 기능
- Storage에서 알람 데이터 가져오기
- 홈화면에 알람 데이터 보여주기
- 홈화면에 가장 최근 알람이 몇분 후에 울리는지 표시
- 새로운 알람 만들어 Storage에 저장
- 새로운 알람을 만드는 모달이 사라지면, 홈화면(알람 리스트)에 데이터 업데이트
- 알람 리스트에서 알람 Cell 탭하여 상세 페이지로 이동


<img src="https://user-images.githubusercontent.com/96823668/194453344-e0cb408d-8be8-4b23-94af-36a874d19b4f.png" height="500"> <img src="https://user-images.githubusercontent.com/96823668/194453486-a3200361-1a0b-4b31-a2d5-410441f0c34f.png" height="500">
