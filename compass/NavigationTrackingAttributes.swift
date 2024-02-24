//
//  NavigationTrackingAttributes.swift
//  compass
//
//  Created by Alexander Neal on 24/2/24.
//

import Foundation
import ActivityKit

struct NavigationTrackingAttributes: ActivityAttributes{
    public typealias NavigationTrackingStatus = ContentState
    
    public struct ContentState: Codable, Hashable{
        var startNav: Date
    }
}
