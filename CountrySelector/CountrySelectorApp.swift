//
//  CountrySelectorApp.swift
//  CountrySelector
//
//  Created by Vika Matveeva on 10.11.2020.
//

import SwiftUI

@main
struct CountrySelectorApp: App {

	private var provider: CountryPhoneProvider
	private var viewModel: CountryPhoneViewModel

	init() {
		provider = CountryPhoneProvider()
		viewModel = CountryPhoneViewModel(provider: provider)
	}

    var body: some Scene {
        WindowGroup {
			CountryPhoneView(viewModel: viewModel)
        }
    }
}
