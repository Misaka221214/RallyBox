//
//  RouteBookViewModel.swift
//  RallyBox
//
//  Created by Muhan Li on 2024-05-14.
//

import Foundation

class RouteBookViewModel: ObservableObject {
    @Published var routeBook: RouteBook = .init(items: [], name: "", startTime: Date.now)

    init() {}

    func getDistanceByIndex(index: Int) -> Double {
        if index >= 0 {
            let distance = routeBook.items[index].endDistance - routeBook.items[index].startDistance
            return distance >= 0 ? distance : 0
        }
        return 0
    }

    func getTimeDiff(index: Int) -> Double {
        if index >= 0 {
            return getDistanceByIndex(index: index) / (routeBook.items[index].speed / 3600)
        }
        return 0
    }

    func calculateRouteBookItem(currentIndex: Int) {
        let previousIndex = currentIndex - 1

        if currentIndex < 0 {
            return
        }

        if currentIndex == 0 {
            routeBook.items[currentIndex].startTime = routeBook.startTime
            routeBook.items[currentIndex].startDistance = 0
        } else {
            routeBook.items[currentIndex].startTime = routeBook.items[previousIndex].endTime
            routeBook.items[currentIndex].startDistance = routeBook.items[previousIndex].endDistance
        }

        let timeDiff = getTimeDiff(index: currentIndex)
        routeBook.items[currentIndex].endTime = routeBook.items[currentIndex].startTime + timeDiff
        routeBook.items[currentIndex].duration = timeDiff
    }

    func calculateRouteBook() {
        for (index, _) in routeBook.items.enumerated() {
            calculateRouteBookItem(currentIndex: index)
        }
    }

    func updateStartTime(startTime: Date) {
        print("CALL")
        print(startTime)
        print(routeBook.startTime)
        routeBook.startTime = startTime
        calculateRouteBook()
        print(routeBook.startTime)
        print("DONE")
    }

    func addItem(endDistance: Double, speed: Double, index: Int) {
        if index < routeBook.items.count {
            routeBook.items[index].endDistance = endDistance
            routeBook.items[index].speed = speed
            calculateRouteBook()
        } else {
            routeBook.items.append(RouteBookItem(startDistance: 0, endDistance: endDistance, startTime: Date.now, endTime: Date.now, speed: speed, pause: false, duration: 0))
            calculateRouteBookItem(currentIndex: index)
        }
    }
}
