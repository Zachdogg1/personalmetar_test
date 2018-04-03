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
//var StationID = matches(for:"\\d", in: pageContents!)
var StationID = matches(for:"(,[^,+(?=,]*,)", in: pageContents!)
//var StationID = matches(for:"\\w\\w\\w\\w,\\d\\d\\d\\d-\\d\\d-\\d\\dT\\d\\d:\\d\\d:\\d\\dZ,((.+?)(?:,|$)){4}", in: pageContents!)
print(StationID)



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
