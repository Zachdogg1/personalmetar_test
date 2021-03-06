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
var stationID = matches(for:"(?<=,)[^,\\n]*", in: pageContents!)
//var StationID = matches(for:"\\w{4}(,[^,+(?=,]*,)", in: pageContents!)
//var StationID = matches(for:"\\w\\w\\w\\w,\\d\\d\\d\\d-\\d\\d-\\d\\dT\\d\\d:\\d\\d:\\d\\dZ,((.+?)(?:,|$)){4}", in: pageContents!)
print(stationID)

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
    init(index: Int){
        print("start")
        id = stationID[43 + (43*index)][0]
        time  = stationID[43 + 1 + (43*index)][0]
        lat = stationID[43 + 2 + (43*index)][0]
        long = stationID[43 + 3 + (43*index)][0]
        temp = stationID[43 + 4 + (43*index)][0]
        dewpoint = stationID[43 + 5 + (43*index)][0]
        wind_d = stationID[43 + 6 + (43*index)][0]
        wind_s = stationID[43 + 7 + (43*index)][0]
        wind_g = stationID[43 + 8 + (43*index)][0]
        visibility = stationID[43 + 9 + (43*index)][0]
        alt = stationID[43 + 10 + (43*index)][0]
        sea = stationID[43 + 11 + (43*index)][0]
        corrected = stationID[43 + 12 + (43*index)][0]
        auto = stationID[43 + 13 + (43*index)][0]
        auto_s = stationID[43 + 14 + (43*index)][0]
        main = stationID[43 + 15 + (43*index)][0]
        no_s = stationID[43 + 16 + (43*index)][0]
        light = stationID[43 + 17 + (43*index)][0]
        freeze = stationID[43 + 18 + (43*index)][0]
        present = stationID[43 + 19 + (43*index)][0]
        wx_s = stationID[43 + 20 + (43*index)][0]
        sky_cover = stationID[43 + 21 + (43*index)][0]
        cloud_b = stationID[43 + 22 + (43*index)][0]
        sky_cover2 = stationID[43 + 23 + (43*index)][0]
        cloud_b2 = stationID[43 + 24 + (43*index)][0]
        sky_cover3 = stationID[43 + 25 + (43*index)][0]
        cloud_b3 = stationID[43 + 26 + (43*index)][0]
        sky_cover4 = stationID[43 + 27 + (43*index)][0]
        cloud_b4 = stationID[43 + 28 + (43*index)][0]
        flight = stationID[43 + 29 + (43*index)][0]
        three_hr = stationID[43 + 30 + (43*index)][0]
        maxT = stationID[43 + 31 + (43*index)][0]
        minT = stationID[43 + 32 + (43*index)][0]
        maxT24 = stationID[43 + 33 + (43*index)][0]
        minT24 = stationID[43 + 34 + (43*index)][0]
        precip = stationID[43 + 35 + (43*index)][0]
        pcp3 = stationID[43 + 36 + (43*index)][0]
        pcp6 = stationID[43 + 37 + (43*index)][0]
        pcp24 = stationID[43 + 38 + (43*index)][0]
        snowin = stationID[43 + 39 + (43*index)][0]
        vert = stationID[43 + 40 + (43*index)][0]
        metar_type = stationID[43 + 41 + (43*index)][0]
        elevation_m = stationID[43 + 42 + (43*index)][0]
        print("end")
        
    }
    func distance (latitude : Double, longitude : Double) -> Double
    {
        var lat2 = latitude * (.pi / 180)
        var long2 = longitude * (.pi/180)
        var temp1 = (latitude - Double(lat)!) * (.pi/180)
        var temp2 = (longitude - Double(long)!) * (.pi/180)
        var between = sin(temp1/2) * sin(temp1/2) + cos(Double(lat)!) * cos(lat2) + sin(temp2/2) + sin(temp2/2)
        var almost = atan2(sqrt(between), sqrt(1-between)) * 2
        var distance2 = almost * 6371000
        return distance2

    }
}
var count = 0
var count2 = 0
var stations: [station] = []
for i in 1...stationID.count/45
{
var temp = station(index : i)
stations.append(temp)
}
for j in 1...10
{
   // print("Latitude: " + stations[j].lat)
   // print("Longitude: " + stations[j].long)
    if(Double(stations[j].lat) != nil && Double(stations[j+1].lat) != nil)
    {
        var distance = stations[j].distance(latitude : Double(stations[j+1].lat)!, longitude :  Double(stations[j+1].long)!)
        print("Latitude and Longitude 1: " + stations[j].lat + ", " + stations[j].long)
        print("Latitude and Longitude 2: " + stations[j+1].lat + ", " + stations[j+1].long)
        print("Distance between " + stations[j].id + "and " + stations[j+1].id + "is " + String(distance))
    }

}
//var temporary = station()
/*for i in 0...StationID.count{
   
    
    if(i % 42 == 0)
    {
        temporary = station()
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
        stations.append(temporary)
    }
    
    count2 = count2 + 1
    
    
        
        
    
    
    

}
*/


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
