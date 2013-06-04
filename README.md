# Applescripts for Aperture

This repo collects (Apple)scripts for the photo-management and -processing application [Aperture](http://www.apple.com/aperture/) that I find useful.


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

### Keywords From Location

This script adds location keywords, based on the photos GPS data. When the photo is geotagged with latitude and longitude, it will reverse geocode these coordinates to get the keyword names.

You will need to install the [JSON Helper](http://www.mousedown.net/mouseware/JSONHelper.html) application and your computer needs to be connected to the internet, because for each photo a call is made to Google's Geocoding API.

The tags created are based on parts of the reverse geocoding result, that I found meaning- and useful.

**Example:**

*Photo latitude:* **51.508401588129**  
*Photo longitude:* **-0.098569840193**

*Keywords to be added:* `United Kingdom, England, London, Millennium Bridge`

*Keywords structure (as shown in the Keywords HUD):*

    United Kingdom
    |-- England
        |-- London
            |-- Millennium Bridge


### Installation as an action that runs after import

Scripts that run after import need to be wrapped in a `on ImportActionForVersions(imageSel)` block. (See the Keywords From EXIF script for an example. To run as a service or from the Applescript Editor for example, remove the surrounding block and add `set imageSel to selection` as a first command.)

1. Copy the text of the file.
2. Open the AppleScript Editor app and create a new document.
3. Paste the text and adjust it to your needs (if necessary).
4. Compile it.
5. Save it to a location on your harddrive.
6. On next import in Aperture, add the "Actions" section via the "Import Setting" menu in the top right corner.
7. Select the saved script in the "Actions" section.

From then on, the specified keywords will automatically be added to all your photos on import.


### Installation as a Mac OS X Service

See the Keywords From Location script as an example.

1. Copy the text of the file.
2. Open Automator.
3. Create a new Service.
4. At the top, select "Service receives 'no input' in 'any application'".
5. Add the "Run AppleScript" Action.
6. Paste the copied script.
7. Save this under a meaningful name.

From then on, the script is available OS-wide in every applications "Services" menu. If you like, you can also assign a keyboard shortcut in the System Preferences' Keyboard preferences.

## License

These scripts are released under the [MIT License](http://www.opensource.org/licenses/MIT).