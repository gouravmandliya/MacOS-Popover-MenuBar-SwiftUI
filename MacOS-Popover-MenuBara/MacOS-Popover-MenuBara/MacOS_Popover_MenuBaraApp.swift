//
//  MacOS_Popover_MenuBaraApp.swift
//  MacOS-Popover-MenuBara
//
//  Created by GOURAVM on 24/08/22.
//

import SwiftUI

@main
struct MacOS_Popover_MenuBaraApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem : NSStatusItem?
    var popOver = NSPopover()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        let menuView = MenuView()
        
        popOver.behavior = .transient
        popOver.animates = true
        popOver.contentViewController = NSViewController()
        popOver.contentViewController?.view = NSHostingView(rootView: menuView)
        
        popOver.contentViewController?.view.window?.makeKey()
        
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        if let menuButton = statusItem?.button {
            menuButton.image = NSImage(systemSymbolName: "icloud.and.arrow.up.fill", accessibilityDescription: nil)
            menuButton.action = #selector(MenuButtonToggle)
            
        }
    }
    
    @objc func MenuButtonToggle(sender:AnyObject) {
        if popOver.isShown {
            popOver.performClose(sender)
        }
        else {
            if let menuButton = statusItem?.button {
                self.popOver.show(relativeTo: menuButton.bounds, of: menuButton, preferredEdge: NSRectEdge.minY)
            }
        }
    }
}
