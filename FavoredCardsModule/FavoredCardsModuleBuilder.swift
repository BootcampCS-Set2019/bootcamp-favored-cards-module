//
//  RecommendedCardsModuleBuilder.swift
//  RecommendedCardsModule
//
//  Created by matheus.filipe.bispo on 08/10/19.
//  Copyright © 2019 BootcampCS-Set2019. All rights reserved.
//

import Repositories
import Entities

public class FavoredCardsModuleBuilder {
    public static func buildRoot(provider: DataProvider) -> FavoredCardsViewController {
        let presenter = FavoredCardsPresenter(provider: provider)
        let controller = FavoredCardsViewController(presenter: presenter)
        return controller
    }
}
