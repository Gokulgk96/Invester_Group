//
//  Data.swift
//  Invester_Group
//
//  Created by Gokul Gopalakrishnan on 29/01/22.
//

import Foundation

struct datas: Codable
{
    var nodes: [nodes]
    var edges: [edges]
}

struct nodes: Codable
{
    var id: Int
    var data: data_nodes
}


struct data_nodes: Codable
{
    var properties: properties_nodes
    var categories: [String]?
    
}


struct properties_nodes: Codable
{
    var name : String
    var permalink : String?
    var founded_at : String?
   
    var market : String?
    var founded_year: Int?
    var state: String?
    var url: String?
    var country: String?
    var homepage_url: String?
    var logo: String?
    var funding_rounds: Int?
    var funding_total: Int?
   
}


struct edges: Codable
{
    var id: Int
    var target: Int
    var source: Int
    var data: data_edges
}


struct data_edges: Codable
{
    var properties: properties_edges?
    var type: String
}

struct properties_edges: Codable
{
   var permalink: String?
   var funded_month: String?
   var funded_quarter: String?
    var acquisition_date: String?
   var funded_year: Int?
   var funded_at: String?
   var funding_round_type: String?
   var funding_round_code: String?
   var raised_amount_usd: Int?
    var price_amount: Int?
 
}


struct investment_data
{
    var id: Int
    var name : String
    var date : String
    var type: String
    var amount: Int
    
    init(id: Int,name: String, date: String, type: String, amount: Int)
    {
        self.id = id
        self.name = name
        self.date = date
        self.type = type
        self.amount = amount
    }
    
}
