
#  Introduction
The Imaging (IMG, namespace img:) data dictionary is intended as a one-stop shopping place for information about an image.  This includes information about the camera acquiring the image, the state of the camera at acquisition, properties of the image, and processing that has been applied to the image. The IMG data dictionary is a menu of possibilities, and the intent is for data providers to pick the items that they want to use for their camera, and leave the rest off.  Usually, the choices you make will come down to what metadata you have available for your camera and images.  For example, you may have one attribute from IMG in your label, or hundreds - either way, the IMG data dictionary can work to meet your needs.

Questions about this dictionary can be directed to the Imaging Node at pds-imaging@jpl.nasa.gov

Dictionary Repo: https://github.com/pds-data-dictionaries/ldd-img<br>

Namespace Prefix: img: <br>

Suggestions for improvements or new capabilities are welcomed! Please create an issue here: 
https://github.com/pds-data-dictionaries/PDS4-LDD-Issue-Repo/issues


# Imaging (IMG) Dictionary Concepts

## Extensibility 

Most importantly, IMG is designed to be extensible.  It was not feasible to try to define every camera-related concept of which we can think.  Camera developers are far too creative for that.  So the bottom line is, we designed a structure around which new concepts could be added as needed.That said, we want IMG to be comprehensive, and eventually to cover all camera-related concepts.  To be fair, there are some concepts that are truly instrument-specific that belong in a mission-specific data dictionary, but the vast majority of camera and image concepts have the potential for reuse in other instruments or missions.  We want to capture these concepts in the IMG dictionary.  It doesn't matter if your instrument is the only one currently using a concept - if it is reasonably plausible that the same concept could apply to other instruments or missions, it belongs in IMG.<br>

The extensibility of IMG applies at all levels.  You may have another valid value to add to an enumerated keyword.  You may have a new attribute that fits in an existing class.  You may need a whole new class to describe something.  All of these scenarios are perfectly valid, just talk to the IMG stewards, or submit an issue ticket to our github page:<br>

https://github.com/pds-data-dictionaries/PDS4-LDD-Issue-Repo/issues<br>

The bottom line is this: we depend on you, the users of IMG, to help us define what should be in IMG such that it captures as many aspects as possible of any and all camera systems.

## Reuse
Concepts that are common (potentially shared across instruments) should use common classes and attributes.  This is a fundamental design principle of IMG.  However, there are variations in the details across instruments, even when the concept is the same.  For example, missions may have different ways of computing a field of view (Subframe.sample_fov).  A DN value (raw counts in telemetry, generally named using *_count) may represent different physical units (e.g. Exposure.exposure_duration_count).  Different cameras may have different filter names (e.g. Optical_Filter.filter_name).  There also may be different temperature sensors (e.g. Device_Temperature.device_name), and an attribute might have different valid values (e.g. Focus.focus_mode).<br>

All of these benefit from using a shared attribute or class, because it makes searching easier.  Tools can present a list of filter names that's dynamically built from the available images, regardless of the fact that it varies across missions.  Search facets can be constructed that allow easy search of these metadata values, even though the definition is slightly different (see the section on Definitional Nuances, below).  Trends can be found in data sets even when the physical interpretation (such as DN to physical unit conversion) varies across missions.  Some may question this, but it is our belief that it is the philosophy behind the PDS4 Information Model. Regardless of that, it is the foundation around which IMG is built. So we ask data providers to please try to reuse items as much as feasible when working on new missions. As an example, the MSL and Mars 2020 engineering cameras do not actually use a mission-specific data dictionary.  All the concepts can be expressed using IMG's and other disciplines' data dictionaries. That is in fact the goal - being able to describe everything in a multimission way.

## Relationship to Other Dictionaries
IMG is intended to be the primary dictionary used to describe cameras and images. There are several other dictionaries that can be used to augment image data products by working in conjunction with IMG.  The Imaging Surface (namespace img_surface) data dictionary can be used to describe images acquired from cameras mounted on surface rover vehicles. Classes included in the img_surface dictionary contain information about the geometry of the image acquisition, stereo product parameters, and derived product parameters.  The mss_cam_mh dictionary is used to describe Malin Space Science Systems (MSSS) camera mini header parameters.  It is up to the data provider to decide if these additional dictionaries are needed to describe their particular data product.

# How to Include the IMG Local Data Dictionary in a PDS4 Label

From a user point of view, a data dictionary consists of a *.xsd schema file (which defines all the classes and attributes and their relationships) and a *.sch Schematron file (which contains validation rules). You can obtain the latest dictionary files here: <br>
https://pds.nasa.gov/datastandards/dictionaries<br>

New releases of the IMG dictionary are also available here:
https://github.com/pds-data-dictionaries/ldd-img

To use the IMG dictionary with your product, you need to include the dictionary in the label prolog as well as including the main dictionary class `<img:Imaging>` inside the `<Discipline_Area>` tag in your PDS4 .xml file. 

Your label prolog should include the PDS common dictionary and the IMG dictionary specifications (as well as the specifications for any other dictionary used) as indicated in the example below.  There are three definitions required in the prolog for any data dictionary: xml-model to point to the schematron, xmlns to define the namespace, and xsi:schemaLocation to point to the schema file.
```
    <?xml version="1.0" encoding="UTF-8" standalone="no"?>

    <?xml-model href="https://pds.nasa.gov/pds4/pds/v1/PDS4_PDS_XXXX.sch" schematypens="http://purl.oclc.org/dsdl/schematron"?>
    <?xml-model href="https://pds.nasa.gov/pds4/img/v1/PDS4_IMG_1XXX_XXXX.sch" schematypens="http://purl.oclc.org/dsdl/schematron"?>

    <Product_Observational xmlns="http://pds.nasa.gov/pds4/pds/v1" 
        xmlns:img="http://pds.nasa.gov/pds4/img/v1" 
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
        xsi:schemaLocation="   http://pds.nasa.gov/pds4/pds/v1 
    https://pds.nasa.gov/pds4/pds/v1/PDS4_PDS_1XXX.xsd   
    http://pds.nasa.gov/pds4/img/v1 
    https://pds.nasa.gov/pds4/img/v1/PDS4_IMG_1XXX_XXXX.xsd">
```
Note that Xs are used to denote locations where specific version identifiers are located. The example is intended to be generic.

The Imaging class is then inserted into the label as indicated in the label example below. Note that the example label only shows items at the class level.
```
    <Product_Observational xmlns="http://pds.nasa.gov/pds4/pds/v1" 
    xmlns:img="http://pds.nasa.gov/pds4/img/v1" ... > 
        <Identification_Area>
        <Observation_Area>
            <comment>
            <Time_Coordinates>
            <Primary_Result_Summary>
            <Investigation_Area>
            <Observing_System>
            <Target_Identification>
            <Mission_Area>
            <Discipline_Area>
                <img:Imaging>
       <Reference_List>
        <File_Area_Observational>
``` 
Once the `<img:Imaging>` class is included in the label, the dictionary classes and attributes can be used. Remember that the order of classes and attributes are defined by the schema files and will cause a validation error if out of order.

# Imaging Class Summary Outline
Below is a summary list of the top-level classes currently available in the Imaging dictionary. Because IMG is defined to be extensible, there may be classes not listed here (although we will try to keep this up to date).  The only required class is the pds:Local_Internal_Reference class, with all others being optional for maximum flexibility.  Normally, all classes appear under `<img:Imaging>`.  However, there are some circumstances where img: classes or attributes can be used in other data dictionaries (not covered further here, but see for example the msss_cam_mh dictionary).
```
    <img:Imaging>
        pds:Local_Internal_Reference
        img:Brightness_Correction
        img:Col_Sum
        img:Color_Filter_Array
        img:Color_Processing
        img:Dark_Current_Correction
        img:Data_Quality
        img:Detector
        img:Downsampling
        img:Exposure
        img:Flat_Field_Correction
        img:Focus      
        img:Focus_Stack
        img:Frame
        img:High_Dynamic_Range
        img:Histogram
        img:Illumination
        img:Image_Filter
        img:Image_Mask
        img:Onboard_Compression
        img:Optical_Filter
        img:Optical_Properties
        img:Pointing_Correction
        img:Radiometric_Correction
        img:Reference_Pixel
        img:Row_Sum
        img:Sampling
        img:Shutter_Subtraction
        img:Spatial_Filter
        img:Subframe
        img:Thumbnail
        img:Tiling
        img:Video
        img:White_Balance
        img:Instrument_State
        img:Commanded_Parameters
    <img:Imaging>
```
# Organization of Classes and Attributes

 A complete list of classes and attributes for the IMG dictionary can be found online at the PDS4 Data Dictionary page here: <br>
 https://pds.nasa.gov/datastandards/documents/dd/v1/PDS4_PDS_DD_1N00/webhelp/all/
 
 This is regenerated automatically with each release of the PDS4 Information Model.
 
The `<img:Imaging>` class acts as a wrapper for all other IMG classes. At this level all attributes and (as of this writing) instrument classes are optional, with the exception of `<Local_Internal_Reference>`,
which is always required (see under Classes of Note, below). Note that there are no real cases in which every single class and attribute would appear in a single label.


## Alphabetical List of Classes

A complete list of classes for the IMG dictionary can be found online at the PDS4 Data Dictionary page here: 
https://pds.nasa.gov/datastandards/documents/dd/v1/PDS4_PDS_DD_1N00/webhelp/all/

This list is regenerated automatically with each release of the PDS4 Information Model. To find the Imaging dictionary class list, look down the list of (alphabetically sorted) dictionary prefixes in the left menu for "Classes in the img namespace."  Select that item and the list of classes will be presented on both the left and right as clickable links. Clicking on the specific class name will produce a grid with the full, formal definition of the class. Clicking on the class name in the "Referenced from:" line at the bottom of the grid will take you to the containing class, where you can see the cardinality of the class (i.e., whether it is required, optional, or repeatable) in the containing class. You can also click on the attribute names listed to see details of the attribute definitions. 


## Alphabetical List of Attributes

A complete list of attributes for the IMG dictionary can be found online at the PDS4 Data Dictionary page here: 
https://pds.nasa.gov/datastandards/documents/dd/v1/PDS4_PDS_DD_1N00/webhelp/all/

This list is regenerated automatically with each release of the PDS4 Information Model. To find the Imaging (IMG) attribute list, look down the list of (alphabetically sorted) dictionary prefixes in the left menu for "Attributes in the img namespace". Select that item and the list of attributes will be presented on both the left and the right as clickable links.Clicking on the specific attribute name will produce a grid with the full, formal definition of the attribute, including data type, restrictions on values, and the list of defined permissible values (if any) and their definitions.Note that attributes might appear as members of different classes, and that their definitions, or more likely their permissible values, might be context-dependent.Clicking on the class name in the title bar of the attribute grid will take you to the definition of the class containing that attribute.



# Classes of Note

This section describes some of the important Imaging classes whose use may not be obvious.  It is not a full listing of all classes.

## Local_Internal_Reference

It is possible to have multiple images in one product, for example frames from a movie.  For that reason, there is a Local_Internal_Reference at the top of Imaging, which refers to the specific data array being described by this Image instance.  If you have a second image, you can have a second instance of Imaging that points to that second array.  The local_reference type is generally "imaging_parameters_to_image_object" and the local_identifier_reference value matches the local_identifier in one of the Array_*_Image classes in the same label.  Often the value of this identifier is the filename, but that is not required.

This pointer is the only thing that is absolutely required to be present in order to use IMG.  PDS requires being explicit about what you are defining, so even if there's only one image, this confirms that the parameters in img:Imaging are intended to match the actual image array.
```
    <img:Imaging>
        <Local_Internal_Reference>
            <local_identifier_reference>image_array_1</local_identifier_reference>
            <local_reference_type>imaging_parameters_to_image_object</local_reference_type>
        </Local_Internal_Reference>
    ...
    </img:Imaging>
    ...
    <File_Area_Observational>
    ...
        <Array_3D_Image>
            <local_identifier>image_array_1</local_identifier>
            ...
        </Array_3D_Image>
    </File_Area_Observational>
```
Note that several other discipline data dictionaries use this same mechanism (for example, cart:Cartography and disp:Display_Settings).

## Comanded_Parameters
Sometimes when commanding a camera, what you ask for is not exactly what you get.  This is particularly common on the Mars surface missions, where the flight software (FSW) has a fair amount of autonomy.  In order to accommodate this, most of the meaningful IMG classes are available in two places: in the img:Imaging class itself, and in img:Commanded_Parameters, which is itself a child of img:Imaging. Anything directly in Imaging is intended to represent the state of the data as it was actually acquired.Anything in Comanded_Parameters indicates what the camera was asked to do, regardless of what it actually did.  Commanded_Parameters is entirely optional; you can dispense with it entirely if it does not make sense for your instrument.   Some things could appear in Commanded_Parameters only; for example autoexposure parameters are commanded but the actual result is the exposure time, not the autoexposure parameters.
 
## Color_Filter_Array
The Color_Filter_Array class describes whether or not an image was acquired using a Color Filter Array (CFA), for example a Bayer pattern, and if so, whether and how the CFA pattern was removed.  A CFA is a method for making color images using one exposure on a single sensor plane, where microfilters of different wavelengths are put in front of pixels in a specific pattern. The most common pattern is the Bayer pattern, which has a red, blue, and two green pixels in every 2x2 pixel square.  Although generally used for RGB color, CFA filters can be of any number and wavelength, which can be noted in the color_filter_array_type attribute.

## Data_Processing
The Data_Processing class describes how or where processing was done on the data.  It it not intended to be used standalone; rather, it is a base class for quite a number of other classes (for example, Autoexposure, Color_Filter_Array, Color_Processing, Flat_Field_Correction, Spatial_Filter - this is far from an exhaustive list), which inherit from it.  That means that all of these classes have the attributes in Data_Processing as well as their own attributes.  For this reason, we will walk through all the Data_Processing attributes here.

**active_flag** - indicates that the class is active.  This is optional, because the simple presence of the class implies it is active (i.e. the presence of Color_Processing means that color processing was done).  This flag primarily exists so you can say "false" to indicate the processing is NOT active - for example if you want to explicitly note that it was turned off, or if it is providing parameters for historical reasons that may no longer apply to the image.  It can be set to "true" if you want to explicitly say this is turned on to remove any ambiguity.

**processing_venue** - indicates where the processing was done.  Common values are "Onboard" or "Ground" (use these if you can), but others can be defined as needed.  For example, sometimes "Software" vs "Hardware" is used to indicate whether the processing was done by the FSW onboard the spacecraft or by the camera hardware.

**processing_algorithm** - specifies the name of the algorithm used to do the processing.  Algorithm names should be defined in the project documentation and/or definitional nuances.  This is entirely open-ended, so no validation is done at the IMG level, but missions can restrict valid values for each type of processing if they wish.  Many algorithms require parameters to describe the processing.  These parameters are sometimes in a subclass within the processing class (for example, Radial_Flat_Field_Function under Flat_Field_Correction) but are more commonly directly in the processing class (for example Focus_Stack or Image_Filter).

**sequence_number** - if more than one of the same processing was done (for example, two different Spatial_Filters), this specifies the order in which they were done.

Note that it is not the intent of the Data_Processing classes to completely specify everything that was done to the image - that is the job of the proc:Processing dictionary.   Rather, it is to capture the primary properties of the image that are relevant to understanding it.

## Data_Processing_File
The Data_Processing_File class contains attributes which identify a file containing calibration data that was applied to the science data.  It is not intended to be used on its own; rather it is intended to be extended by classes specific to a particular type of file, such as Flat_Field_File, and we generally want to create these "subclasses" to capture what kind of file it is.

The file should be identified using an Internal_Reference if at all possible (meaning it's part of a PDS delivery and this can be pointed at by a PDS LID). If it is not part of PDS4, the External_Reference can be used.  Note that there is a "name" attribute; this identifies just the filename and should only be used  if the file is not available via either an internal or external reference (for example, if the data provider does not know whether or how the cal file will be delivered at the time the archive is prepared).

## Detector
The Detector class contains attributes describing the state of the instrument detector. These are values directly read from the detector and do not necessarily reflect the state of the image after onboard processing.  For example, the entire image may be read into memory and then subframed in software, in which case the subframe attributes in this class reflect the entire image (as read from the detector), whereas those in the Subframe class represent the final subframe results. 

## Downsampling
The Downsampling class describes whether or not downsampling occurred, the venue where it occurred (Software or Hardware), the method used to downsample, and the pixel averaging dimensions. A downsampled image is a smaller version of the image, with reduced resolution of the same coverage area (in other words, a digital zoom). The processing_algorithm attribute specifies the downsample method used, which can vary by mission (try to use values that other missions have used).

## Exposure
The Exposure class contains attributes identifying the image instrument exposure configuration and image exposure values. As a child of the Imaging class, these attribute values identify the actual exposure values when the image was taken. As a child of the Commanded_Parameters class, these attribute values are those that were commanded to the spacecraft at the time the image was taken.  The Exposure class may have an Autoexposure child, which specifies the auto-exposure parameters.  Typically Autoexpose goes under Commanded_Parameters, but nothing prevents it from being in the result section as well.

## Flat_Field_Correction 
The Flat_Field_Correction class specifies how flat-field correction was performed on this image. This can be done either algorithmically, such as via a Radial_Flat_Field_Correction (other algorithms can be added in the future), or using a Flat_Field_File. It can occur multiple times if needed.

## Flat Field File
The Flat_Field_File class specifies the image used for flat field correction, and is a "subclass" of Data_Processing_FIle. In the most straightforward usage, the image is divided by this flat field image in order to apply the flat field correction (which is the opposite of Radial_Flat_Field_Function). There are several types of Flat_Field_File, distinguished by the "type" attribute.  We could add several classes or instances of Flat_Field_File, or one that encompasses all with a type, or anywhere in between, based on what makes sense. 

## Focus
The Focus class contains attributes that describe the focus or autofocus parameters for an observation. As a child of Commanded_Parameters, these indicate the focus settings used to command the instrument. Otherwise, they indicate the actual focus used by the observation.

## Image_Filter
This specifies what kind of algorithmic filtering has been done to the image (as opposed to Optical_Filter) such as high pass filtering, edge detection, or denoising.  Image filtering looks at image intensity rather than the geometry of pixels (contrast with Spatial_Filter).

## Instrument_State
The Instrument_State class contains classes providing the values of any dynamic physical or operating characteristics of the imaging instruments. It is not a required class and can be reused as many times as needed. It contains classes Device_Component_States, Device_Currents, Device_Motor_Counts, Device_Temperatures, and Device_Voltages. 

Each of the Device_* classes are structured in a similar way to maximize re-usability. The structure is a container class that is plural (ends in "s"), e.g. Device_Temperatures. Within the container class a specific class with similar name to the container class describes the specific item.  Within the specific class, the name, and parameters are given.  This structure allows more flexibility in the names of components (which vary greatly from instrument to instrument) without having to update the Data Dictionary for each one.  See the Device_Temperature example below:
```
    <img:Instrument_State>
        <img:Device_Temperatures>
            <img:Device_Temperature>
                <img:device_name>A_FRONT_LEFT_HAZ_1</img:device_name>
                <img:temperature_value unit="degC">-16.3138</img:temperature_value>
            </img:Device_Temperature>
            <img:Device_Temperature>
                <img:device_name>A_FRONT_LEFT_HAZ_2</img:device_name>
                <img:temperature_value unit="degC">-17.3484</img:temperature_value>
            </img:Device_Temperature>
        <img:Device_Temperatures>
    <img:Instrument_State>
```
## Onboard Compression
The Onboard_Compression class contains attributes describing the compression performed onboard a spacecraft or instrument for data storage and transmission. It has nothing to do with compression that may have been applied on the ground (for example, to make a browse JPEG).

## Optical Filter
The Optical_Filter class defines the filters used by the camera optics (not to be confused with image processing software filters, defined by Image_Filter or Spatial_Filter). The filter may be identified by name, identifier, number, wavelength, or some combination of these.

## Spatial_Filter
The Spatial_Filter specifies what kind of spatial filtering has been done on the image.  Spatial filtering looks at the geometry of pixels (e.g. XYZ or range values) rather than their intensity (contrast with Image_Filter). 

## Subframe
The Subframe class describes what portion of the image detector was used for this image.  In contrast to downsampling, subframing reduces the size of the image by reducing the spatial extent or field of view, while retaining the same resolution.  Subframes are specified with respect to the full detector, before downsampling.  Thus if an image is both subframed and downsampled, the subframe parameters apply to the full resolution detector. 

# Advanced Concepts 
## Definitional Nuances
In order to better accommodate the reuse described above, we use a concept of definitional "nuance."  This modifies the base definition in some way that is specific to the mission at hand.  These can be seen in the following examples: 

[Mars 2020 Cameras Product Label Keywords Definitions, Values](https://pds-geosciences.wustl.edu/m2020/urn-nasa-pds-mars2020_mission/document_camera/Mars2020_Camera_SIS_Labels_sort_pds.html)

[Insight-Specific Product Label Keyword Definitions, Values](https://planetarydata.jpl.nasa.gov/img/data/nsyt/insight_cameras/document/pds4_attribute_definitions_sort_pds.html)

[Voyager Documentation](https://pds-imaging.jpl.nasa.gov/archive/archive/vgr/pdart/r1/wenkert_pdart16_vgr_rav1ciun/document/RAV1CIUN_SIS_Labels_sort_pds.html)
 
Look for entries under Description that say "For Mars 2020" or "For InSight" or "For Voyager".  This is a mechanism currently being standardized for describing the mission-specific nuances of attribute definitions (not just for IMG). As of this writing, the mechanism to store these nuances is still in flux, but it should be nailed down soon (talk to the IMG stewards if you want to add more).

## Mission-Specific Validations
It is possible to validate attributes in IMG (or any data dictionary) differently based on the actual mission (documentation on how should be forthcoming shortly).  So for example, data providers could enforce that Mars 2020 data have a certain set of filter names, while Voyager has a different set.  In all cases, you are restricting what is available in IMG itself for a particular mission, never expanding it.

For this reason, IMG itself does not do a lot of validation of keyword values.  Many are open-ended, so we depend on missions to add mission-specific validations as they desire.  We are trying to maintain maximum flexibility for reuse.  However, we do encourage missions to add their own validations that are specific to their mission - these validations go in the mission-specific data dictionary, not in IMG itself, even though they restrict IMG attribute values.

# Examples
Many millions of image labels have been delivered at this point, so there are plenty of real-world examples.  The Mars 2020 labels are particularly good at making use of the breadth of capability that Imaging offers.

## Example of actual M2020 Label 
  M2020 label used for example purposes to show a real usage of IMG dictionary.

Bundle ID: mars2020_navcam_ops_raw

Taken from [here](https://pds-imaging.jpl.nasa.gov/beta/archive-explorer?mission=mars_2020&instrument=navcam&bundle=mars2020_navcam_ops_raw&uri=atlas:pds4:mars_2020:perseverance:/mars2020_navcam_ops_raw/data/sol/00629/ids/edr/ncam/NLF_0629_0722782785_631ECM_N0301344NCAM00427_06_095J01.IMG-)


```
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- MIPL PDS4 Velocity templates version: 8b7fe906a081fcabe0699b376cac54e77617b9a2 -->
<?xml-model href="https://pds.nasa.gov/pds4/pds/v1/PDS4_PDS_1G00.sch" schematypens="http://purl.oclc.org/dsdl/schematron"?>
<?xml-model href="https://pds.nasa.gov/pds4/cart/v1/PDS4_CART_1G00_1970.sch" schematypens="http://purl.oclc.org/dsdl/schematron"?>
<?xml-model href="https://pds.nasa.gov/pds4/disp/v1/PDS4_DISP_1G00_1500.sch" schematypens="http://purl.oclc.org/dsdl/schematron"?>
<?xml-model href="https://pds.nasa.gov/pds4/img/v1/PDS4_IMG_1G00_1870.sch" schematypens="http://purl.oclc.org/dsdl/schematron"?>
<?xml-model href="https://pds.nasa.gov/pds4/geom/v1/PDS4_GEOM_1G00_1960.sch" schematypens="http://purl.oclc.org/dsdl/schematron"?>
<?xml-model href="https://pds.nasa.gov/pds4/proc/v1/PDS4_PROC_1G00_1210.sch" schematypens="http://purl.oclc.org/dsdl/schematron"?>
<?xml-model href="https://pds.nasa.gov/pds4/msn/v1/PDS4_MSN_1G00_1300.sch" schematypens="http://purl.oclc.org/dsdl/schematron"?>
<?xml-model href="https://pds.nasa.gov/pds4/msn_surface/v1/PDS4_MSN_SURFACE_1G00_1220.sch" schematypens="http://purl.oclc.org/dsdl/schematron"?>
<?xml-model href="https://pds.nasa.gov/pds4/img_surface/v1/PDS4_IMG_SURFACE_1G00_1270.sch" schematypens="http://purl.oclc.org/dsdl/schematron"?>
<?xml-model href="https://pds.nasa.gov/pds4/msss_cam_mh/v1/PDS4_MSSS_CAM_MH_1G00_1030.sch" schematypens="http://purl.oclc.org/dsdl/schematron"?>
<?xml-model href="https://pds.nasa.gov/pds4/mission/mars2020/v1/PDS4_MARS2020_1G00_1010.sch" schematypens="http://purl.oclc.org/dsdl/schematron"?>

<Product_Observational xmlns="http://pds.nasa.gov/pds4/pds/v1" 
    xmlns:cart="http://pds.nasa.gov/pds4/cart/v1" 
    xmlns:disp="http://pds.nasa.gov/pds4/disp/v1" 
    xmlns:geom="http://pds.nasa.gov/pds4/geom/v1" 
    xmlns:img="http://pds.nasa.gov/pds4/img/v1" 
    xmlns:img_surface="http://pds.nasa.gov/pds4/img_surface/v1" 
    xmlns:mars2020="http://pds.nasa.gov/pds4/mission/mars2020/v1" 
    xmlns:msn="http://pds.nasa.gov/pds4/msn/v1" 
    xmlns:msn_surface="http://pds.nasa.gov/pds4/msn_surface/v1" 
    xmlns:msss_cam_mh="http://pds.nasa.gov/pds4/msss_cam_mh/v1" 
    xmlns:pds="http://pds.nasa.gov/pds4/pds/v1" 
    xmlns:proc="http://pds.nasa.gov/pds4/proc/v1" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    xsi:schemaLocation="   http://pds.nasa.gov/pds4/pds/v1 https://pds.nasa.gov/pds4/pds/v1/PDS4_PDS_1G00.xsd   http://pds.nasa.gov/pds4/img/v1 https://pds.nasa.gov/pds4/img/v1/PDS4_IMG_1G00_1870.xsd      http://pds.nasa.gov/pds4/proc/v1 https://pds.nasa.gov/pds4/proc/v1/PDS4_PROC_1G00_1210.xsd      http://pds.nasa.gov/pds4/msn/v1 https://pds.nasa.gov/pds4//msn/v1/PDS4_MSN_1G00_1300.xsd   http://pds.nasa.gov/pds4/msn_surface/v1 https://pds.nasa.gov/pds4/msn_surface/v1/PDS4_MSN_SURFACE_1G00_1220.xsd   http://pds.nasa.gov/pds4/img_surface/v1 https://pds.nasa.gov/pds4/img_surface/v1/PDS4_IMG_SURFACE_1G00_1270.xsd   http://pds.nasa.gov/pds4/geom/v1 https://pds.nasa.gov/pds4/geom/v1/PDS4_GEOM_1G00_1960.xsd   http://pds.nasa.gov/pds4/disp/v1 https://pds.nasa.gov/pds4/disp/v1/PDS4_DISP_1G00_1500.xsd   http://pds.nasa.gov/pds4/cart/v1 https://pds.nasa.gov/pds4/cart/v1/PDS4_CART_1G00_1970.xsd   http://pds.nasa.gov/pds4/msss_cam_mh/v1 https://pds.nasa.gov/pds4/msss_cam_mh/v1/PDS4_MSSS_CAM_MH_1G00_1030.xsd   http://pds.nasa.gov/pds4/mission/mars2020/v1 https://pds.nasa.gov/pds4/mission/mars2020/v1/PDS4_MARS2020_1G00_1010.xsd">
  <Identification_Area>
    <logical_identifier>urn:nasa:pds:mars2020_navcam_ops_raw:data:nlf_0629_0722782785_631ecm_n0301344ncam00427_06_095j</logical_identifier>
    <version_id>1.0</version_id>
    <title>Mars2020 NAVCAM_LEFT ECM  Observational Product - nlf_0629_0722782785_631ecm_n0301344ncam00427_06_095j</title>
    <information_model_version>1.16.0.0</information_model_version>
    <product_class>Product_Observational</product_class>
    <Alias_List>
      <Alias>
        <alternate_id>NLF_0629_0722782785_631ECM_N0301344NCAM00427_06_095J01</alternate_id>
        <comment>VICAR PRODUCT_ID</comment>
      </Alias>
    </Alias_List>
  </Identification_Area>
  <Observation_Area>
    <comment>Observational Intent</comment>
    <Time_Coordinates>
      <start_date_time>2022-11-27T01:08:36.002Z</start_date_time>
      <stop_date_time>2022-11-27T01:08:37.102Z</stop_date_time>
      <local_mean_solar_time>13:21:49.137</local_mean_solar_time>
      <local_true_solar_time>12:33:33</local_true_solar_time>
      <solar_longitude unit="deg">344.968</solar_longitude>
    </Time_Coordinates>
    <Primary_Result_Summary>
      <purpose>Science</purpose>
      <processing_level>Raw</processing_level>
      <Science_Facets>
        <wavelength_range>Visible</wavelength_range>
        <domain>Surface</domain>
        <discipline_name>Imaging</discipline_name>
      </Science_Facets>
    </Primary_Result_Summary>
    <Investigation_Area>
      <name>Mars2020</name>
      <type>Mission</type>
      <Internal_Reference>
        <lid_reference>urn:nasa:pds:context:investigation:mission.mars2020</lid_reference>
        <reference_type>data_to_investigation</reference_type>
        <comment>This is the PDS4 logical identifier for the Mars2020 Mission.</comment>
      </Internal_Reference>
    </Investigation_Area>
    <Observing_System>
      <Observing_System_Component>
        <name>Mars 2020</name>
        <type>Host</type>
        <Internal_Reference>
          <lid_reference>urn:nasa:pds:context:instrument_host:spacecraft.mars2020</lid_reference>
          <reference_type>is_instrument_host</reference_type>
          <comment>This is the PDS4 logical identifier for the Mars 2020 spacecraft.</comment>
        </Internal_Reference>
      </Observing_System_Component>
      <Observing_System_Component>
        <name>Navigation Camera Left</name>
        <type>Instrument</type>
        <Internal_Reference>
          <lid_reference>urn:nasa:pds:context:instrument:mars2020.ecam</lid_reference>
          <reference_type>is_instrument</reference_type>
          <comment>This is the PDS4 logical identifier for the Navigation Camera Left onboard the Mars 2020 spacecraft.</comment>
        </Internal_Reference>
      </Observing_System_Component>
    </Observing_System>
    <Target_Identification>
      <name>Mars</name>
      <type>Planet</type>
      <Internal_Reference>
        <lid_reference>urn:nasa:pds:context:target:planet.mars</lid_reference>
        <reference_type>data_to_target</reference_type>
        <comment>This is the PDS4 logical identifier for the planet - mars.</comment>
      </Internal_Reference>
    </Target_Identification>
    <Mission_Area>
      <mars2020:Mars2020_Parameters>
        <mars2020:Observation_Information>
          <mars2020:mission_phase_name>Surface Mission</mars2020:mission_phase_name>
          <mars2020:spacecraft_clock_start>722782785.631</mars2020:spacecraft_clock_start>
          <mars2020:spacecraft_clock_stop>722782786.731</mars2020:spacecraft_clock_stop>
          <mars2020:spacecraft_clock_partition>1</mars2020:spacecraft_clock_partition>
          <mars2020:sol_number>629</mars2020:sol_number>
          <mars2020:start_local_mean_solar_time>Sol-00629M13:21:49.137</mars2020:start_local_mean_solar_time>
          <mars2020:start_local_true_solar_time>12:33:33</mars2020:start_local_true_solar_time>
          <mars2020:start_local_true_solar_time_sol>629</mars2020:start_local_true_solar_time_sol>
          <mars2020:start_solar_longitude unit="deg">344.968</mars2020:start_solar_longitude>
          <mars2020:active_flight_computer>A</mars2020:active_flight_computer>
        </mars2020:Observation_Information>
      </mars2020:Mars2020_Parameters>
    </Mission_Area>
    <Discipline_Area>
      <disp:Display_Settings>
        <Local_Internal_Reference>
          <local_identifier_reference>nlf_0629_0722782785_631ecm_n0301344ncam00427_06_095j</local_identifier_reference>
          <local_reference_type>display_settings_to_array</local_reference_type>
        </Local_Internal_Reference>
        <disp:Display_Direction>
          <disp:horizontal_display_axis>Sample</disp:horizontal_display_axis>
          <disp:horizontal_display_direction>Left to Right</disp:horizontal_display_direction>
          <disp:vertical_display_axis>Line</disp:vertical_display_axis>
          <disp:vertical_display_direction>Top to Bottom</disp:vertical_display_direction>
        </disp:Display_Direction>
        <disp:Color_Display_Settings>
          <disp:color_display_axis>Band</disp:color_display_axis>
          <disp:red_channel_band>1</disp:red_channel_band>
          <disp:green_channel_band>2</disp:green_channel_band>
          <disp:blue_channel_band>3</disp:blue_channel_band>
        </disp:Color_Display_Settings>
      </disp:Display_Settings>
      <geom:Geometry>
        <geom:SPICE_Kernel_Files>
          <geom:SPICE_Kernel_Identification>
            <geom:spice_kernel_file_name>chronos.m2020_ops210303_v1</geom:spice_kernel_file_name>
          </geom:SPICE_Kernel_Identification>
        </geom:SPICE_Kernel_Files>
        <geom:Geometry_Lander>
          <geom:geometry_state>Telemetry</geom:geometry_state>
          <geom:description>Geometry as reported by the spacecraft in telemetry</geom:description>
          <local_identifier>geom_telemetry_state</local_identifier>
          <geom:Articulation_Device_Parameters>
            <geom:device_id>RSM</geom:device_id>
            <geom:device_name>REMOTE SENSING MAST</geom:device_name>
            <geom:device_mode>DEPLOYED</geom:device_mode>
            <geom:Device_Angle>
              <geom:Device_Angle_Index>
                <geom:index_id>AZIMUTH FINAL-RESOLVER</geom:index_id>
                <geom:index_value_angle unit="rad">5.10068</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>ELEVATION FINAL-RESOLVER</geom:index_id>
                <geom:index_value_angle unit="rad">1.4108</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>AZIMUTH INITIAL-RESOLVER</geom:index_id>
                <geom:index_value_angle unit="rad">3.17002</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>ELEVATION INITIAL-RESOLVER</geom:index_id>
                <geom:index_value_angle unit="rad">1.00978</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>AZIMUTH REQUESTED</geom:index_id>
                <geom:index_value_angle unit="rad">5.10835</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>ELEVATION REQUESTED</geom:index_id>
                <geom:index_value_angle unit="rad">1.41332</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>AZIMUTH FINAL-ENCODER</geom:index_id>
                <geom:index_value_angle unit="rad">5.10829</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>ELEVATION FINAL-ENCODER</geom:index_id>
                <geom:index_value_angle unit="rad">1.41331</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>AZIMUTH INITIAL-ENCODER</geom:index_id>
                <geom:index_value_angle unit="rad">3.17775</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>ELEVATION INITIAL-ENCODER</geom:index_id>
                <geom:index_value_angle unit="rad">1.01241</geom:index_value_angle>
              </geom:Device_Angle_Index>
            </geom:Device_Angle>
            <geom:Device_Temperature>
              <geom:Device_Temperature_Index>
                <geom:index_id>NAVCAM LEFT CAMERA PLATE</geom:index_id>
                <geom:index_value_temperature unit="degC">-19.6144</geom:index_value_temperature>
              </geom:Device_Temperature_Index>
              <geom:Device_Temperature_Index>
                <geom:index_id>NAVCAM RIGHT CAMERA PLATE</geom:index_id>
                <geom:index_value_temperature unit="degC">-19.5222</geom:index_value_temperature>
              </geom:Device_Temperature_Index>
            </geom:Device_Temperature>
            <geom:Commanded_Geometry>
              <geom:command_type>No_Motion</geom:command_type>
              <geom:Device_Angle>
                <geom:Device_Angle_Index>
                  <geom:index_name>Unknown</geom:index_name>
                  <geom:index_value_angle unit="rad">0.0</geom:index_value_angle>
                </geom:Device_Angle_Index>
              </geom:Device_Angle>
            </geom:Commanded_Geometry>
          </geom:Articulation_Device_Parameters>
          <geom:Articulation_Device_Parameters>
            <geom:device_id>ARM</geom:device_id>
            <geom:device_name>SAMPLE ARM</geom:device_name>
            <geom:selected_instrument_id>DOCKING POST</geom:selected_instrument_id>
            <geom:Device_Angle>
              <geom:Device_Angle_Index>
                <geom:index_id>JOINT 1 AZIMUTH-HALL SENSOR</geom:index_id>
                <geom:index_value_angle unit="rad">1.57291</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>JOINT 2 ELEVATION-HALL SENSOR</geom:index_id>
                <geom:index_value_angle unit="rad">-0.286141</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>JOINT 3 ELBOW-HALL SENSOR</geom:index_id>
                <geom:index_value_angle unit="rad">-2.81939</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>JOINT 4 WRIST-HALL SENSOR</geom:index_id>
                <geom:index_value_angle unit="rad">3.11068</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>JOINT 5 TURRET-HALL SENSOR</geom:index_id>
                <geom:index_value_angle unit="rad">4.86046</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>JOINT 1 AZIMUTH-RESOLVER</geom:index_id>
                <geom:index_value_angle unit="rad">1.57228</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>JOINT 2 ELEVATION-RESOLVER</geom:index_id>
                <geom:index_value_angle unit="rad">-0.285633</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>JOINT 3 ELBOW-RESOLVER</geom:index_id>
                <geom:index_value_angle unit="rad">-2.82144</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>JOINT 4 WRIST-RESOLVER</geom:index_id>
                <geom:index_value_angle unit="rad">3.11019</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>JOINT 5 TURRET-RESOLVER</geom:index_id>
                <geom:index_value_angle unit="rad">4.86115</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>SCS DOCKING CLOCK ANGLE</geom:index_id>
                <geom:index_value_angle unit="rad">0.0600239</geom:index_value_angle>
              </geom:Device_Angle_Index>
            </geom:Device_Angle>
            <geom:Device_Component_State>
              <geom:Device_Component_State_Index>
                <geom:index_id>PRELOAD_VALUE</geom:index_id>
                <geom:index_value_string>0</geom:index_value_string>
              </geom:Device_Component_State_Index>
              <geom:Device_Component_State_Index>
                <geom:index_id>PRELOAD_TOOL</geom:index_id>
                <geom:index_value_string>DOCKING POST</geom:index_value_string>
              </geom:Device_Component_State_Index>
            </geom:Device_Component_State>
            <geom:Device_Component_State>
              <geom:Device_Component_State_Index>
                <geom:index_id>FACILITY CONTACT SENSOR A</geom:index_id>
                <geom:index_value_string>NO CONTACT</geom:index_value_string>
              </geom:Device_Component_State_Index>
              <geom:Device_Component_State_Index>
                <geom:index_id>FACILITY CONTACT SENSOR B</geom:index_id>
                <geom:index_value_string>NO CONTACT</geom:index_value_string>
              </geom:Device_Component_State_Index>
              <geom:Device_Component_State_Index>
                <geom:index_id>DRILL STABILIZER 1</geom:index_id>
                <geom:index_value_string>NO CONTACT</geom:index_value_string>
              </geom:Device_Component_State_Index>
              <geom:Device_Component_State_Index>
                <geom:index_id>DRILL STABILIZER 2</geom:index_id>
                <geom:index_value_string>NO CONTACT</geom:index_value_string>
              </geom:Device_Component_State_Index>
              <geom:Device_Component_State_Index>
                <geom:index_id>DOCK 1</geom:index_id>
                <geom:index_value_string>NO CONTACT</geom:index_value_string>
              </geom:Device_Component_State_Index>
              <geom:Device_Component_State_Index>
                <geom:index_id>DOCK 2</geom:index_id>
                <geom:index_value_string>NO CONTACT</geom:index_value_string>
              </geom:Device_Component_State_Index>
              <geom:Device_Component_State_Index>
                <geom:index_id>DOCK 3</geom:index_id>
                <geom:index_value_string>NO CONTACT</geom:index_value_string>
              </geom:Device_Component_State_Index>
              <geom:Device_Component_State_Index>
                <geom:index_id>DOCK 4</geom:index_id>
                <geom:index_value_string>NO CONTACT</geom:index_value_string>
              </geom:Device_Component_State_Index>
            </geom:Device_Component_State>
            <geom:Device_Pose>
              <geom:name>arm_attitude_reference</geom:name>
              <geom:Quaternion_Plus_Direction>
                <geom:qcos>0.0</geom:qcos>
                <geom:qsin1>0.0</geom:qsin1>
                <geom:qsin2>0.0</geom:qsin2>
                <geom:qsin3>0.0</geom:qsin3>
                <geom:rotation_direction>Forward</geom:rotation_direction>
              </geom:Quaternion_Plus_Direction>
            </geom:Device_Pose>
            <geom:Device_Temperature>
              <geom:Device_Temperature_Index>
                <geom:index_id>AZIMUTH JOINT</geom:index_id>
                <geom:index_value_temperature unit="degC">-38.4707</geom:index_value_temperature>
              </geom:Device_Temperature_Index>
              <geom:Device_Temperature_Index>
                <geom:index_id>ELEVATION JOINT</geom:index_id>
                <geom:index_value_temperature unit="degC">-36.5302</geom:index_value_temperature>
              </geom:Device_Temperature_Index>
              <geom:Device_Temperature_Index>
                <geom:index_id>ELBOW JOINT</geom:index_id>
                <geom:index_value_temperature unit="degC">-30.082</geom:index_value_temperature>
              </geom:Device_Temperature_Index>
              <geom:Device_Temperature_Index>
                <geom:index_id>WRIST JOINT</geom:index_id>
                <geom:index_value_temperature unit="degC">-32.7637</geom:index_value_temperature>
              </geom:Device_Temperature_Index>
              <geom:Device_Temperature_Index>
                <geom:index_id>TURRET JOINT</geom:index_id>
                <geom:index_value_temperature unit="degC">-44.572</geom:index_value_temperature>
              </geom:Device_Temperature_Index>
              <geom:Device_Temperature_Index>
                <geom:index_id>DEFLECTION BODY DELTA TEMPERATURE</geom:index_id>
                <geom:index_value_temperature unit="degC">0.0</geom:index_value_temperature>
              </geom:Device_Temperature_Index>
              <geom:Device_Temperature_Index>
                <geom:index_id>DEFLECTION ARM DELTA TEMPERATURE</geom:index_id>
                <geom:index_value_temperature unit="degC">-38.9804</geom:index_value_temperature>
              </geom:Device_Temperature_Index>
            </geom:Device_Temperature>
          </geom:Articulation_Device_Parameters>
          <geom:Articulation_Device_Parameters>
            <geom:device_id>CHASSIS</geom:device_id>
            <geom:device_name>MOBILITY CHASSIS</geom:device_name>
            <geom:device_mode>DEPLOYED</geom:device_mode>
            <geom:Device_Angle>
              <geom:Device_Angle_Index>
                <geom:index_id>LEFT FRONT WHEEL STEER MOTOR</geom:index_id>
                <geom:index_value_angle unit="rad">0.839897</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>RIGHT FRONT WHEEL STEER MOTOR</geom:index_id>
                <geom:index_value_angle unit="rad">-0.839727</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>LEFT REAR WHEEL STEER MOTOR</geom:index_id>
                <geom:index_value_angle unit="rad">-0.791151</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>RIGHT REAR WHEEL STEER MOTOR</geom:index_id>
                <geom:index_value_angle unit="rad">0.79098</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>LEFT BOGIE</geom:index_id>
                <geom:index_value_angle unit="rad">0.00306596</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>RIGHT BOGIE</geom:index_id>
                <geom:index_value_angle unit="rad">0.00230399</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>LEFT DIFFERENTIAL</geom:index_id>
                <geom:index_value_angle unit="rad">0.0184399</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>RIGHT DIFFERENTIAL</geom:index_id>
                <geom:index_value_angle unit="rad">-0.00506445</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>LEFT FRONT WHEEL DRIVE MOTOR</geom:index_id>
                <geom:index_value_angle unit="rad">159.013</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>RIGHT FRONT WHEEL DRIVE MOTOR</geom:index_id>
                <geom:index_value_angle unit="rad">170.283</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>MIDDLE LEFT WHEEL DRIVE MOTOR</geom:index_id>
                <geom:index_value_angle unit="rad">160.453</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>MIDDLE RIGHT WHEEL DRIVE MOTOR</geom:index_id>
                <geom:index_value_angle unit="rad">168.794</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>LEFT REAR WHEEL DRIVE MOTOR</geom:index_id>
                <geom:index_value_angle unit="rad">159.313</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>RIGHT REAR WHEEL DRIVE MOTOR</geom:index_id>
                <geom:index_value_angle unit="rad">169.938</geom:index_value_angle>
              </geom:Device_Angle_Index>
            </geom:Device_Angle>
            <geom:Vector_Device_Gravity>
              <geom:x_unit>-0.08021072911388244</geom:x_unit>
              <geom:y_unit>-0.06839581830437126</geom:y_unit>
              <geom:z_unit>0.9944286052671126</geom:z_unit>
            </geom:Vector_Device_Gravity>
            <geom:Vector_Device_Gravity_Magnitude>
              <geom:x_acceleration unit="m/s**2">-0.29834</geom:x_acceleration>
              <geom:y_acceleration unit="m/s**2">-0.254395</geom:y_acceleration>
              <geom:z_acceleration unit="m/s**2">3.69873</geom:z_acceleration>
            </geom:Vector_Device_Gravity_Magnitude>
          </geom:Articulation_Device_Parameters>
          <geom:Articulation_Device_Parameters>
            <geom:device_id>HGA</geom:device_id>
            <geom:device_name>HIGH GAIN ANTENNA</geom:device_name>
            <geom:device_mode>DEPLOYED</geom:device_mode>
            <geom:Device_Angle>
              <geom:Device_Angle_Index>
                <geom:index_id>AZIMUTH</geom:index_id>
                <geom:index_value_angle unit="rad">1.13444</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>ELEVATION</geom:index_id>
                <geom:index_value_angle unit="rad">-0.784997</geom:index_value_angle>
              </geom:Device_Angle_Index>
            </geom:Device_Angle>
          </geom:Articulation_Device_Parameters>
          <geom:Articulation_Device_Parameters>
            <geom:device_id>DRILL</geom:device_id>
            <geom:device_name>DRILL</geom:device_name>
            <geom:device_mode>DRILL</geom:device_mode>
            <geom:Device_Angle>
              <geom:Device_Angle_Index>
                <geom:index_id>SPINDLE OUTPUT POSITION-RESOLVER</geom:index_id>
                <geom:index_value_angle unit="rad">-0.556504</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>CHUCK POSITION-RESOLVER</geom:index_id>
                <geom:index_value_angle unit="rad">-0.468318</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>PERCUSS POSITION-RESOLVER</geom:index_id>
                <geom:index_value_angle unit="rad">0.0</geom:index_value_angle>
              </geom:Device_Angle_Index>
            </geom:Device_Angle>
          </geom:Articulation_Device_Parameters>
          <geom:Articulation_Device_Parameters>
            <geom:device_id>SCS</geom:device_id>
            <geom:device_name>SAMPLE CACHE SYSTEM</geom:device_name>
            <geom:Device_Angle>
              <geom:Device_Angle_Index>
                <geom:index_id>SCS BIT CAROUSEL-HALL SENSOR</geom:index_id>
                <geom:index_value_angle unit="rad">224.799</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>SCS BIT CAROUSEL-RESOLVER</geom:index_id>
                <geom:index_value_angle unit="rad">218.516</geom:index_value_angle>
              </geom:Device_Angle_Index>
            </geom:Device_Angle>
          </geom:Articulation_Device_Parameters>
          <geom:Articulation_Device_Parameters>
            <geom:device_id>SHA</geom:device_id>
            <geom:device_name>SAMPLE HANDLING ARM</geom:device_name>
            <geom:Device_Angle>
              <geom:Device_Angle_Index>
                <geom:index_id>SHA JOINT 1 Z-HALL SENSOR</geom:index_id>
                <geom:index_value_angle unit="rad">0.0179931</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>SHA JOINT 2 SHOULDER-HALL SENSOR</geom:index_id>
                <geom:index_value_angle unit="rad">-0.239406</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>SHA JOINT 3 ELBOW-HALL SENSOR</geom:index_id>
                <geom:index_value_angle unit="rad">2.68496</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>SHA JOINT 1 Z-RESOLVER</geom:index_id>
                <geom:index_value_angle unit="rad">0.0</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>SHA JOINT 2 SHOULDER-RESOLVER</geom:index_id>
                <geom:index_value_angle unit="rad">-0.239482</geom:index_value_angle>
              </geom:Device_Angle_Index>
              <geom:Device_Angle_Index>
                <geom:index_id>SHA JOINT 3 ELBOW-RESOLVER</geom:index_id>
                <geom:index_value_angle unit="rad">2.68452</geom:index_value_angle>
              </geom:Device_Angle_Index>
            </geom:Device_Angle>
          </geom:Articulation_Device_Parameters>
          <geom:Camera_Model_Parameters>
            <geom:model_type>CAHVORE</geom:model_type>
            <geom:calibration_source_id>1</geom:calibration_source_id>
            <geom:CAHVORE_Model>
              <geom:Vector_Center>
                <geom:x_position unit="m">0.955584</geom:x_position>
                <geom:y_position unit="m">0.764515</geom:y_position>
                <geom:z_position unit="m">-1.95254</geom:z_position>
              </geom:Vector_Center>
              <geom:Vector_Axis>
                <geom:x_unit>-0.35631</geom:x_unit>
                <geom:y_unit>0.916392</geom:y_unit>
                <geom:z_unit>0.182443</geom:z_unit>
              </geom:Vector_Axis>
              <geom:Vector_Horizontal>
                <geom:x_pixel>-3229.43</geom:x_pixel>
                <geom:y_pixel>141.993</geom:y_pixel>
                <geom:z_pixel>229.563</geom:z_pixel>
              </geom:Vector_Horizontal>
              <geom:Vector_Vertical>
                <geom:x_pixel>-168.067</geom:x_pixel>
                <geom:y_pixel>400.716</geom:y_pixel>
                <geom:z_pixel>3088.89</geom:z_pixel>
              </geom:Vector_Vertical>
              <geom:Vector_Optical>
                <geom:x_unit>-0.357624</geom:x_unit>
                <geom:y_unit>0.915861</geom:y_unit>
                <geom:z_unit>0.182539</geom:z_unit>
              </geom:Vector_Optical>
              <geom:Radial_Terms>
                <geom:c0>1.736e-06</geom:c0>
                <geom:c1>0.0501396</geom:c1>
                <geom:c2>-0.0171254</geom:c2>
              </geom:Radial_Terms>
              <geom:Entrance_Terms>
                <geom:c0>-8.0e-09</geom:c0>
                <geom:c1>1.0e-08</geom:c1>
                <geom:c2>-2.9e-08</geom:c2>
              </geom:Entrance_Terms>
              <geom:cahvore_model_type>2</geom:cahvore_model_type>
              <geom:cahvore_model_parameter>0.0</geom:cahvore_model_parameter>
            </geom:CAHVORE_Model>
            <geom:Coordinate_Space_Reference>
              <geom:Coordinate_Space_Indexed>
                <geom:coordinate_space_frame_type>ROVER_NAV_FRAME</geom:coordinate_space_frame_type>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>SITE</geom:index_id>
                  <geom:index_value_number>30</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>DRIVE</geom:index_id>
                  <geom:index_value_number>1344</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>POSE</geom:index_id>
                  <geom:index_value_number>4</geom:index_value_number>
                </geom:Coordinate_Space_Index>
              </geom:Coordinate_Space_Indexed>
            </geom:Coordinate_Space_Reference>
            <geom:Quaternion_Model_Transform>
              <geom:qcos>0.563254</geom:qcos>
              <geom:qsin1>0.071888</geom:qsin1>
              <geom:qsin2>-0.0507901</geom:qsin2>
              <geom:qsin3>0.821582</geom:qsin3>
            </geom:Quaternion_Model_Transform>
            <geom:Vector_Model_Transform>
              <geom:x>0.804941</geom:x>
              <geom:y>0.559508</geom:y>
              <geom:z>-1.91903</geom:z>
            </geom:Vector_Model_Transform>
            <geom:Interpolation>
              <geom:interpolation_algorithm>Piecewise Bilinear</geom:interpolation_algorithm>
              <geom:interpolation_variable>Temperature</geom:interpolation_variable>
              <geom:interpolation_value>-19.6144</geom:interpolation_value>
            </geom:Interpolation>
          </geom:Camera_Model_Parameters>
          <geom:Coordinate_Space_Definition>
            <local_identifier>ROVER_NAV_FRAME_30_1344_4_0_0_0_2_0_0_0</local_identifier>
            <local_identifier>ROVER_NAV_FRAME_30_1344_4_0_0_0_2_0_0_0_TELEMETRY</local_identifier>
            <geom:positive_azimuth_direction>Clockwise</geom:positive_azimuth_direction>
            <geom:positive_elevation_direction>Up</geom:positive_elevation_direction>
            <geom:Coordinate_Space_Present>
              <geom:Coordinate_Space_Indexed>
                <geom:coordinate_space_frame_type>ROVER_NAV_FRAME</geom:coordinate_space_frame_type>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>SITE</geom:index_id>
                  <geom:index_value_number>30</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>DRIVE</geom:index_id>
                  <geom:index_value_number>1344</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>POSE</geom:index_id>
                  <geom:index_value_number>4</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>ARM</geom:index_id>
                  <geom:index_value_number>0</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>SHA</geom:index_id>
                  <geom:index_value_number>0</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>DRILL</geom:index_id>
                  <geom:index_value_number>0</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>RSM</geom:index_id>
                  <geom:index_value_number>2</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>HGA</geom:index_id>
                  <geom:index_value_number>0</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>BITCAR</geom:index_id>
                  <geom:index_value_number>0</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>SEAL</geom:index_id>
                  <geom:index_value_number>0</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:solution_id>TELEMETRY</geom:solution_id>
              </geom:Coordinate_Space_Indexed>
            </geom:Coordinate_Space_Present>
            <geom:Vector_Origin_Offset>
              <geom:x_position unit="m">94.6281</geom:x_position>
              <geom:y_position unit="m">-118.938</geom:y_position>
              <geom:z_position unit="m">-7.51133</geom:z_position>
            </geom:Vector_Origin_Offset>
            <geom:Quaternion_Plus_Direction>
              <geom:qcos>0.174493</geom:qcos>
              <geom:qsin1>0.034765</geom:qsin1>
              <geom:qsin2>0.0422949</geom:qsin2>
              <geom:qsin3>-0.983135</geom:qsin3>
              <geom:rotation_direction>Forward</geom:rotation_direction>
            </geom:Quaternion_Plus_Direction>
            <geom:Coordinate_Space_Reference>
              <Local_Internal_Reference>
                <local_identifier_reference>SITE_FRAME_30</local_identifier_reference>
                <local_reference_type>to_reference_coordinate_space</local_reference_type>
              </Local_Internal_Reference>
            </geom:Coordinate_Space_Reference>
            <geom:Coordinate_Space_Quality>
              <geom:quaternion_measurement_method>Sun_Find</geom:quaternion_measurement_method>
              <geom:attitude_propagation_counter>15878.0</geom:attitude_propagation_counter>
            </geom:Coordinate_Space_Quality>
          </geom:Coordinate_Space_Definition>
          <geom:Coordinate_Space_Definition>
            <local_identifier>SITE_FRAME_30</local_identifier>
            <local_identifier>SITE_FRAME_30_TELEMETRY</local_identifier>
            <geom:positive_azimuth_direction>Clockwise</geom:positive_azimuth_direction>
            <geom:positive_elevation_direction>Up</geom:positive_elevation_direction>
            <geom:Coordinate_Space_Present>
              <geom:Coordinate_Space_Indexed>
                <geom:coordinate_space_frame_type>SITE_FRAME</geom:coordinate_space_frame_type>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>SITE</geom:index_id>
                  <geom:index_value_number>30</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:solution_id>TELEMETRY</geom:solution_id>
              </geom:Coordinate_Space_Indexed>
            </geom:Coordinate_Space_Present>
            <geom:Vector_Origin_Offset>
              <geom:x_position unit="m">36.576</geom:x_position>
              <geom:y_position unit="m">-10.604</geom:y_position>
              <geom:z_position unit="m">-1.15378</geom:z_position>
            </geom:Vector_Origin_Offset>
            <geom:Quaternion_Plus_Direction>
              <geom:qcos>1.0</geom:qcos>
              <geom:qsin1>0.0</geom:qsin1>
              <geom:qsin2>0.0</geom:qsin2>
              <geom:qsin3>0.0</geom:qsin3>
              <geom:rotation_direction>Forward</geom:rotation_direction>
            </geom:Quaternion_Plus_Direction>
            <geom:Coordinate_Space_Reference>
              <geom:Coordinate_Space_Indexed>
                <geom:coordinate_space_frame_type>SITE_FRAME</geom:coordinate_space_frame_type>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>SITE</geom:index_id>
                  <geom:index_value_number>29</geom:index_value_number>
                </geom:Coordinate_Space_Index>
              </geom:Coordinate_Space_Indexed>
            </geom:Coordinate_Space_Reference>
            <geom:Coordinate_Space_Quality>
              <geom:quaternion_measurement_method>Unknown</geom:quaternion_measurement_method>
            </geom:Coordinate_Space_Quality>
          </geom:Coordinate_Space_Definition>
          <geom:Coordinate_Space_Definition>
            <local_identifier>RSM_HEAD_FRAME_30_1344_4_0_0_0_2_0_0_0</local_identifier>
            <local_identifier>RSM_HEAD_FRAME_30_1344_4_0_0_0_2_0_0_0_TELEMETRY</local_identifier>
            <geom:positive_azimuth_direction>Clockwise</geom:positive_azimuth_direction>
            <geom:positive_elevation_direction>Up</geom:positive_elevation_direction>
            <geom:Coordinate_Space_Present>
              <geom:Coordinate_Space_Indexed>
                <geom:coordinate_space_frame_type>RSM_HEAD_FRAME</geom:coordinate_space_frame_type>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>SITE</geom:index_id>
                  <geom:index_value_number>30</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>DRIVE</geom:index_id>
                  <geom:index_value_number>1344</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>POSE</geom:index_id>
                  <geom:index_value_number>4</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>ARM</geom:index_id>
                  <geom:index_value_number>0</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>SHA</geom:index_id>
                  <geom:index_value_number>0</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>DRILL</geom:index_id>
                  <geom:index_value_number>0</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>RSM</geom:index_id>
                  <geom:index_value_number>2</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>HGA</geom:index_id>
                  <geom:index_value_number>0</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>BITCAR</geom:index_id>
                  <geom:index_value_number>0</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>SEAL</geom:index_id>
                  <geom:index_value_number>0</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:solution_id>TELEMETRY</geom:solution_id>
              </geom:Coordinate_Space_Indexed>
            </geom:Coordinate_Space_Present>
            <geom:Vector_Origin_Offset>
              <geom:x_position unit="m">0.804941</geom:x_position>
              <geom:y_position unit="m">0.559508</geom:y_position>
              <geom:z_position unit="m">-1.91903</geom:z_position>
            </geom:Vector_Origin_Offset>
            <geom:Quaternion_Plus_Direction>
              <geom:qcos>0.563254</geom:qcos>
              <geom:qsin1>0.071888</geom:qsin1>
              <geom:qsin2>-0.0507901</geom:qsin2>
              <geom:qsin3>0.821582</geom:qsin3>
              <geom:rotation_direction>Forward</geom:rotation_direction>
            </geom:Quaternion_Plus_Direction>
            <geom:Coordinate_Space_Reference>
              <Local_Internal_Reference>
                <local_identifier_reference>ROVER_NAV_FRAME_30_1344_4_0_0_0_2_0_0_0</local_identifier_reference>
                <local_reference_type>to_reference_coordinate_space</local_reference_type>
              </Local_Internal_Reference>
            </geom:Coordinate_Space_Reference>
            <geom:Coordinate_Space_Quality>
              <geom:quaternion_measurement_method>Unknown</geom:quaternion_measurement_method>
            </geom:Coordinate_Space_Quality>
          </geom:Coordinate_Space_Definition>
          <geom:Coordinate_Space_Definition>
            <local_identifier>ARM_TURRET_FRAME_30_1344_4_0_0_0_2_0_0_0</local_identifier>
            <local_identifier>ARM_TURRET_FRAME_30_1344_4_0_0_0_2_0_0_0_TELEMETRY</local_identifier>
            <geom:positive_azimuth_direction>Clockwise</geom:positive_azimuth_direction>
            <geom:positive_elevation_direction>Up</geom:positive_elevation_direction>
            <geom:Coordinate_Space_Present>
              <geom:Coordinate_Space_Indexed>
                <geom:coordinate_space_frame_type>ARM_TURRET_FRAME</geom:coordinate_space_frame_type>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>SITE</geom:index_id>
                  <geom:index_value_number>30</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>DRIVE</geom:index_id>
                  <geom:index_value_number>1344</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>POSE</geom:index_id>
                  <geom:index_value_number>4</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>ARM</geom:index_id>
                  <geom:index_value_number>0</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>SHA</geom:index_id>
                  <geom:index_value_number>0</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>DRILL</geom:index_id>
                  <geom:index_value_number>0</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>RSM</geom:index_id>
                  <geom:index_value_number>2</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>HGA</geom:index_id>
                  <geom:index_value_number>0</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>BITCAR</geom:index_id>
                  <geom:index_value_number>0</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>SEAL</geom:index_id>
                  <geom:index_value_number>0</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:solution_id>TELEMETRY</geom:solution_id>
              </geom:Coordinate_Space_Indexed>
            </geom:Coordinate_Space_Present>
            <geom:Vector_Origin_Offset>
              <geom:x_position unit="m">1.084</geom:x_position>
              <geom:y_position unit="m">-0.429244</geom:y_position>
              <geom:z_position unit="m">-1.40245</geom:z_position>
            </geom:Vector_Origin_Offset>
            <geom:Quaternion_Plus_Direction>
              <geom:qcos>0.997202</geom:qcos>
              <geom:qsin1>-0.00181361</geom:qsin1>
              <geom:qsin2>0.00115445</geom:qsin2>
              <geom:qsin3>0.0747286</geom:qsin3>
              <geom:rotation_direction>Forward</geom:rotation_direction>
            </geom:Quaternion_Plus_Direction>
            <geom:Coordinate_Space_Reference>
              <Local_Internal_Reference>
                <local_identifier_reference>ROVER_NAV_FRAME_30_1344_4_0_0_0_2_0_0_0</local_identifier_reference>
                <local_reference_type>to_reference_coordinate_space</local_reference_type>
              </Local_Internal_Reference>
            </geom:Coordinate_Space_Reference>
            <geom:Coordinate_Space_Quality>
              <geom:quaternion_measurement_method>Unknown</geom:quaternion_measurement_method>
            </geom:Coordinate_Space_Quality>
          </geom:Coordinate_Space_Definition>
          <geom:Coordinate_Space_Definition>
            <local_identifier>ARM_DOCKING_POST_FRAME_30_1344_4_0_0_0_2_0_0_0</local_identifier>
            <local_identifier>ARM_DOCKING_POST_FRAME_30_1344_4_0_0_0_2_0_0_0_TELEMETRY</local_identifier>
            <geom:positive_azimuth_direction>Clockwise</geom:positive_azimuth_direction>
            <geom:positive_elevation_direction>Up</geom:positive_elevation_direction>
            <geom:Coordinate_Space_Present>
              <geom:Coordinate_Space_Indexed>
                <geom:coordinate_space_frame_type>ARM_DOCKING_POST_FRAME</geom:coordinate_space_frame_type>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>SITE</geom:index_id>
                  <geom:index_value_number>30</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>DRIVE</geom:index_id>
                  <geom:index_value_number>1344</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>POSE</geom:index_id>
                  <geom:index_value_number>4</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>ARM</geom:index_id>
                  <geom:index_value_number>0</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>SHA</geom:index_id>
                  <geom:index_value_number>0</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>DRILL</geom:index_id>
                  <geom:index_value_number>0</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>RSM</geom:index_id>
                  <geom:index_value_number>2</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>HGA</geom:index_id>
                  <geom:index_value_number>0</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>BITCAR</geom:index_id>
                  <geom:index_value_number>0</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:Coordinate_Space_Index>
                  <geom:index_id>SEAL</geom:index_id>
                  <geom:index_value_number>0</geom:index_value_number>
                </geom:Coordinate_Space_Index>
                <geom:solution_id>TELEMETRY</geom:solution_id>
              </geom:Coordinate_Space_Indexed>
            </geom:Coordinate_Space_Present>
            <geom:Vector_Origin_Offset>
              <geom:x_position unit="m">1.37695</geom:x_position>
              <geom:y_position unit="m">-0.385272</geom:y_position>
              <geom:z_position unit="m">-1.40323</geom:z_position>
            </geom:Vector_Origin_Offset>
            <geom:Quaternion_Plus_Direction>
              <geom:qcos>0.997202</geom:qcos>
              <geom:qsin1>-0.00182057</geom:qsin1>
              <geom:qsin2>0.00115189</geom:qsin2>
              <geom:qsin3>0.0747194</geom:qsin3>
              <geom:rotation_direction>Forward</geom:rotation_direction>
            </geom:Quaternion_Plus_Direction>
            <geom:Coordinate_Space_Reference>
              <Local_Internal_Reference>
                <local_identifier_reference>ROVER_NAV_FRAME_30_1344_4_0_0_0_2_0_0_0</local_identifier_reference>
                <local_reference_type>to_reference_coordinate_space</local_reference_type>
              </Local_Internal_Reference>
            </geom:Coordinate_Space_Reference>
            <geom:Coordinate_Space_Quality>
              <geom:quaternion_measurement_method>Unknown</geom:quaternion_measurement_method>
            </geom:Coordinate_Space_Quality>
          </geom:Coordinate_Space_Definition>
          <geom:Derived_Geometry>
            <geom:instrument_azimuth unit="deg">110.554</geom:instrument_azimuth>
            <geom:instrument_elevation unit="deg">-10.0659</geom:instrument_elevation>
            <geom:solar_azimuth unit="deg">6.01225</geom:solar_azimuth>
            <geom:solar_elevation unit="deg">58.718</geom:solar_elevation>
            <geom:Vector_Solar_Direction>
              <geom:x_unit>0.516395</geom:x_unit>
              <geom:y_unit>0.0543869</geom:y_unit>
              <geom:z_unit>-0.854622</geom:z_unit>
            </geom:Vector_Solar_Direction>
            <geom:Coordinate_Space_Reference>
              <Local_Internal_Reference>
                <local_identifier_reference>ROVER_NAV_FRAME_30_1344_4_0_0_0_2_0_0_0</local_identifier_reference>
                <local_reference_type>to_reference_coordinate_space</local_reference_type>
              </Local_Internal_Reference>
            </geom:Coordinate_Space_Reference>
          </geom:Derived_Geometry>
          <geom:Derived_Geometry>
            <geom:instrument_azimuth unit="deg">-50.247</geom:instrument_azimuth>
            <geom:instrument_elevation unit="deg">-7.87312</geom:instrument_elevation>
            <geom:solar_azimuth unit="deg">199.087</geom:solar_azimuth>
            <geom:solar_elevation unit="deg">63.6787</geom:solar_elevation>
            <geom:Coordinate_Space_Reference>
              <Local_Internal_Reference>
                <local_identifier_reference>SITE_FRAME_30</local_identifier_reference>
                <local_reference_type>to_reference_coordinate_space</local_reference_type>
              </Local_Internal_Reference>
            </geom:Coordinate_Space_Reference>
          </geom:Derived_Geometry>
          <geom:Motion_Counter>
            <geom:name>RMC</geom:name>
            <geom:Motion_Counter_Index>
              <geom:index_id>SITE</geom:index_id>
              <geom:index_value_number>30</geom:index_value_number>
            </geom:Motion_Counter_Index>
            <geom:Motion_Counter_Index>
              <geom:index_id>DRIVE</geom:index_id>
              <geom:index_value_number>1344</geom:index_value_number>
            </geom:Motion_Counter_Index>
            <geom:Motion_Counter_Index>
              <geom:index_id>POSE</geom:index_id>
              <geom:index_value_number>4</geom:index_value_number>
            </geom:Motion_Counter_Index>
            <geom:Motion_Counter_Index>
              <geom:index_id>ARM</geom:index_id>
              <geom:index_value_number>0</geom:index_value_number>
            </geom:Motion_Counter_Index>
            <geom:Motion_Counter_Index>
              <geom:index_id>SHA</geom:index_id>
              <geom:index_value_number>0</geom:index_value_number>
            </geom:Motion_Counter_Index>
            <geom:Motion_Counter_Index>
              <geom:index_id>DRILL</geom:index_id>
              <geom:index_value_number>0</geom:index_value_number>
            </geom:Motion_Counter_Index>
            <geom:Motion_Counter_Index>
              <geom:index_id>RSM</geom:index_id>
              <geom:index_value_number>2</geom:index_value_number>
            </geom:Motion_Counter_Index>
            <geom:Motion_Counter_Index>
              <geom:index_id>HGA</geom:index_id>
              <geom:index_value_number>0</geom:index_value_number>
            </geom:Motion_Counter_Index>
            <geom:Motion_Counter_Index>
              <geom:index_id>BITCAR</geom:index_id>
              <geom:index_value_number>0</geom:index_value_number>
            </geom:Motion_Counter_Index>
            <geom:Motion_Counter_Index>
              <geom:index_id>SEAL</geom:index_id>
              <geom:index_value_number>0</geom:index_value_number>
            </geom:Motion_Counter_Index>
          </geom:Motion_Counter>
        </geom:Geometry_Lander>
        <geom:Geometry_Lander>
          <geom:geometry_state>Initial</geom:geometry_state>
          <geom:description>Initial state of geometry before onboard updates (e.g. visual odometry)</geom:description>
          <local_identifier>geom_initial_state</local_identifier>
          <geom:Motion_Counter>
            <geom:name>RMC</geom:name>
            <geom:Motion_Counter_Index>
              <geom:index_id>SITE</geom:index_id>
              <geom:index_value_number>30</geom:index_value_number>
            </geom:Motion_Counter_Index>
            <geom:Motion_Counter_Index>
              <geom:index_id>DRIVE</geom:index_id>
              <geom:index_value_number>1344</geom:index_value_number>
            </geom:Motion_Counter_Index>
            <geom:Motion_Counter_Index>
              <geom:index_id>POSE</geom:index_id>
              <geom:index_value_number>4</geom:index_value_number>
            </geom:Motion_Counter_Index>
            <geom:Motion_Counter_Index>
              <geom:index_id>ARM</geom:index_id>
              <geom:index_value_number>0</geom:index_value_number>
            </geom:Motion_Counter_Index>
            <geom:Motion_Counter_Index>
              <geom:index_id>SHA</geom:index_id>
              <geom:index_value_number>0</geom:index_value_number>
            </geom:Motion_Counter_Index>
            <geom:Motion_Counter_Index>
              <geom:index_id>DRILL</geom:index_id>
              <geom:index_value_number>0</geom:index_value_number>
            </geom:Motion_Counter_Index>
            <geom:Motion_Counter_Index>
              <geom:index_id>RSM</geom:index_id>
              <geom:index_value_number>2</geom:index_value_number>
            </geom:Motion_Counter_Index>
            <geom:Motion_Counter_Index>
              <geom:index_id>HGA</geom:index_id>
              <geom:index_value_number>0</geom:index_value_number>
            </geom:Motion_Counter_Index>
            <geom:Motion_Counter_Index>
              <geom:index_id>BITCAR</geom:index_id>
              <geom:index_value_number>0</geom:index_value_number>
            </geom:Motion_Counter_Index>
            <geom:Motion_Counter_Index>
              <geom:index_id>SEAL</geom:index_id>
              <geom:index_value_number>0</geom:index_value_number>
            </geom:Motion_Counter_Index>
          </geom:Motion_Counter>
        </geom:Geometry_Lander>
      </geom:Geometry>
      <img:Imaging>
        <Local_Internal_Reference>
          <local_identifier_reference>nlf_0629_0722782785_631ecm_n0301344ncam00427_06_095j</local_identifier_reference>
          <local_reference_type>imaging_parameters_to_image_object</local_reference_type>
        </Local_Internal_Reference>
        <img:Color_Filter_Array>
          <img:processing_venue>Onboard</img:processing_venue>
          <img:processing_algorithm>Malvar</img:processing_algorithm>
          <img:color_filter_array_type>Bayer RGGB</img:color_filter_array_type>
          <img:color_filter_array_state>Decoded</img:color_filter_array_state>
        </img:Color_Filter_Array>
        <img:Detector>
          <img:first_line>953</img:first_line>
          <img:first_sample>1273</img:first_sample>
          <img:lines>976</img:lines>
          <img:samples>1296</img:samples>
          <img:detector_to_image_rotation unit="deg">0.0</img:detector_to_image_rotation>
        </img:Detector>
        <img:Downsampling>
          <img:processing_algorithm>NONE</img:processing_algorithm>
          <img:Pixel_Averaging_Dimensions>
            <img:height_pixels unit="pixel">1</img:height_pixels>
            <img:width_pixels unit="pixel">1</img:width_pixels>
          </img:Pixel_Averaging_Dimensions>
        </img:Downsampling>
        <img:Exposure>
          <img:exposure_count>5</img:exposure_count>
          <img:exposure_duration unit="ms">11.111</img:exposure_duration>
          <img:exposure_duration_count>215</img:exposure_duration_count>
          <img:exposure_scale_factor>1.0</img:exposure_scale_factor>
          <img:exposure_coadd_count>16</img:exposure_coadd_count>
          <img:exposure_readout_count>6</img:exposure_readout_count>
        </img:Exposure>
        <img:Flat_Field_Correction>
          <img:active_flag>false</img:active_flag>
        </img:Flat_Field_Correction>
        <img:Frame>
          <img:frame_id>Left</img:frame_id>
          <img:frame_type_name>Stereo</img:frame_type_name>
          <img:product_flag>true</img:product_flag>
        </img:Frame>
        <img:Onboard_Compression>
          <img:onboard_compression_class>Lossy</img:onboard_compression_class>
          <img:onboard_compression_mode>2</img:onboard_compression_mode>
          <img:onboard_compression_type>JPEG</img:onboard_compression_type>
          <img:onboard_compression_quality>0.95</img:onboard_compression_quality>
          <img:deferred_flag>false</img:deferred_flag>
          <img:error_pixel_count>0</img:error_pixel_count>
          <img:JPEG_Parameters>
            <img:color_subsampling_mode>4:2:2</img:color_subsampling_mode>
            <img:jpeg_quality>95</img:jpeg_quality>
          </img:JPEG_Parameters>
        </img:Onboard_Compression>
        <img:Sampling>
          <img:sample_bits>8</img:sample_bits>
          <img:sample_bit_mask>2#11111111#</img:sample_bit_mask>
          <img:Companding>
            <img:processing_venue>Software</img:processing_venue>
            <img:processing_algorithm>LUT2</img:processing_algorithm>
            <img:companding_state>Companded</img:companding_state>
          </img:Companding>
        </img:Sampling>
        <img:Subframe>
          <img:first_line>953</img:first_line>
          <img:first_sample>1273</img:first_sample>
          <img:lines>976</img:lines>
          <img:samples>1296</img:samples>
          <img:line_fov unit="deg">18.6047</img:line_fov>
          <img:sample_fov unit="deg">24.7326</img:sample_fov>
          <img:subframe_type>Hardware Else Software</img:subframe_type>
        </img:Subframe>
        <img:Instrument_State>
          <img:Device_Temperatures>
            <img:Device_Temperature>
              <img:device_name>A_FRONT_LEFT_HAZ_1</img:device_name>
              <img:temperature_value unit="degC">-24.9498</img:temperature_value>
            </img:Device_Temperature>
            <img:Device_Temperature>
              <img:device_name>A_FRONT_LEFT_HAZ_2</img:device_name>
              <img:temperature_value unit="degC">-25.9604</img:temperature_value>
            </img:Device_Temperature>
            <img:Device_Temperature>
              <img:device_name>A_FRONT_RIGHT_HAZ_1</img:device_name>
              <img:temperature_value unit="degC">-23.614</img:temperature_value>
            </img:Device_Temperature>
            <img:Device_Temperature>
              <img:device_name>A_FRONT_RIGHT_HAZ_2</img:device_name>
              <img:temperature_value unit="degC">-23.2475</img:temperature_value>
            </img:Device_Temperature>
            <img:Device_Temperature>
              <img:device_name>B_FRONT_LEFT_HAZ_1</img:device_name>
              <img:temperature_value unit="degC">-25.1943</img:temperature_value>
            </img:Device_Temperature>
            <img:Device_Temperature>
              <img:device_name>B_FRONT_LEFT_HAZ_2</img:device_name>
              <img:temperature_value unit="degC">-26.6424</img:temperature_value>
            </img:Device_Temperature>
            <img:Device_Temperature>
              <img:device_name>B_FRONT_RIGHT_HAZ_1</img:device_name>
              <img:temperature_value unit="degC">-23.277</img:temperature_value>
            </img:Device_Temperature>
            <img:Device_Temperature>
              <img:device_name>B_FRONT_RIGHT_HAZ_2</img:device_name>
              <img:temperature_value unit="degC">-24.1201</img:temperature_value>
            </img:Device_Temperature>
            <img:Device_Temperature>
              <img:device_name>REAR_LEFT_HAZ_1</img:device_name>
              <img:temperature_value unit="degC">-3.15646</img:temperature_value>
            </img:Device_Temperature>
            <img:Device_Temperature>
              <img:device_name>REAR_LEFT_HAZ_2</img:device_name>
              <img:temperature_value unit="degC">0.0</img:temperature_value>
            </img:Device_Temperature>
            <img:Device_Temperature>
              <img:device_name>REAR_RIGHT_HAZ_1</img:device_name>
              <img:temperature_value unit="degC">-1.80889</img:temperature_value>
            </img:Device_Temperature>
            <img:Device_Temperature>
              <img:device_name>REAR_RIGHT_HAZ_2</img:device_name>
              <img:temperature_value unit="degC">0.0</img:temperature_value>
            </img:Device_Temperature>
            <img:Device_Temperature>
              <img:device_name>NAVCAM_LEFT_1</img:device_name>
              <img:temperature_value unit="degC">-16.426</img:temperature_value>
            </img:Device_Temperature>
            <img:Device_Temperature>
              <img:device_name>NAVCAM_LEFT_2</img:device_name>
              <img:temperature_value unit="degC">-16.2952</img:temperature_value>
            </img:Device_Temperature>
            <img:Device_Temperature>
              <img:device_name>NAVCAM_RIGHT_1</img:device_name>
              <img:temperature_value unit="degC">-14.3333</img:temperature_value>
            </img:Device_Temperature>
            <img:Device_Temperature>
              <img:device_name>NAVCAM_RIGHT_2</img:device_name>
              <img:temperature_value unit="degC">-15.7825</img:temperature_value>
            </img:Device_Temperature>
            <img:Device_Temperature>
              <img:device_name>CACHE_1</img:device_name>
              <img:temperature_value unit="degC">-31.9712</img:temperature_value>
            </img:Device_Temperature>
            <img:Device_Temperature>
              <img:device_name>CACHE_2</img:device_name>
              <img:temperature_value unit="degC">0.0</img:temperature_value>
            </img:Device_Temperature>
            <img:Device_Temperature>
              <img:device_name>FRONT_HAZ_LEFT_CAL</img:device_name>
              <img:temperature_value unit="degC">-22.198</img:temperature_value>
            </img:Device_Temperature>
            <img:Device_Temperature>
              <img:device_name>FRONT_HAZ_RIGHT_CAL</img:device_name>
              <img:temperature_value unit="degC">-20.3259</img:temperature_value>
            </img:Device_Temperature>
            <img:Device_Temperature>
              <img:device_name>NAVCAM_LEFT_CAL</img:device_name>
              <img:temperature_value unit="degC">-19.6144</img:temperature_value>
            </img:Device_Temperature>
            <img:Device_Temperature>
              <img:device_name>NAVCAM_RIGHT_CAL</img:device_name>
              <img:temperature_value unit="degC">-19.5222</img:temperature_value>
            </img:Device_Temperature>
          </img:Device_Temperatures>
        </img:Instrument_State>
        <img:Commanded_Parameters>
          <img:Col_Sum>
            <img:download_priority>67</img:download_priority>
            <img:product_flag>false</img:product_flag>
          </img:Col_Sum>
          <img:Detector>
            <img:erase_count>2</img:erase_count>
            <img:bad_pixel_replacement_flag>true</img:bad_pixel_replacement_flag>
            <img:bad_pixel_replacement_table_id>1</img:bad_pixel_replacement_table_id>
            <img:instrument_idle_timeout unit="s">300</img:instrument_idle_timeout>
            <img:early_image_return>false</img:early_image_return>
          </img:Detector>
          <img:Downsampling>
            <img:Pixel_Averaging_Dimensions>
              <img:height_pixels unit="pixel">1</img:height_pixels>
              <img:width_pixels unit="pixel">1</img:width_pixels>
            </img:Pixel_Averaging_Dimensions>
          </img:Downsampling>
          <img:Exposure>
            <img:exposure_duration_count>200</img:exposure_duration_count>
            <img:exposure_type>None</img:exposure_type>
            <img:exposure_scale_factor>1.0</img:exposure_scale_factor>
            <img:exposure_coadd_count>16</img:exposure_coadd_count>
          </img:Exposure>
          <img:Histogram>
            <img:download_priority>67</img:download_priority>
            <img:product_flag>false</img:product_flag>
          </img:Histogram>
          <img:Onboard_Compression>
            <img:onboard_compression_class>Lossy</img:onboard_compression_class>
            <img:onboard_compression_mode>2</img:onboard_compression_mode>
            <img:onboard_compression_type>JPEG</img:onboard_compression_type>
            <img:onboard_compression_quality>0</img:onboard_compression_quality>
            <img:deferred_flag>false</img:deferred_flag>
            <img:JPEG_Parameters>
              <img:jpeg_quality>0</img:jpeg_quality>
            </img:JPEG_Parameters>
          </img:Onboard_Compression>
          <img:Row_Sum>
            <img:download_priority>67</img:download_priority>
            <img:product_flag>false</img:product_flag>
          </img:Row_Sum>
          <img:Sampling>
            <img:Companding>
              <img:processing_algorithm>LUT2</img:processing_algorithm>
              <img:companding_state>Companded</img:companding_state>
            </img:Companding>
          </img:Sampling>
          <img:Thumbnail>
            <img:download_priority>17</img:download_priority>
            <img:product_flag>true</img:product_flag>
            <img:Onboard_Compression>
              <img:onboard_compression_mode>1</img:onboard_compression_mode>
              <img:onboard_compression_type>ICER</img:onboard_compression_type>
              <img:onboard_compression_quality>1</img:onboard_compression_quality>
              <img:deferred_flag>false</img:deferred_flag>
              <img:ICER_Parameters>
                <img:icer_quality>0</img:icer_quality>
              </img:ICER_Parameters>
            </img:Onboard_Compression>
            <img:Sampling>
              <img:Companding>
                <img:processing_algorithm>LUT2</img:processing_algorithm>
                <img:companding_state>Companded</img:companding_state>
              </img:Companding>
            </img:Sampling>
            <img:Subframe>
              <img:lines>60</img:lines>
              <img:samples>80</img:samples>
            </img:Subframe>
          </img:Thumbnail>
        </img:Commanded_Parameters>
      </img:Imaging>
      <img_surface:Surface_Imaging>
        <img_surface:Image_Identifiers>
          <img_surface:image_id>0</img_surface:image_id>
          <img_surface:image_id_2>0</img_surface:image_id_2>
        </img_surface:Image_Identifiers>
        <img_surface:Instrument_Information>
          <img_surface:image_type>REGULAR</img_surface:image_type>
          <img_surface:image_acquire_mode>IMAGE</img_surface:image_acquire_mode>
          <img_surface:instrument_type>IMAGING CAMERA</img_surface:instrument_type>
          <img_surface:instrument_mode_id>0</img_surface:instrument_mode_id>
          <img_surface:instrument_serial_number>103</img_surface:instrument_serial_number>
          <img_surface:instrument_version_number>FM</img_surface:instrument_version_number>
          <img_surface:ops_instrument_key>NAVCAM_LEFT</img_surface:ops_instrument_key>
        </img_surface:Instrument_Information>
        <img_surface:Geometry_Projection>
          <img_surface:geometry_projection_type>Raw</img_surface:geometry_projection_type>
        </img_surface:Geometry_Projection>
        <img_surface:Commanded_Parameters>
          <img_surface:Instrument_Information>
            <img_surface:ops_instrument_key>NAVCAM_LEFT</img_surface:ops_instrument_key>
          </img_surface:Instrument_Information>
        </img_surface:Commanded_Parameters>
      </img_surface:Surface_Imaging>
      <msn:Mission_Information>
        <msn:mission_phase_name>Surface Mission</msn:mission_phase_name>
        <msn:product_type_name>ECM</msn:product_type_name>
        <msn:spacecraft_clock_start>722782785.631</msn:spacecraft_clock_start>
        <msn:spacecraft_clock_stop>722782786.731</msn:spacecraft_clock_stop>
        <msn:spacecraft_clock_partition>1</msn:spacecraft_clock_partition>
        <msn:Surface_Mission>
          <msn:start_sol_number>629</msn:start_sol_number>
          <msn:start_local_mean_solar_time>13:21:49.137</msn:start_local_mean_solar_time>
          <msn:start_local_mean_solar_time_sol>629</msn:start_local_mean_solar_time_sol>
          <msn:start_local_true_solar_time>12:33:33</msn:start_local_true_solar_time>
          <msn:start_local_true_solar_time_sol>629</msn:start_local_true_solar_time_sol>
          <msn:solar_longitude unit="deg">344.968</msn:solar_longitude>
        </msn:Surface_Mission>
        <msn:Observation_Context>
          <msn:active_flight_computer>A</msn:active_flight_computer>
        </msn:Observation_Context>
      </msn:Mission_Information>
      <msn_surface:Surface_Mission_Information>
        <msn_surface:Command_Execution>
          <msn_surface:sequence_id>ncam00427</msn_surface:sequence_id>
          <msn_surface:sequence_version_id>0</msn_surface:sequence_version_id>
          <msn_surface:sequence_execution_count>1</msn_surface:sequence_execution_count>
          <msn_surface:command_sequence_number>6</msn_surface:command_sequence_number>
          <msn_surface:command_source_id>GND</msn_surface:command_source_id>
          <msn_surface:command_dispatch_sclk>722782823:19888</msn_surface:command_dispatch_sclk>
          <msn_surface:request_id>0</msn_surface:request_id>
          <msn_surface:boot_counter>3336</msn_surface:boot_counter>
        </msn_surface:Command_Execution>
        <msn_surface:Telemetry>
          <msn_surface:application_id>54</msn_surface:application_id>
          <msn_surface:application_name>ImgImageJpegNl</msn_surface:application_name>
          <msn_surface:provider_id>MPCS_M2020_DP</msn_surface:provider_id>
          <msn_surface:flight_software_version_id>442959749</msn_surface:flight_software_version_id>
          <msn_surface:telemetry_source_name>ImgImageJpegNl_0722782785-41420-1.dat</msn_surface:telemetry_source_name>
          <msn_surface:transport_protocol>Data Product</msn_surface:transport_protocol>
          <msn_surface:communication_session_id>56291</msn_surface:communication_session_id>
          <msn_surface:telemetry_source_start_time>2022-331T01:08:36.002Z</msn_surface:telemetry_source_start_time>
          <msn_surface:telemetry_source_sclk_start>722782785.414</msn_surface:telemetry_source_sclk_start>
          <msn_surface:product_completion_status>COMPLETE_CHECKSUM_PASS</msn_surface:product_completion_status>
          <msn_surface:earth_received_start_date_time>2022-11-28T17:31:18.693Z</msn_surface:earth_received_start_date_time>
          <msn_surface:earth_received_stop_date_time>2022-11-28T17:31:21.009Z</msn_surface:earth_received_stop_date_time>
          <msn_surface:download_priority>67</msn_surface:download_priority>
          <msn_surface:data_size>379555</msn_surface:data_size>
          <msn_surface:expected_packets>39</msn_surface:expected_packets>
          <msn_surface:received_packets>39</msn_surface:received_packets>
          <msn_surface:telemetry_source_host_name>m20-sops-control-1</msn_surface:telemetry_source_host_name>
          <msn_surface:expected_transmission_path>128</msn_surface:expected_transmission_path>
          <msn_surface:transmission_path>0</msn_surface:transmission_path>
          <msn_surface:flight_software_mode>SURFACE_NOMINAL</msn_surface:flight_software_mode>
          <msn_surface:telemetry_source_size>379555</msn_surface:telemetry_source_size>
          <msn_surface:telemetry_source_checksum>6783</msn_surface:telemetry_source_checksum>
          <msn_surface:auto_delete_flag>false</msn_surface:auto_delete_flag>
          <msn_surface:virtual_channel_id>0</msn_surface:virtual_channel_id>
        </msn_surface:Telemetry>
        <msn_surface:Commanded_Parameters>
          <msn_surface:download_priority>67</msn_surface:download_priority>
        </msn_surface:Commanded_Parameters>
      </msn_surface:Surface_Mission_Information>
      <proc:Processing_Information>
        <Local_Internal_Reference>
          <local_identifier_reference>nlf_0629_0722782785_631ecm_n0301344ncam00427_06_095j</local_identifier_reference>
          <local_reference_type>processing_information_to_data_object</local_reference_type>
        </Local_Internal_Reference>
        <proc:Process>
          <proc:process_owner_institution_name>MULTIMISSION INSTRUMENT PROCESSING LAB, JET PROPULSION LAB</proc:process_owner_institution_name>
          <proc:Software>
            <proc:Software_Program>
              <proc:name>TASK</proc:name>
              <proc:program_type_name>VICAR</proc:program_type_name>
              <proc:program_user>jpluser</proc:program_user>
              <proc:program_start_date_time>2022-11-28T18:07:43.043Z</proc:program_start_date_time>
            </proc:Software_Program>
            <proc:Software_Program>
              <proc:name>MARSRELA</proc:name>
              <proc:program_type_name>VICAR</proc:program_type_name>
              <proc:program_user>jpluser</proc:program_user>
              <proc:program_start_date_time>2022-11-28T18:07:43.043Z</proc:program_start_date_time>
              <proc:Software_Program_Parameters>
                <proc:Parameter>
                  <proc:name>INP</proc:name>
                  <proc:value>inpNLF_0629_0722782785_631ECM_N0301344NCAM00427_06_095J00.VIC</proc:value>
                </proc:Parameter>
                <proc:Parameter>
                  <proc:name>OUT</proc:name>
                  <proc:value>NLF_0629_0722782785_631ECM_N0301344NCAM00427_06_095J00.VIC</proc:value>
                </proc:Parameter>
                <proc:Parameter>
                  <proc:name>CM</proc:name>
                  <proc:value>CM</proc:value>
                </proc:Parameter>
                <proc:Parameter>
                  <proc:name>AZEL</proc:name>
                  <proc:value>AZEL</proc:value>
                </proc:Parameter>
              </proc:Software_Program_Parameters>
            </proc:Software_Program>
          </proc:Software>
        </proc:Process>
        <proc:Process>
          <proc:Software>
            <proc:Software_Program>
              <proc:name>M2020EDRGEN</proc:name>
              <proc:program_version>V7.3 9-30-2021</proc:program_version>
              <proc:description>CODMAC LEVEL 1 TO LEVEL 2 CONVERSION VIA JPL/MIPL M2020EDRGEN</proc:description>
            </proc:Software_Program>
          </proc:Software>
        </proc:Process>
      </proc:Processing_Information>
    </Discipline_Area>
  </Observation_Area>
  <Reference_List>
    <Internal_Reference>
      <lidvid_reference>urn:nasa:pds:mars2020_navcam_ops_raw:browse:nlf_0629_0722782785_631ecm_n0301344ncam00427_06_095j.png::1.0</lidvid_reference>
      <reference_type>data_to_browse</reference_type>
      <comment>Reference pointer to browse version of this image.</comment>
    </Internal_Reference>
  </Reference_List>
  <File_Area_Observational>
    <File>
      <file_name>NLF_0629_0722782785_631ECM_N0301344NCAM00427_06_095J01.IMG</file_name>
      <creation_date_time>2022-11-28T18:07:43.000Z</creation_date_time>
    </File>
    <Header>
      <local_identifier>ODL3_Header</local_identifier>
      <offset unit="byte">0</offset>
      <object_length unit="byte">29808</object_length>
      <parsing_standard_id>PDS ODL 2</parsing_standard_id>
      <description>ODL3 Header</description>
    </Header>
    <Header>
      <local_identifier>VICAR_Header</local_identifier>
      <offset unit="byte">29808</offset>
      <object_length unit="byte">16848</object_length>
      <parsing_standard_id>VICAR2</parsing_standard_id>
      <description>VICAR Header</description>
    </Header>
    <Array_3D_Image>
      <local_identifier>nlf_0629_0722782785_631ecm_n0301344ncam00427_06_095j</local_identifier>
      <offset unit="byte">46656</offset>
      <axes>3</axes>
      <axis_index_order>Last Index Fastest</axis_index_order>
      <Element_Array>
        <data_type>UnsignedByte</data_type>
        <unit>DN</unit>
      </Element_Array>
      <Axis_Array>
        <axis_name>Band</axis_name>
        <elements>3</elements>
        <sequence_number>1</sequence_number>
      </Axis_Array>
      <Axis_Array>
        <axis_name>Line</axis_name>
        <elements>976</elements>
        <sequence_number>2</sequence_number>
      </Axis_Array>
      <Axis_Array>
        <axis_name>Sample</axis_name>
        <elements>1296</elements>
        <sequence_number>3</sequence_number>
      </Axis_Array>
      <Special_Constants>
        <missing_constant>0.0</missing_constant>
        <invalid_constant>0.0</invalid_constant>
      </Special_Constants>
    </Array_3D_Image>
  </File_Area_Observational>
  <File_Area_Observational_Supplemental>
    <File>
      <file_name>NLF_0629_0722782785_631EJP_N0301344NCAM00427_06_095J01.JPG</file_name>
    </File>
    <Encoded_Image>
      <offset unit="byte">0</offset>
      <encoding_standard_id>JPEG</encoding_standard_id>
    </Encoded_Image>
  </File_Area_Observational_Supplemental>
</Product_Observational>

```
