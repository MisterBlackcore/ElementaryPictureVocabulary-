import Foundation

class GamesCollectionBaseManager {
    
    static let shared = GamesCollectionBaseManager()
    private init() {}
    
    //MARK: - Flow Functions
    
    func numberOfSection() -> Int {
        return GamesCollectionBase.shared.sectionsArray.count
    }
    
    func pictureOfSection() -> [String] {
        return GamesCollectionBase.shared.sectionNamesArray
    }
    
    func returnSection() -> [[Word]] {
        return GamesCollectionBase.shared.sectionsArray
    }
    
}
