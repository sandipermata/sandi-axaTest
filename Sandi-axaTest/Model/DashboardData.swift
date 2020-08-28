//
//  DashboardData.swift
//  Sandi-axaTest
//
//  Created by SANDI on 28/08/20.
//  Copyright © 2020 sample. All rights reserved.
//

import Foundation

struct DasboardData : Codable {
    let userId : Int?
    let id : Int?
    let title : String?
    let body : String?
    
    internal init(userId: Int?, id: Int?, title: String?, body: String?) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
}
