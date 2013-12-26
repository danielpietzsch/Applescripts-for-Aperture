tell application "Aperture"
	set imageSel to selection
	repeat with i from 1 to count of imageSel
		tell library 1
			tell item i of imageSel
				set lat to get latitude
				set long to get longitude
				
				if (long is missing value) or (lat is missing value) then
					display dialog "Please select a geotagged image" with title "GPS data missing" buttons {"Okay"}
				else
					set lat to my set_decimal_delimiter_to_dot(lat as string)
					set long to my set_decimal_delimiter_to_dot(long as string)
					
					tell application "JSON Helper"
						set reverse_geocode_request to fetch JSON from ("http://maps.googleapis.com/maps/api/geocode/json?latlng=" & lat & "," & long & "&sensor=false")
						set address_components to get address_components of item 1 of results of reverse_geocode_request
						
						-- making a list (Array) of address component names
						set address_components_list to {}
						repeat with j from 1 to count of address_components
							if item 1 of |types| of item j of address_components is in {"route", "sublocality", "locality", "administrative_area_level_1", "country"} then
								copy long_name of item j of address_components to beginning of address_components_list --adding them at the beginning, sorts locations from general to specific
							end if
						end repeat
					end tell
					
					-- making and assigning a keyword for each item in the address components list
					-- each keyword will have the previous item(s) as a parent keyword
					-- this will create a nested list of location keywords
					repeat with k from 1 to count of address_components_list
						-- making a list (Array) of parent keywords from the previous item(s) in the address components list
						set parents_list to {}
						repeat with l from 1 to (k - 1)
							copy item (k - l) of address_components_list to end of parents_list
						end repeat
						
						-- setting delimiter to "\t": so when parents_list get converted to String, a tab is inserted as the separator
						-- (the nested keywords for the 'parents' param expects a tab-separated list of parent keywords)
						set AppleScript's text item delimiters to "	"
						
						make new keyword with properties {name:item k of address_components_list, parents:parents_list as string}
					end repeat
				end if
				
			end tell
		end tell
	end repeat
end tell

on set_decimal_delimiter_to_dot(this_text)
	set AppleScript's text item delimiters to ","
	set the text_items to every text item of this_text
	set AppleScript's text item delimiters to "."
	set this_text to the text_items as string
	set AppleScript's text item delimiters to ""
	return this_text
end set_decimal_delimiter_to_dot