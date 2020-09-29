//
//	ApiResult.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 



class ApiResult : Decodable{

//    required init(from decoder: Decoder) throws {
//
//    }
    
	var abstract : String?
	var byline : String?
	var created_date : String?
	var des_facet : [String]?
//	var geo_facet : [AnyObject]?
	var itemType : String?
	var kicker : String?
	var material_type_facet : String?
	var multimedia : [Multimedia]?
	var org_facet : [String]?
	var per_facet : [String]?
	var published_date : String?
	var section : String?
	var shortUrl : String?
	var subsection : String?
	var title : String?
	var updated_date : String?
	var uri : String?
	var url : String?

}
