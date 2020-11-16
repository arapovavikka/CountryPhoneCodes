//
//  CountryPhoneViewModel.swift
//  CountrySelector
//
//  Created by Vika Matveeva on 12.11.2020.
//

import Foundation
import Combine

class CountryPhoneViewModel: ObservableObject {
	@Published var countryCodes: [CountryPhone] = []
	@Published var selectedCountryCode: CountryPhone

	private var cancellables = [AnyCancellable]()

	private let phoneProvider: CountryPhoneProviderProtocol

	init(provider: CountryPhoneProvider) {
		self.phoneProvider = provider
		self.selectedCountryCode = CountryPhone(name: "Isle of Man", alpha2Code: "IM", callingCodes: ["44"])
		fetchCallingCodes()
	}

	private func fetchCallingCodes() {
		phoneProvider.getCallingCodes()
			.mapError({ (error) -> Error in
						print(error)
						return error
					})
			.sink(receiveCompletion: { _ in } ) { (phones) in
				self.countryCodes = phones
			}
			.store(in: &cancellables)
	}
}
