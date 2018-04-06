import Foundation

/********************************************************************************
|
| Reference information:
|
|   - Metar overview:  https://www.wunderground.com/metarFAQ.asp
|   - Metar field reference:  https://www.aviationweather.gov/adds/dataserver/metars/MetarFieldDescription.php
|   - Current metar access:  https://www.aviationweather.gov/adds/dataserver_current/current/metars.cache.csv
|
|
********************************************************************************/

/********************************************************************************
| Function Definitions
********************************************************************************/
print("This code does anything")
func matches(for regexPattern:String, in text:String) -> [[String]] {
    do {
        var allCaptures = [[String]]()
        let regex = try NSRegularExpression(pattern: regexPattern, options:[])
        let matches = regex.matches(in: text, options: [], range: NSRange(location:0, length:text.count))
        for match in matches {
            var captures = [String]()
            for rangeIndex in 0 ..< match.numberOfRanges {
                let range = match.range(at:rangeIndex)
                let capture = String(text[Range(range, in: text)!])
                captures.append(capture)
            }
            allCaptures.append(captures)
        }
        return allCaptures
    } catch let error {
        fatalError("Failed to capture matches in regex: \(regexPattern) because: \(error.localizedDescription)")
    }
}



/*****************************************************************************
| 1.  Read recent METAR data from the METAR access URL
********************************************************************************/

let urlString = "https://www.aviationweather.gov/adds/dataserver_current/current/metars.cache.csv"
let url = URL(string: urlString)
var pageContents : String? = nil
do {
    pageContents  = try String(contentsOf: url!, encoding: .utf8)
} catch let error {
    fatalError("Failed to read from url: \(url!) because \(error.localizedDescription)")
}

/********************************************************************************
| 2.  Parse pageContents using a regular expression and capture groups
********************************************************************************/

print("StationID")
var StationID = matches(for:"(?<=,)[^,\\n]+(?=,)", in: pageContents!)
//var StationID = matches(for:"\\w{4}(,[^,+(?=,]*,)", in: pageContents!)
//var StationID = matches(for:"\\w\\w\\w\\w,\\d\\d\\d\\d-\\d\\d-\\d\\dT\\d\\d:\\d\\d:\\d\\dZ,((.+?)(?:,|$)){4}", in: pageContents!)
print(StationID)

class station {
    var id = ""
    var time  = ""
    var lat = ""
    var long = ""
    var temp = ""
    var dewpoint = ""
    var wind_d = ""
    var wind_s = ""
    var wind_g = ""
    var visibility = ""
    var alt = ""
    var sea = ""
    var corrected = ""
    var auto = ""
    var auto_s = ""
    var main = ""
    var no_s = ""
    var light = ""
    var freeze = ""
    var present = ""
    var wx_s = ""
    var sky_cover = ""
    var cloud_b = ""
    var sky_cover2 = ""
    var cloud_b2 = ""
    var sky_cover3 = ""
    var cloud_b3 = ""
    var sky_cover4 = ""
    var cloud_b4 = ""
    var flight = ""
    var three_hr = ""
    var maxT = ""
    var minT = ""
    var maxT24 = ""
    var minT24 = ""
    var precip = ""
    var pcp3 = ""
    var pcp6 = ""
    var pcp24 = ""
    var snowin = ""
    var vert = ""
    var metar_type = ""
    var elevation_m = ""
}
var count = 0
var count2 = 0
var stations = [station()]
for i in 0...StationID.count{
    var temporary : station
    
    if(i % 42 == 0)
    {
        count2 = 0
    }
    if(count2 == 0)
    {
        temporary.id = StationID[i].joined(separator: "")
    }

    if(count2 == 1)
    {
        temporary.time = StationID[i].joined(separator: "")
    }
    if(count2 == 2)
    {
        temporary.lat = StationID[i].joined(separator: "")
    }
    if(count2 == 3)
    {
        temporary.long = StationID[i].joined(separator: "")
    }
    if(count2 == 4)
    {
        temporary.temp = StationID[i].joined(separator: "")
    }
    if(count2 == 5)
    {
        temporary.dewpoint = StationID[i].joined(separator: "")
    }
    if(count2 == 6)
    {
        temporary.wind_d = StationID[i].joined(separator: "")
    }
    if(count2 == 7)
    {
        temporary.wind_s = StationID[i].joined(separator: "")
    }
    if(count2 == 8)
    {
        temporary.wind_g = StationID[i].joined(separator: "")
    }
    if(count2 == 9)
    {
        temporary.visibility = StationID[i].joined(separator: "")
    }
    if(count2 == 10)
    {
        temporary.alt = StationID[i].joined(separator: "")
    }
    if(count2 == 11)
    {
        temporary.sea = StationID[i].joined(separator: "")
    }
    if(count2 == 12)
    {
        temporary.corrected = StationID[i].joined(separator: "")
    }
    if(count2 == 13)
    {
        temporary.auto = StationID[i].joined(separator: "")
    }
    if(count2 == 14)
    {
        temporary.auto_s = StationID[i].joined(separator: "")
    }
    if(count2 == 15)
    {
        temporary.main = StationID[i].joined(separator: "")
    }
    if(count2 == 16)
    {
        temporary.no_s = StationID[i].joined(separator: "")
    }
    if(count2 == 17)
    {
        temporary.light = StationID[i].joined(separator: "")
    }
    if(count2 == 18)
    {
        temporary.freeze = StationID[i].joined(separator: "")
    }
    if(count2 == 19)
    {
        temporary.present = StationID[i].joined(separator: "")
    }
    if(count2 == 20)
    {
        temporary.wx_s = StationID[i].joined(separator: "")
    }
    if(count2 == 21)
    {
        temporary.sky_cover = StationID[i].joined(separator: "")
    }
    if(count2 == 22)
    {
        temporary.cloud_b = StationID[i].joined(separator: "")
    }
    if(count2 == 23)
    {
        temporary.sky_cover2 = StationID[i].joined(separator: "")
    }
    if(count2 == 24)
    {
        temporary.cloud_b2 = StationID[i].joined(separator: "")
    }
     if(count2 == 25)
    {
        temporary.sky_cover3 = StationID[i].joined(separator: "")
    }
    if(count2 == 25)
    {
        temporary.cloud_b3 = StationID[i].joined(separator: "")
    }
    if(count2 == 26)
    {
        temporary.sky_cover4 = StationID[i].joined(separator: "")
    }
    if(count2 == 27)
    {
        temporary.cloud_b4 = StationID[i].joined(separator: "")
    }
    if(count2 == 28)
    {
        temporary.flight = StationID[i].joined(separator: "")
    }
    if(count2 == 29)
    {
        temporary.three_hr = StationID[i].joined(separator: "")
    }
    if(count2 == 30)
    {
        temporary.maxT = StationID[i].joined(separator: "")
    }
    if(count2 == 31)
    {
        temporary.minT = StationID[i].joined(separator: "")
    }
    if(count2 == 32)
    {
        temporary.maxT24 = StationID[i].joined(separator: "")
    }
    if(count2 == 33)
    {
        temporary.minT24 = StationID[i].joined(separator: "")
    }
    if(count2 == 34)
    {
        temporary.precip = StationID[i].joined(separator: "")
    }
    if(count2 == 35)
    {
        temporary.pcp3 = StationID[i].joined(separator: "")
    }
    if(count2 == 36)
    {
        temporary.pcp6 = StationID[i].joined(separator: "")
    }
    if(count2 == 37)
    {
        temporary.pcp24 = StationID[i].joined(separator: "")
    }
    if(count2 == 38)
    {
        temporary.snowin = StationID[i].joined(separator: "")
    }
    if(count2 == 39)
    {
        temporary.vert = StationID[i].joined(separator: "")
    }
    if(count2 == 40)
    {
        temporary.metar_type = StationID[i].joined(separator: "")
    }
    if(count2 == 41)
    {
        temporary.elevation_m = StationID[i].joined(separator: "")
    }
    count2 = count2 + 1
    
    
        
        
    
    
    

}


/********************************************************************************
| 3.  Print the total number of records read
********************************************************************************/



/********************************************************************************
| 4.  Create a structure to contain the METAR data
|     At a minimum, read (from raw_text):
|        station id, observation time, wind direction and speed (including gusts),
|        visibility, weather and obscurations, temperature, dewpoint, altimeter,
|        latitude, longitude
********************************************************************************/



/********************************************************************************
|
| 5.  Populate an array of structures using the parsed data
|
********************************************************************************/
