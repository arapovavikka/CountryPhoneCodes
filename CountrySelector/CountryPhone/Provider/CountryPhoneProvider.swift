//
//  CountryPhoneProvider.swift
//  CountrySelector
//
//  Created by Vika Matveeva on 10.11.2020.
//
import Alamofire
import Combine

// GET https://restcountries.eu/rest/v2/all?fields=name;alpha2Code;callingCodes
protocol CountryPhoneProviderProtocol {
	func getCallingCodes() -> AnyPublisher<[CountryPhone], AFError>
}

final class CountryPhoneProvider: CountryPhoneProviderProtocol {
	private let requestUrl: String = "https://restcountries.eu/rest/v2/all?fields=name;alpha2Code;callingCodes"

	func getCallingCodes() -> AnyPublisher<[CountryPhone], AFError> {
		let publisher = AF.request(requestUrl).publishDecodable(type: [CountryPhone].self)
		return publisher.value() // value publisher
	}
}
