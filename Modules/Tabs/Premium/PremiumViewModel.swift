import UIKit

struct PremiumViewModel {
    let type: String
    
    init(type: String) {
        self.type = type
    }
}

extension PremiumViewModel {
    static func mockArray() -> [PremiumViewModel] {
        var result: [PremiumViewModel] = []
        
        let silver = PremiumViewModel(type: "Silver")
        let gold = PremiumViewModel(type: "Gold")
        let platinum = PremiumViewModel(type: "Platinum")
        
        result.append(silver)
        result.append(gold)
        result.append(platinum)
        return result
    }
}
