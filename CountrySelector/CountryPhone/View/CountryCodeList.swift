//
//  CountryCodeList.swift
//  CountrySelector
//
//  Created by Vika Matveeva on 16.11.2020.
//

import SwiftUI

struct CountryCodeList: View {
	@ObservedObject var viewModel: CountryPhoneViewModel

    var body: some View {
		List(viewModel.countryCodes, id: \.id) { country in
			CountryRow(countryInfo: country)
				.onTapGesture {
					viewModel.selectedCountryCode = country
				}
		}
    }
}
