import Foundation

struct LinkModel: Codable,Identifiable {
    
    
    let urlId: Int
    let webLink: String
    let smartLink: String
    let title: String
    let totalClicks: Int
    let originalImage: String
    let thumbnail: String?
    let timesAgo: String
    let createdAt: String
    let domainId: String
    let urlPrefix: String?
    let urlSuffix: String
    let app: String
    let isFavourite: Bool

    var id: Int { urlId }
}


var sampleData: LinkModel = LinkModel(urlId: 146150, webLink: "https://inopenapp.com/4o5qk", smartLink: "inopenapp.com/4o5qk", title: "651   Flats for Rent in Kormangla Bangalore, Bangalore Karnataka Without Brokerage - NoBroker Rental Properties in Kormangla Bangalore Karnataka Without Brokerage", totalClicks: 295, originalImage: "https://assets.nobroker.in/nb-new/public/List-Page/ogImage.png", thumbnail: nil, timesAgo: "1 yr ago", createdAt: "2023-03-15T07:33:50.000Z", domainId: "inopenapp.com/", urlPrefix: nil, urlSuffix: "4o5qk", app: "nobroker", isFavourite: false)
