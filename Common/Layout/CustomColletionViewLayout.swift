import UIKit

final class CustomCollectioViewLayout {
    
    static func createPhotoCompositionalLayout()  -> UICollectionViewLayout {
        let tripletItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 3), heightDimension: .fractionalHeight(1)))
        tripletItem.contentInsets = .init(top: 2, leading: 2, bottom: 2, trailing: 2)

        let tripletGroup = NSCollectionLayoutGroup.horizontal(
          layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1 / 3)),
          subitems: [tripletItem]
        )
        
        let mainItem = NSCollectionLayoutItem(
          layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(2 / 3),
            heightDimension: .fractionalHeight(1)
          ))

        mainItem.contentInsets = NSDirectionalEdgeInsets(
          top: 2,
          leading: 2,
          bottom: 2,
          trailing: 2
        )

        let pairItem = NSCollectionLayoutItem(
          layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(0.5)
          ))

        pairItem.contentInsets = NSDirectionalEdgeInsets(
          top: 2,
          leading: 2,
          bottom: 2,
          trailing: 2
        )

        let pairGroup = NSCollectionLayoutGroup.vertical(
          layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1 / 3),
            heightDimension: .fractionalHeight(1)
          ),
          subitem: pairItem,
          count: 2
        )

        let mainWithPairGroup = NSCollectionLayoutGroup.horizontal(
          layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(2 / 3)
          ),
          subitems: [pairGroup, mainItem]
        )

        let nestedGroup = NSCollectionLayoutGroup.vertical(
          layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(1)
          ),
          subitems: [
            mainWithPairGroup,
            tripletGroup,
          ]
        )

        let section = NSCollectionLayoutSection(group: nestedGroup)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    static func createCarouselLayout() -> UICollectionViewCompositionalLayout {
        let screenHeight = UIScreen.main.bounds.height
        let carouselItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.95),
                heightDimension: .absolute(screenHeight)))
        carouselItem.contentInsets = NSDirectionalEdgeInsets(
            top: 2, leading: 2, bottom: 2, trailing: 2
        )
        
        let carouselGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(screenHeight)),
            subitems: [carouselItem]
        )
        
        let carouselSection = NSCollectionLayoutSection(group: carouselGroup)
        carouselSection.orthogonalScrollingBehavior = .paging
        
        carouselSection.visibleItemsInvalidationHandler = { (items, offset, environment) in
            items.forEach { item in
                let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
                let minScale: CGFloat = 0.7
                let maxScale: CGFloat = 1.1
                let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
                item.transform = CGAffineTransform(scaleX: scale, y: scale)
            }
        }
        let layout = UICollectionViewCompositionalLayout(section: carouselSection)
        
        return layout
     }

    static func createStoriesLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let verticalInset: CGFloat = 0
        let itemSize = CGSize(width: 63.36, height: 63.36)
        layout.itemSize = itemSize
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(
            top: verticalInset, left: 0,
            bottom: verticalInset,
            right: 0
        )
        layout.minimumLineSpacing = 5
        
        return layout
    }
    
    static func createPremiumLayout() -> UICollectionViewCompositionalLayout {
        let carouselItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(310),
                heightDimension: .absolute(80))
        )
        carouselItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 40, bottom: 2, trailing: -60)
        
        let carouselGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(80)),
            subitems: [carouselItem]
        )
        
        let carouselSection = NSCollectionLayoutSection(group: carouselGroup)
        carouselSection.orthogonalScrollingBehavior = .paging
        
        carouselSection.visibleItemsInvalidationHandler = { (items, offset, environment) in
            items.forEach { item in
                let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
                let minScale: CGFloat = 0.1
                let maxScale: CGFloat = 1.1
                let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
                item.transform = CGAffineTransform(scaleX: scale, y: scale)
            }
        }
        let layout = UICollectionViewCompositionalLayout(section: carouselSection)
        
        return layout
    }
    
    static func createSimpleGridLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalWidth(0.5)
        )
               let item = NSCollectionLayoutItem(layoutSize: itemSize)
               let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(1)
               )
               let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: groupSize,
                subitem: item,
                count: 3
               )
               let section = NSCollectionLayoutSection(group: group)
               let layout = UICollectionViewCompositionalLayout(section: section)
              
               return layout
       }
    
    static func createInstagramLikeGridLayout() -> UICollectionViewCompositionalLayout {
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0 / 3),
                heightDimension: .fractionalWidth(1.0 / 3)
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 2,
                                                         leading: 2,
                                                         bottom: 2,
                                                         trailing: 2
            )
           
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalWidth(1.0 / 3)
            )
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: groupSize,
                subitem: item,
                count: 3
            )
           
            let section = NSCollectionLayoutSection(group: group)
            let layout = UICollectionViewCompositionalLayout(section: section)
           
            return layout
        }
 }
