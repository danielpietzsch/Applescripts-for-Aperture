on ImportActionForVersions(imageSel)
	tell application "Aperture"
		repeat with i from 1 to count of imageSel
			tell library 1
				tell item i of imageSel
					set cameraModel to value of EXIF tag "Model"
					
					-- mobile phones might not have a LensModel EXIF tag
					try
						set lensModel to value of EXIF tag "LensModel"
					on error
						set lensModel to ""
					end try
					
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