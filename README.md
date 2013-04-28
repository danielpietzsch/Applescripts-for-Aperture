# Applescripts for Aperture

Currently just one script, this repo collects (Apple)scripts for the photo-management and -processing application [Aperture](http://www.apple.com/aperture/) that I find useful.


## The Scripts

### Keywords From EXIF

After photo import, this script will add keywords for the camera model and the lens model for every single imported photo. These model strings are taken directly from each photo's EXIF data. (The lens model keyword will be nested under the camera model.)

**Example:**

*Camera used:* **Panasonic DMC-GF1**  
*Lens used:* **LUMIX 20mm F1.7**

*EXIF Model:* **DMC-GF1**  
*EXIF LensModel:* **LUMIX G 20/F1.7**

*Keywords to be added (matches EXIF values):* `DMC-GF1, LUMIX G 20/F1.7`

*Keywords structure (as shown in the Keywords HUD):*

    DMC-GF1
    |-- LUMIX G 20/F1.7



### Installation

1. Copy the text of the file.
2. Open the AppleScript Editor app and create a new document.
3. Paste the text and adjust it to your needs (if necessary).
4. Compile it.
5. Save it to a location on your harddrive.
6. On next import in Aperture, add the "Actions" section via the "Import Setting" menu in the top right corner.
7. Select the saved script in the "Actions" section.

From then on, the specified keywords will automatically be added to all your photos on import.


## License

These scripts are released under the [MIT License](http://www.opensource.org/licenses/MIT).