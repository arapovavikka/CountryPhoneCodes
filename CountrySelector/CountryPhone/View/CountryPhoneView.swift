//
//  CountryPhoneView.swift
//  CountrySelector
//
//  Created by Vika Matveeva on 12.11.2020.
//

import SwiftUI

struct CountryPhoneView: View {
	@ObservedObject var viewModel: CountryPhoneViewModel

	@State private var showContryCodes: Bool = false

	init(viewModel: CountryPhoneViewModel) {
		self.viewModel = viewModel
	}

    var body: some View {
		PhoneTextField(countryPhone: $viewModel.selectedCountryCode, textFieldTapped: $showContryCodes)
		if showContryCodes {
			CountryCodeList(viewModel: viewModel)
		}
    }
}
