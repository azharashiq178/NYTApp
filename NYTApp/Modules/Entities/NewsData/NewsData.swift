//
//	NewsData.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 



class NewsData : NSObject, Decodable{

	var copyright : String?
	var lastUpdated : String?
	var numResults : Int?
	var results : [ApiResult]?
	var section : String?
	var status : String?


	

}
