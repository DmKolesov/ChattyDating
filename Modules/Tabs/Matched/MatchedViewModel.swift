import UIKit

struct MatchedViewModel {
    let userName: String
    let userAge: String
    let userLocation: String
    let userDistance: String
    let userPhotos: UIImage?
}


extension MatchedViewModel {
    static func mockData() -> [MatchedViewModel] {
        
        let card1 = MatchedViewModel(
            userName: "Anna",
            userAge: "40",
            userLocation: "New-York",
            userDistance: "1000 km away",
            userPhotos: UIImage(named: "yellow")
            )
        
        
        let card3 = MatchedViewModel(
            userName: "Phil",
            userAge: "22",
            userLocation: "Vienna",
            userDistance: "12 km away",
            userPhotos: UIImage(named: "cat")
            )
        
        let card4 = MatchedViewModel(
            userName: "Igor",
            userAge: "35",
            userLocation: "Toronto",
            userDistance: "1432 km away",
            userPhotos: UIImage(named: "young-fashionable-man-in-the-shadows"))
        
        let card5 = MatchedViewModel(
            userName: "Nicky",
            userAge: "24",
            userLocation: "Rim Rome Romule",
            userDistance: "11 km away",
            userPhotos: UIImage(named: "yellow"))
           
        
        
        
        
        var result: [MatchedViewModel] = []
    
        result.append(card1)
        result.append(card3)
        result.append(card4)
        result.append(card5)
 
        return result
    }
}
