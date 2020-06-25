//
//  AccelerateYourAppWithCarPlayApp.swift
//  AccelerateYourAppWithCarPlay
//
//  Created by Daniel Saidi on 2020-06-25.
//

/**
 This project just contains the various templates shown
 in the video. The app has no CarPlay support.
 */

/*
 CarPlay Scene Manifest:
 
 <key>UIApplicationSceneManifest</key>
 <dict>
 <key>UISceneConfigurations</key>
 <dict>
 <key>CPTemplateApplicationSceneSessionRoleApplication</key>
 <array>
 <dict>
 <key>UISceneClassName</key>
 <string>CPTemplateApplicationScene</string>
 <key>UISceneConfigurationName</key>
 <string>MyApp—Car</string>
 <key>UISceneDelegateClassName</key>
 <string>MyApp.CarPlaySceneDelegate</string>
 </dict>
 </array>
 </dict>
 </dict>
 */

import SwiftUI

@main
struct AccelerateYourAppWithCarPlayApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// CarPlay App Lifecycle

import CarPlay

class CarPlaySceneDelegate: UIResponder, CPTemplateApplicationSceneDelegate {
    var interfaceController: CPInterfaceController?
    
    func templateApplicationScene(
        _ templateApplicationScene: CPTemplateApplicationScene,
        didConnect interfaceController: CPInterfaceController) {
        
        // CPNowPlayingTemplate
        /// `IMPORTANT` Setup the now playing template IMMEDIATELY when the app starts
        
        let nowPlaying = CPNowPlayingTemplate.shared()
        nowPlaying.isAlbumArtistButtonEnabled = true
        let repeatButton = CPNowPlayingButton(buttonType: .repeat, handler: { _ in })
        let rateButton = CPNowPlayingButton(buttonType: .playbackRate, handler: { _ in })
        nowPlaying.updateNowPlayingButtons([repeatButton, rateButton])
        
        
        // CPListTemplate
        
        self.interfaceController = interfaceController
        let item = CPListItem(text: "Rubber Soul", detailText: "The Beatles")
        item.listItemHandler = { [weak self] item2, completion in
            self?.interfaceController?.pushTemplate(nowPlaying, animated: true)
            // item.image = UIImage()
            completion()
        }
        var section = CPListSection(items: [item])
        var listTemplate = CPListTemplate(title: "Albums", sections: [section])
        interfaceController.setRootTemplate(listTemplate, animated: true)
        
        
        // CPListImageRowItem
        
        let set = CPImageSet(lightContentImage: UIImage(), darkContentImage: UIImage())
        let imageRowItem = CPListImageRowItem(text: "guehauugewah", gridImages: [set])
        imageRowItem.listItemHandler = { item, completion in
            print("Selected image row header!")
            completion()
        }
        imageRowItem.listImageRowHandler = { item, index, completion in
            print("Selected artwork at index \(index)!")
            completion()
        }
        
        section = CPListSection(items: [imageRowItem])
        listTemplate = CPListTemplate(title: "Listen Now", sections: [section])
        interfaceController.pushTemplate(listTemplate, animated: true)
        
        
        // CPTabBarTemplate

        let favorites = CPListTemplate(title: "Albums", sections: [section])
        favorites.tabSystemItem = .favorites
        favorites.showsTabBadge = true

        let button = CPGridButton(titleVariants: ["Title"], image: UIImage()) { (button) in }
        let albums: CPGridTemplate = CPGridTemplate(title: "Albums", gridButtons: [button])
        albums.tabTitle = "Albums"
        albums.tabImage = UIImage()

        let tabBarTemplate = CPTabBarTemplate(templates: [favorites, albums])
        interfaceController.setRootTemplate(tabBarTemplate, animated: false)

        // Later...
        favorites.showsTabBadge = false
        tabBarTemplate.updateTemplates([favorites, albums])
        
        
        
        // CPMessageListItem
        
        let messageItem = CPMessageListItem(
            fullName: "Daniel",
            phoneOrEmailAddress: "+46000000000",
            leadingConfiguration: CPMessageListItemLeadingConfiguration(leadingItem: .pin, leadingImage: UIImage(), unread: true),
            trailingConfiguration:  CPMessageListItemTrailingConfiguration(trailingItem: .mute, trailingImage: UIImage()),
            detailText: "detail",
            trailingText: "trailing")
        
        // CPContactTemplate(contact: messageItem)
        
        
        // CPPointOfInterestTemplateDelegate
        // CPPointOfInterestButton
        // let item = CPPointOfInterest
        // item.primaryButton = ...
        
        let label = CPDetailLabel(attributedString: NSAttributedString(string: "foo"), trailingAttributedString: NSAttributedString(string: "bar"))
        let btn = CPEntityButton(buttonType: .call, handler: { _ in })
        CPInformationTemplate(title: NSAttributedString(string: "egueaew"), labels: [label], actionButtons: [btn])
    }
    
    func templateApplicationScene(
        _ templateApplicationScene: CPTemplateApplicationScene,
        didDisconnect interfaceController: CPInterfaceController) {
        self.interfaceController = nil
    }
}
