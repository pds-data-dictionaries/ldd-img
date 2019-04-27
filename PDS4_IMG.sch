<?xml version="1.0" encoding="UTF-8"?>
  <!-- PDS4 Schematron for Name Space Id:img  Version:1.11.0.0 - Fri Apr 26 20:25:02 PDT 2019 -->
  <!-- Generated from the PDS4 Information Model Version 1.11.0.0 - System Build 9a -->
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
    <sch:rule context="//img:Instrument_State/img:Exposure">
      <sch:assert test="not(img:Autoexposure)">
        IMG:error:autoexposure_inst_state_check: Autoexposure should be in img:Commanded_Parameters/img:Exposure.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_Observational/pds:Observation_Area/pds:Discipline_Area/img:Commanded_Parameters">
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Compression">
      <sch:assert test="count(child::*) > 0">
        IMG:error:cmprs_params_child_check: img:Compression must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Color_Filter_Array">
      <sch:assert test="(img:color_filter_array_state = 'Decoded' and img:color_filter_array_type = 'Bayer RGGB' and exists(img:bayer_algorithm)) or img:color_filter_array_state = 'No CFA' or img:color_filter_array_state = 'Encoded' ">
        IMG:error:img:color_filter_array_state_check: img:bayer_algorithm attribute must be specified when 
        img:color_filter_array_state = 'Decoded' and img:color_filter_array_type = 'Bayer RGGB'.
      </sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Color">
      <sch:assert test="count(child::*) > 0">
        IMG:error:color_params_child_check: img:color must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Commanded_Parameters">
      <sch:assert test="count(child::*) > 0">
        IMG:error:command_params_child_check: img:Commanded_Parameters must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Commanded_Parameters/img:Exposure">
      <sch:assert test="count(child::*) > 0">
        IMG:error:commanded_exposure_check: img:Exposure must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Detector">
      <sch:assert test="count(child::*) > 0">
        IMG:error:detector_params_child_check: img:Detector must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Derived/img:Detector">
      <sch:assert test="not(img:first_line) and not(img:first_sample) and not(img:lines) and not(img:samples) and not(img:detector_to_image_rotation) and not(img:erase_count) and not(img:readout_rate) and not(img:gain_mode_id) and not(img:gain_number) and not(img:analog_offset)">
        IMG:error:detector_derived_check: detector state parameters should be in img:Instrument_State/img:Detector.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Instrument_State/img:Detector">
      <sch:assert test="not(img:line_fov) and not(img:sample_fov)">
        IMG:error:detector_inst_state_check: derived parameters should be in img:Derived/img:Detector.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Downsampling">
      <sch:assert test="count(child::*) > 0">
        IMG:error:downsampling_params_child_check: img:Downsampling must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_Observational/pds:Observation_Area/pds:Discipline_Area/img:Commanded_Parameters/img:Exposure">
      <sch:assert test="img:exposure_duration_count &gt;= 0 and img:exposure_duration_count &lt;= 65535">
        insight:error:exp_params_0: The attribute img:exposure_duration_count must be within the value range 0-65535 inclusive.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_Observational/pds:Observation_Area/pds:Discipline_Area/img:Commanded_Parameters/img:Exposure">
      <sch:assert test="img:exposure_type = ('MANUAL', 'AUTO', 'TEST')">
        insight:error:exp_params_1: The attribute img:exposure_type must be equal to one of the following
        values: 'MANUAL', 'AUTO', 'TEST'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Image_Product_Information/img:Exposure">
      <sch:assert test="(count(img:exposure_duration) = 1)">
        IMG:error:exposure_duration_check: img:exposure_duration must be specified in img:Exposure class</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Exposure">
      <sch:assert test="count(child::*) > 0">
        IMG:error:exposure_params_child_check: img:Exposure must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Optical_Filter">
      <sch:assert test="count(child::*) > 0">
        IMG:error:filter_params_child_check: img:Optical_Filter must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Commanded_Parameters/img:Focus">
      <sch:assert test="not(img:minimum_focus_distance) and not(img:best_focus_distance) and not(img:maximum_focus_distance)">
        IMG:error:focus_command_check: *_focus_distance keywords should be in img:Focus.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Derived/img:Focus">
      <sch:assert test="not(img:focus_mode) and not(img:focus_position_count) and not(img:autofocus_step_size) and not(img:autofocus_step_count) and not(img:focus_stack_flag) and not(img:Focus_Stack)">
        IMG:error:focus_derived_check: commanding focus parameters should be in img:Commanded_Parameters/img:Focus.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Focus">
      <sch:assert test="count(child::*) > 0">
        IMG:error:focus_params_child_check: img:Focus must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Focus_Stack">
      <sch:assert test="count(child::*) > 0">
        IMG:error:focus_stack_params_child_check: img:Focus_Stack must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Frame">
      <sch:assert test="count(child::*) > 0">
        IMG:error:frame_check: img:Frame must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Frame">
      <sch:assert test="count(child::*) > 0">
        IMG:error:frame_params_child_check: img:Frame must have at least 1 attribute or class specified.</sch:assert>
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
    <sch:rule context="//img:ICER_Parameters">
      <sch:assert test="count(child::*) > 0">
        IMG:error:icer_params_child_check: img:ICER_Parameters must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Imaging">
      <sch:assert test="count(child::*) > 0">
        IMG:error:imaging_child_check: img:Imaging class must contain at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Autoexposure/img:auto_exposure_data_cut">
      <sch:assert test="@unit = ('DN', 'electron/DN', 'pixel')">
        The attribute @unit must be equal to one of the following values 'DN', 'electron/DN', 'pixel'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Color_Filter_Array">
      <sch:assert test="if (img:active_flag) then img:active_flag = ('true', 'false') else true()">
        The attribute img:active_flag must be equal to one of the following values 'true', 'false'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Color_Filter_Array/img:color_filter_array_state">
      <sch:assert test=". = ('Decoded', 'Encoded', 'No CFA')">
        The attribute img:color_filter_array_state must be equal to one of the following values 'Decoded', 'Encoded', 'No CFA'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Color_Filter_Array/img:color_filter_array_type">
      <sch:assert test=". = ('Bayer RGGB')">
        The attribute img:color_filter_array_type must be equal to the value 'Bayer RGGB'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Companding">
      <sch:assert test="if (img:active_flag) then img:active_flag = ('true', 'false') else true()">
        The attribute img:active_flag must be equal to one of the following values 'true', 'false'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Companding/img:companding_state">
      <sch:assert test=". = ('Companded', 'Expanded', 'None')">
        The attribute img:companding_state must be equal to one of the following values 'Companded', 'Expanded', 'None'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Detector/img:detector_to_image_rotation">
      <sch:assert test="@unit = ('arcmin', 'arcsec', 'deg', 'hr', 'mrad', 'rad')">
        The attribute @unit must be equal to one of the following values 'arcmin', 'arcsec', 'deg', 'hr', 'mrad', 'rad'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Detector/img:readout_rate">
      <sch:assert test="@unit = ('Hz')">
        The attribute @unit must be equal to one of the following values 'Hz'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Device_Current/img:current_value">
      <sch:assert test="@unit = ('A', 'mA')">
        The attribute @unit must be equal to one of the following values 'A', 'mA'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Device_Voltage/img:voltage_value">
      <sch:assert test="@unit = ('V', 'mV')">
        The attribute @unit must be equal to one of the following values 'V', 'mV'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Exposure/img:exposure_duration">
      <sch:assert test="@unit = ('day', 'hr', 'julian day', 'microseconds', 'min', 'ms', 's', 'yr')">
        The attribute @unit must be equal to one of the following values 'day', 'hr', 'julian day', 'microseconds', 'min', 'ms', 's', 'yr'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Exposure/img:exposure_type">
      <sch:assert test=". = ('Auto', 'Manual', 'Test')">
        The attribute img:exposure_type must be equal to one of the following values 'Auto', 'Manual', 'Test'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Focus/img:best_focus_distance">
      <sch:assert test="@unit = ('AU', 'Angstrom', 'cm', 'km', 'm', 'micrometer', 'mm', 'nm')">
        The attribute @unit must be equal to one of the following values 'AU', 'Angstrom', 'cm', 'km', 'm', 'micrometer', 'mm', 'nm'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Focus/img:focus_mode">
      <sch:assert test=". = ('Autofocus', 'Manual', 'Relative', 'ZStack')">
        The attribute img:focus_mode must be equal to one of the following values 'Autofocus', 'Manual', 'Relative', 'ZStack'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Focus/img:maximum_focus_distance">
      <sch:assert test="@unit = ('AU', 'Angstrom', 'cm', 'km', 'm', 'micrometer', 'mm', 'nm')">
        The attribute @unit must be equal to one of the following values 'AU', 'Angstrom', 'cm', 'km', 'm', 'micrometer', 'mm', 'nm'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Focus/img:minimum_focus_distance">
      <sch:assert test="@unit = ('AU', 'Angstrom', 'cm', 'km', 'm', 'micrometer', 'mm', 'nm')">
        The attribute @unit must be equal to one of the following values 'AU', 'Angstrom', 'cm', 'km', 'm', 'micrometer', 'mm', 'nm'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Frame/img:frame_id">
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Frame/img:frame_type_name">
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
    <sch:rule context="img:Onboard_Compression">
      <sch:assert test="if (img:deferred_flag) then img:deferred_flag = ('true', 'false') else true()">
        The attribute img:deferred_flag must be equal to one of the following values 'true', 'false'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Onboard_Compression/img:onboard_compression_class">
      <sch:assert test=". = ('Lossless', 'Lossy', 'Uncompressed')">
        The attribute img:onboard_compression_class must be equal to one of the following values 'Lossless', 'Lossy', 'Uncompressed'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Onboard_Compression/img:onboard_compression_type">
      <sch:assert test=". = ('ICER', 'ICT', 'JPEG', 'JPEG Progressive', 'LOCO', 'MSSS Lossless', 'None')">
        The attribute img:onboard_compression_type must be equal to one of the following values 'ICER', 'ICT', 'JPEG', 'JPEG Progressive', 'LOCO', 'MSSS Lossless', 'None'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Optical_Filter/img:bandwidth">
      <sch:assert test="@unit = ('AU', 'Angstrom', 'cm', 'km', 'm', 'micrometer', 'mm', 'nm')">
        The attribute @unit must be equal to one of the following values 'AU', 'Angstrom', 'cm', 'km', 'm', 'micrometer', 'mm', 'nm'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Optical_Filter/img:center_filter_wavelength">
      <sch:assert test="@unit = ('AU', 'Angstrom', 'cm', 'km', 'm', 'micrometer', 'mm', 'nm')">
        The attribute @unit must be equal to one of the following values 'AU', 'Angstrom', 'cm', 'km', 'm', 'micrometer', 'mm', 'nm'.</sch:assert>
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
    <sch:rule context="img:Radial_Flat_Field_Function/img:x_center">
      <sch:assert test="@unit = ('DN', 'electron/DN', 'pixel')">
        The attribute @unit must be equal to one of the following values 'DN', 'electron/DN', 'pixel'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Radial_Flat_Field_Function/img:y_center">
      <sch:assert test="@unit = ('DN', 'electron/DN', 'pixel')">
        The attribute @unit must be equal to one of the following values 'DN', 'electron/DN', 'pixel'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Radiometric_Correction/img:radiance_zenith_scaling_factor">
      <sch:assert test="@unit = ('W*m**-2*sr**-1*Hz**-1', 'W*m**-2*sr**-1*nm**-1', 'W*m**-2*sr**-1*um**-1', 'W*m**-3*sr**-1', 'W/m**2/sr/Hz', 'W/m**2/sr/nm', 'W/m**2/sr/μm', 'W/m**3/sr', 'uW*cm**-2*sr**-1*um**-1', 'μW/cm**2/sr/μm')">
        The attribute @unit must be equal to one of the following values 'W*m**-2*sr**-1*Hz**-1', 'W*m**-2*sr**-1*nm**-1', 'W*m**-2*sr**-1*um**-1', 'W*m**-3*sr**-1', 'W/m**2/sr/Hz', 'W/m**2/sr/nm', 'W/m**2/sr/μm', 'W/m**3/sr', 'uW*cm**-2*sr**-1*um**-1', 'μW/cm**2/sr/μm'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Shutter_Subtraction">
      <sch:assert test="if (img:active_flag) then img:active_flag = ('true', 'false') else true()">
        The attribute img:active_flag must be equal to one of the following values 'true', 'false'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Shutter_Subtraction/img:shutter_subtraction_mode">
      <sch:assert test=". = ('Conditional', 'True')">
        The attribute img:shutter_subtraction_mode must be equal to one of the following values 'Conditional', 'True'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Subframe/img:line_fov">
      <sch:assert test="@unit = ('arcmin', 'arcsec', 'deg', 'hr', 'mrad', 'rad')">
        The attribute @unit must be equal to one of the following values 'arcmin', 'arcsec', 'deg', 'hr', 'mrad', 'rad'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Subframe/img:sample_fov">
      <sch:assert test="@unit = ('arcmin', 'arcsec', 'deg', 'hr', 'mrad', 'rad')">
        The attribute @unit must be equal to one of the following values 'arcmin', 'arcsec', 'deg', 'hr', 'mrad', 'rad'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Telemetry_Parameters/img:telemetry_source_type">
      <sch:assert test=". = ('DATA_PRODUCT', 'SFDU')">
        The attribute img:telemetry_source_type must be equal to one of the following values 'DATA_PRODUCT', 'SFDU'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Video/img:frame_interval">
      <sch:assert test="@unit = ('day', 'hr', 'julian day', 'microseconds', 'min', 'ms', 's', 'yr')">
        The attribute @unit must be equal to one of the following values 'day', 'hr', 'julian day', 'microseconds', 'min', 'ms', 's', 'yr'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Video/img:frame_rate">
      <sch:assert test="@unit = ('frames/s')">
        The attribute @unit must be equal to one of the following values 'frames/s'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Video/img:interframe_delay">
      <sch:assert test="@unit = ('day', 'hr', 'julian day', 'microseconds', 'min', 'ms', 's', 'yr')">
        The attribute @unit must be equal to one of the following values 'day', 'hr', 'julian day', 'microseconds', 'min', 'ms', 's', 'yr'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Imaging_Instrument_State">
      <sch:assert test="count(child::*) > 0">
        IMG:error:img_inst_state_child_check: img:Imaging_Instrument_State must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Imaging_Instrument_State">
      <sch:assert test="count(child::*) > 0">
        IMG:error:img_inst_state_params_child_check: img:Imaging_Instrument_State class must contain at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_Observational/pds:Observation_Area/pds:Discipline_Area/img:Imaging_Instrument_State/img:Instrument_Device_Temperature">
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_Observational/pds:Observation_Area/pds:Discipline_Area/img:Imaging_Instrument_State/img:Instrument_Device_Temperature">
      <sch:assert test="count(img:Instrument_Device_Temperature_Index) = 2">
        insight:error:inst_device_temp_1: The class img:Instrument_Device_Temperature must have exactly 2 img:Instrument_Device_Temperature_Index subclasses.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_Observational/pds:Observation_Area/pds:Discipline_Area/img:Imaging_Instrument_State/img:Instrument_Device_Temperature">
      <sch:assert test="(img:Instrument_Device_Temperature_Index[1]/img:name = 'IDC_CCD' and img:Instrument_Device_Temperature_Index[2]/img:name = 'IDC_ELECTRONICS') or (img:Instrument_Device_Temperature_Index[1]/img:name = 'ICC_CCD' and img:Instrument_Device_Temperature_Index[2]/img:name = 'ICC_ELECTRONICS')">
        insight:error:inst_device_temp_2: The img:name values for the Instrument_Device_Temperature_Index classes must be either combination of 'IDC_CCD' and 'IDC_ELECTRONICS' or  'ICC_CCD' and 'ICC_ELECTRONICS'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Instrument_State">
      <sch:assert test="count(child::*) > 0">
        IMG:error:inst_state_params_child_check: img:Instrument_State must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Instrument_Time_Values">
      <sch:assert test="count(child::*) > 0">
        IMG:error:inst_times_child_check: img:Instrument_Time_Values must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Autoexposure/pds:Internal_Reference">
      <sch:assert test="pds:internal_reference_type = 'data_to_document'">
        IMG:error:internal_reference_type_check_autoexposure: In img:Autoexposure, Internal_Reference.reference_type must be equal to 'data_to_document'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Data_Processing_File/pds:Internal_Reference">
      <sch:assert test="pds:reference_type = 'data_to_data_processing_file'">
        IMG:error:internal_reference_type_check_data_correction: In img:Data_Processing_File, the Internal_Reference.reference_type must be equal to 'data_to_data_processing_file'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:JPEG_Parameters">
      <sch:assert test="count(child::*) > 0">
        IMG:error:jpeg_comprs_child_check: img:JPEG_Parameters must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:JPEG_Parameters">
      <sch:assert test="count(child::*) > 0">
        IMG:error:jpeg_params_child_check: img:JPEG_Parameters must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Imaging/img:Autoexposure/pds:Local_Internal_Reference">
      <sch:assert test="pds:local_reference_type = 'to_mission_autoexposure'">
        In img:Autoexposure, Local_Internal_Reference.local_reference_type must be equal to 'to_mission_autoexposure'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Data_Processing_File/pds:Internal_Reference">
      <sch:assert test="pds:reference_type = 'data_to_data_processing_file'">
        In img:Data_Processing_File, the Internal_Reference.reference_type must be equal to 'data_to_data_processing_file'.</sch:assert>
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
    <sch:rule context="//img:LOCO_Parameters">
      <sch:assert test="count(child::*) > 0">
        IMG:error:loco_params_child_check: img:LOCO_Parameters must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Product_Identification">
      <sch:assert test="count(child::*) > 0">
        IMG:error:product_identification_child_check: img:Product_Identification class must contain at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Radiometric_Correction">
      <sch:assert test="(count(img:radiance_offset) = 1 and count(img:radiance_zenith_scaling_factor) = 1) or (count(img:radiance_offset) = 0 and count(img:radiance_zenith_scaling_factor) = 0)">
        IMG:error:radiometric_corr_check: Both img:radiance_offset and img:radiance_zenith_scaling_factor must exist together.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Sampling">
      <sch:assert test="count(child::*) > 0">
        IMG:error:sampling_params_child_check: img:Sampling must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Shutter_Subtraction">
      <sch:assert test="(img:shutter_subtraction_mode != 'Conditional') or (img:shutter_subtraction_mode = 'Conditional' and exists(img:exposure_duration_threshold_count))">
        IMG:error:shutter_subtraction_check: if img:shutter_subtraction_mode = 'Conditional', then img:exposure_duration_threshold_count must exist.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Commanded_Parameters/img:Subframe">
      <sch:assert test="not(img:line_fov) and not(img:sample_fov)">
        IMG:error:subframe_command_check1: derived subframe parameters should be in img:Derived/img:Subframe.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Commanded_Parameters/img:Subframe">
      <sch:assert test="(img:first_line) and (img:first_sample) and (img:lines) and (img:samples)">
        IMG:error:subframe_command_check2: img:Commanded_Parameters/img:Subframe must include all of img:first_line, img:first_sample, img:lines, img:samples</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Derived/img:Subframe">
      <sch:assert test="not(img:first_line) and not(img:first_sample) and not(img:lines) and not(img:samples) and not(pds:name) and not(pds:description) and not(img:subframe_type)">
        IMG:error:subframe_derived_check: commanding subframe parameters should be in img:Commanded_Parameters/img:Subframe.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_Observational/pds:Observation_Area/pds:Discipline_Area/img:Imaging/img:Subframe">
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_Observational/pds:Observation_Area/pds:Discipline_Area/img:Imaging/img:Subframe">
      <sch:assert test="img:first_line = '1' and img:first_sample = '1'">
        img:error:subframe_params_1: The attributes img:first_line and img:first_sample must each have values equal to '1'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Subframe">
      <sch:assert test="count(child::*) > 0">
        IMG:error:subframe_params_child_check: img:Subframe must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Video">
      <sch:assert test="count(child::*) > 0">
        IMG:error:video_params_child_check: img:Video must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
