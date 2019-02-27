<?xml version="1.0" encoding="UTF-8"?>
  <!-- PDS4 Schematron for Name Space Id:img  Version:1.9.0.0 - Fri Dec 29 21:16:40 PST 2017 -->
  <!-- Generated from the PDS4 Information Model Version 1.9.0.0 - System Build 8a -->
  <!-- *** This PDS4 schematron file is an operational deliverable. *** -->
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">

  <sch:title>Schematron using XPath 2.0</sch:title>

  <sch:ns uri="http://pds.nasa.gov/pds4/pds/v1" prefix="pds"/>
  <sch:ns uri="http://pds.nasa.gov/pds4/img/v1" prefix="img"/>

		   <!-- ================================================ -->
		   <!-- NOTE:  There are two types of schematron rules.  -->
		   <!--        One type includes rules written for       -->
		   <!--        specific situations. The other type are   -->
		   <!--        generated to validate enumerated value    -->
		   <!--        lists. These two types of rules have been -->
		   <!--        merged together in the rules below.       -->
		   <!-- ================================================ -->
  <sch:pattern>
    <sch:rule context="//img:Bayer_Parameters">
      <sch:assert test="(img:bayer_state = 'Debayered' and exists(img:debayer_venue) and exists(img:debayer_algorithm)) or img:bayer_state = 'No Bayer' or img:bayer_state = 'Bayer Encoded' ">
        IMG:error:bayer_state_check: img:debayer_venue and img:debayer_algorithm attributes must be 
        specified when img:bayer_state = 'Debayered'.
      </sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Command_Parameters/img:Exposure_Parameters">
      <sch:assert test="count(child::*) > 0">
        IMG:error:commanded_exposure_parameters_check: img:Exposure_Parameters must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Image_Product_Information/img:Exposure_Parameters">
      <sch:assert test="(count(img:exposure_duration) = 1)">
        IMG:error:exposure_duration_check: img:exposure_duration must be specified in img:Exposure_Parameters class</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Frame_Parameters">
      <sch:assert test="count(child::*) > 0">
        IMG:error:frame_parameters_check: img:Frame_Parameters must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:ICER_Parameters">
      <sch:assert test="count(child::*) > 0">
        IMG:error:icer_comprs_child_check: img:ICER_Parameters must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:ICER_Compression_Parameters">
      <sch:assert test="count(img:ICER_Compression_Segment) = img:segment_count ">
        IMG:error:icer_comprs_segment_check: img:ICER_Compression_Parameters/img:segment_count must match the number of img:Image_Compression_Segment classes.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Imaging">
      <sch:assert test="count(child::*) > 0">
        IMG:error:imaging_child_check: img:Imaging class must contain at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Bayer_Parameters/img:bayer_state">
      <sch:assert test=". = ('Bayer Encoded', 'Debayered', 'No Bayer')">
        The attribute img:bayer_state must be equal to one of the following values 'Bayer Encoded', 'Debayered', 'No Bayer'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Bayer_Parameters/img:debayer_algorithm">
      <sch:assert test=". = ('Malvar', 'Zhang-Wu')">
        The attribute img:debayer_algorithm must be equal to one of the following values 'Malvar', 'Zhang-Wu'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Bayer_Parameters/img:debayer_venue">
      <sch:assert test=". = ('Ground', 'Onboard')">
        The attribute img:debayer_venue must be equal to one of the following values 'Ground', 'Onboard'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Companding_Parameters/img:companding_state">
      <sch:assert test=". = ('Companded', 'Expanded', 'None')">
        The attribute img:companding_state must be equal to one of the following values 'Companded', 'Expanded', 'None'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Companding_Parameters/img:companding_venue">
      <sch:assert test=". = ('Hardware', 'None', 'Software')">
        The attribute img:companding_venue must be equal to one of the following values 'Hardware', 'None', 'Software'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Data_Correction">
      <sch:assert test="if (img:active_flag) then img:active_flag = ('true', 'false') else true()">
        The attribute img:active_flag must be equal to one of the following values 'true', 'false'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Data_Correction/img:data_correction_type">
      <sch:assert test=". = ('Antiblooming', 'Bad Pixel', 'Blemish Protection', 'Brightness', 'Dark Current', 'Flat Field', 'Inverse LUT', 'Light Flood', 'Radiometric', 'Responsivity', 'Shutter Subtraction')">
        The attribute img:data_correction_type must be equal to one of the following values 'Antiblooming', 'Bad Pixel', 'Blemish Protection', 'Brightness', 'Dark Current', 'Flat Field', 'Inverse LUT', 'Light Flood', 'Radiometric', 'Responsivity', 'Shutter Subtraction'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Data_Correction/img:data_correction_venue">
      <sch:assert test=". = ('Ground', 'Onboard')">
        The attribute img:data_correction_venue must be equal to one of the following values 'Ground', 'Onboard'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Downsampling_Parameters">
      <sch:assert test="if (img:downsampling_flag) then img:downsampling_flag = ('true', 'false') else true()">
        The attribute img:downsampling_flag must be equal to one of the following values 'true', 'false'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Downsampling_Parameters/img:downsampling_flag">
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Downsampling_Parameters/img:downsampling_venue">
      <sch:assert test=". = ('Both', 'Hardware', 'Software')">
        The attribute img:downsampling_venue must be equal to one of the following values 'Both', 'Hardware', 'Software'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Exposure_Parameters/img:exposure_duration">
      <sch:assert test="@unit = ('day', 'hr', 'julian day', 'microseconds', 'min', 'ms', 's', 'yr')">
        The attribute @unit must be equal to one of the following values 'day', 'hr', 'julian day', 'microseconds', 'min', 'ms', 's', 'yr'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Exposure_Parameters/img:exposure_type">
      <sch:assert test=". = ('Auto', 'Manual', 'Test')">
        The attribute img:exposure_type must be equal to one of the following values 'Auto', 'Manual', 'Test'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Filter/img:bandwidth">
      <sch:assert test="@unit = ('Hz')">
        The attribute @unit must be equal to one of the following values 'Hz'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Filter/img:center_filter_wavelength">
      <sch:assert test="@unit = ('AU', 'Angstrom', 'cm', 'km', 'm', 'micrometer', 'mm', 'nm')">
        The attribute @unit must be equal to one of the following values 'AU', 'Angstrom', 'cm', 'km', 'm', 'micrometer', 'mm', 'nm'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Frame_Parameters/img:frame_id">
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Frame_Parameters/img:frame_type_name">
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Frame_Parameters/img:interframe_delay">
      <sch:assert test="@unit = ('day', 'hr', 'julian day', 'microseconds', 'min', 'ms', 's', 'yr')">
        The attribute @unit must be equal to one of the following values 'day', 'hr', 'julian day', 'microseconds', 'min', 'ms', 's', 'yr'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Image_Compression_Parameters">
      <sch:assert test="if (img:deferred_flag) then img:deferred_flag = ('true', 'false') else true()">
        The attribute img:deferred_flag must be equal to one of the following values 'true', 'false'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Image_Compression_Parameters/img:compression_class">
      <sch:assert test=". = ('Lossless', 'Lossy', 'Uncompressed')">
        The attribute img:compression_class must be equal to one of the following values 'Lossless', 'Lossy', 'Uncompressed'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Image_Compression_Parameters/img:compression_type">
      <sch:assert test=". = ('ICER', 'ICT', 'JPEG', 'JPEG Progressive', 'LOCO', 'MSSS Lossless')">
        The attribute img:compression_type must be equal to one of the following values 'ICER', 'ICT', 'JPEG', 'JPEG Progressive', 'LOCO', 'MSSS Lossless'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Imaging_Instrument_State_Parameters/img:azimuth_fov">
      <sch:assert test="@unit = ('arcmin', 'arcsec', 'deg', 'hr', 'mrad', 'rad')">
        The attribute @unit must be equal to one of the following values 'arcmin', 'arcsec', 'deg', 'hr', 'mrad', 'rad'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Imaging_Instrument_State_Parameters/img:detector_to_image_rotation">
      <sch:assert test="@unit = ('arcmin', 'arcsec', 'deg', 'hr', 'mrad', 'rad')">
        The attribute @unit must be equal to one of the following values 'arcmin', 'arcsec', 'deg', 'hr', 'mrad', 'rad'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Imaging_Instrument_State_Parameters/img:elevation_fov">
      <sch:assert test="@unit = ('arcmin', 'arcsec', 'deg', 'hr', 'mrad', 'rad')">
        The attribute @unit must be equal to one of the following values 'arcmin', 'arcsec', 'deg', 'hr', 'mrad', 'rad'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Instrument_Device_Current_Index/img:current_value">
      <sch:assert test="@unit = ('A', 'mA')">
        The attribute @unit must be equal to one of the following values 'A', 'mA'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Instrument_Device_Temperature_Index/img:temperature_value">
      <sch:assert test="@unit = ('K', 'degC')">
        The attribute @unit must be equal to one of the following values 'K', 'degC'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Instrument_Device_Voltage_Index/img:voltage_value">
      <sch:assert test="@unit = ('V', 'mV')">
        The attribute @unit must be equal to one of the following values 'V', 'mV'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:JPEG_Parameters/img:color_subsampling_mode">
      <sch:assert test=". = ('4:2:2', '4:4:4', 'Grayscale')">
        The attribute img:color_subsampling_mode must be equal to one of the following values '4:2:2', '4:4:4', 'Grayscale'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:JPEG_Progressive_Parameters/img:color_subsampling_mode">
      <sch:assert test=". = ('4:2:2', '4:4:4', 'Grayscale')">
        The attribute img:color_subsampling_mode must be equal to one of the following values '4:2:2', '4:4:4', 'Grayscale'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Pixel_Averaging_Dimensions/img:height_pixels">
      <sch:assert test="@unit = ('DN', 'electron/DN', 'pixel')">
        The attribute @unit must be equal to one of the following values 'DN', 'electron/DN', 'pixel'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Pixel_Averaging_Dimensions/img:width_pixels">
      <sch:assert test="@unit = ('DN', 'electron/DN', 'pixel')">
        The attribute @unit must be equal to one of the following values 'DN', 'electron/DN', 'pixel'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Shutter_Subtraction_Parameters/img:shutter_subtraction_mode">
      <sch:assert test=". = ('Conditional', 'True')">
        The attribute img:shutter_subtraction_mode must be equal to one of the following values 'Conditional', 'True'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Telemetry_Parameters/img:telemetry_source_type">
      <sch:assert test=". = ('DATA_PRODUCT', 'SFDU')">
        The attribute img:telemetry_source_type must be equal to one of the following values 'DATA_PRODUCT', 'SFDU'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Imaging_Instrument_State_Parameters">
      <sch:assert test="count(child::*) > 0">
        IMG:error:img_inst_state_child_check: img:Imaging_Instrument_State_Parameters must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Imaging_Instrument_State_Parameters">
      <sch:assert test="count(child::*) > 0">
        IMG:error:img_inst_state_params_child_check: img:Imaging_Instrument_State_Parameters class must contain at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:JPEG_Parameters">
      <sch:assert test="count(child::*) > 0">
        IMG:error:jpeg_comprs_child_check: img:JPEG_Parameters must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Autoexposure_Parameters/pds:Local_Internal_Reference">
      <sch:assert test="pds:local_reference_type = 'to_mission_autoexposure_parameters'">
        In img:Autoexposure_Parameters, Local_Internal_Reference.local_reference_type must be equal to 'to_mission_autoexposure_parameters'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Data_Correction_File/pds:Internal_Reference">
      <sch:assert test="pds:reference_type = 'data_to_data_correction_file'">
        In img:Data_Correction_File, the Internal_Reference.reference_type must be equal to 'data_to_data_correction_file'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Imaging/pds:Local_Internal_Reference">
      <sch:assert test="pds:local_reference_type = 'imaging_parameters_to_image_object'">
        In img:Imaging, Local_Internal_Reference.local_reference_type must be equal to 'imaging_parameters_to_image_object'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:LOCO_Parameters">
      <sch:assert test="count(child::*) > 0">
        IMG:error:loco_comprs_child_check: img:LOCO_Parameters must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Product_Identification">
      <sch:assert test="count(child::*) > 0">
        IMG:error:product_identification_child_check: img:Product_Identification class must contain at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Radiometric_Correction_Parameters">
      <sch:assert test="(count(img:radiance_offset) = 1 and count(img:radiance_scaling_factor) = 1) or (count(img:radiance_offset) = 0 and count(img:radiance_scaling_factor) = 0)">
        IMG:error:radiometric_corr_check: Both img:radiance_offset and img:radiance_scaling_factor must exist together.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Shutter_Subtraction_Parameters">
      <sch:assert test="(img:shutter_subtraction_mode != 'Conditional') or (img:shutter_subtraction_mode = 'Conditional' and exists(img:exposure_duration_threshold_count))">
        IMG:error:shutter_subtraction_check: if img:shutter_subtraction_mode = 'Conditional', then img:exposure_duration_threshold_count must exist.</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
