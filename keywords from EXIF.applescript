on ImportActionForVersions(importImages)
	tell application "Aperture"
		repeat with i from 1 to count of importImages
			tell library 1
				tell item i of importImages
					set cameraModel to value of EXIF tag "Model"
					set lensModel to value of EXIF tag "LensModel"
					make new keyword with properties {name:cameraModel}
					
					-- I use the Nikon 50mm f/1.8 E manual lens on both the GF1 and the D40.
					-- So, when no lens is specified in the EXIF, it's the 50mm.
					if lensModel is "NO-LENS" or lensModel is "Manual Lens No CPU" then
						make new keyword with properties {name:"50mm f/1.8 E"}
					else
						make new keyword with properties {name:lensModel, parents:{cameraModel}}
					end if
				end tell
			end tell
		end repeat
	end tell
end ImportActionForVersions