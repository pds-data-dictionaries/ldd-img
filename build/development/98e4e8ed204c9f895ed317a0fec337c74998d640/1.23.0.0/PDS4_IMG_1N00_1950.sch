<?xml version="1.0" encoding="UTF-8"?>
  <!-- PDS4 Schematron for Name Space Id:img  Version:1.9.5.0 - Thu Nov 19 22:31:49 UTC 2026 -->
  <!-- Generated from the PDS4 Information Model Version 1.23.0.0 - System Build 15.0 -->
  <!-- *** This PDS4 schematron file is an operational deliverable. *** -->
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">

  <sch:title>Schematron using XPath 2.0</sch:title>

  <sch:ns uri="http://www.w3.org/2001/XMLSchema-instance" prefix="xsi"/>
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
    <sch:rule context="//img:Color_Filter_Array">
      <sch:assert test="img:color_filter_array_state = ('Encoded', 'Decoded', 'No CFA')">
        <title>//img:Color_Filter_Array/Rule</title>
        IMG:error:img:color_filter_array_state_check: img:color_filter_array_state must be equal to one of the following values: 
        'Encoded', 'Decoded', 'No CFA'.
      </sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Color_Processing">
      <sch:assert test="count(child::*) > 0">
        <title>//img:Color_Processing/Rule</title>
        IMG:error:color_processing_child_check: img:color must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Commanded_Parameters">
      <sch:assert test="count(child::*) > 0">
        <title>//img:Commanded_Parameters/Rule</title>
        IMG:error:commanded_params_child_check: img:Commanded_Parameters must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Detector">
      <sch:assert test="count(child::*) > 0">
        <title>//img:Detector/Rule</title>
        IMG:error:detector_params_child_check: img:Detector must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Downsampling">
      <sch:assert test="count(child::*) > 0">
        <title>//img:Downsampling/Rule</title>
        IMG:error:downsampling_child_check: img:Downsampling must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Exposure">
      <sch:assert test="count(child::*) > 0">
        <title>//img:Exposure/Rule</title>
        IMG:error:exposure_child_check: img:Exposure must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Focus">
      <sch:assert test="count(child::*) > 0">
        <title>//img:Focus/Rule</title>
        IMG:error:focus_child_check: img:Focus must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Focus_Stack">
      <sch:assert test="count(child::*) > 0">
        <title>//img:Focus_Stack/Rule</title>
        IMG:error:focus_stack_child_check: img:Focus_Stack must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Frame">
      <sch:assert test="count(child::*) > 0">
        <title>//img:Frame/Rule</title>
        IMG:error:frame_child_check: img:Frame must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:ICER_Parameters">
      <sch:assert test="count(child::*) > 0">
        <title>//img:ICER_Parameters/Rule</title>
        IMG:error:icer_params_child_check: img:ICER_Parameters must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Imaging">
      <sch:assert test="count(child::*) > 0">
        <title>//img:Imaging/Rule</title>
        IMG:error:imaging_child_check: img:Imaging class must contain at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Imaging/pds:Local_Internal_Reference">
      <sch:assert test="pds:local_reference_type = 'imaging_parameters_to_image_object'">
        <title>//img:Imaging/pds:Local_Internal_Reference/Rule</title>
        In img:Imaging, Local_Internal_Reference.local_reference_type must be equal to 'imaging_parameters_to_image_object'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Instrument_State">
      <sch:assert test="count(child::*) > 0">
        <title>//img:Instrument_State/Rule</title>
        IMG:error:inst_state_child_check: img:Instrument_State must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:JPEG_Parameters">
      <sch:assert test="count(child::*) > 0">
        <title>//img:JPEG_Parameters/Rule</title>
        IMG:error:jpeg_params_child_check: img:JPEG_Parameters must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:LOCO_Parameters">
      <sch:assert test="count(child::*) > 0">
        <title>//img:LOCO_Parameters/Rule</title>
        IMG:error:loco_params_child_check: img:LOCO_Parameters must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Onboard_Compression">
      <sch:assert test="count(child::*) > 0">
        <title>//img:Onboard_Compression/Rule</title>
        IMG:error:onboard_compression_child_check: img:Onboard_Compression must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Optical_Filter">
      <sch:assert test="count(child::*) > 0">
        <title>//img:Optical_Filter/Rule</title>
        IMG:error:optical_filter_child_check: img:Optical_Filter must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Optical_Filter/pds:Local_Internal_Reference">
      <sch:assert test="pds:local_reference_type = 'data_to_optical_filter'">
        <title>//img:Optical_Filter/pds:Local_Internal_Reference/Rule</title>
        In img:Optical_Filter, Local_Internal_Reference.local_reference_type must be equal to 'data_to_optical_filter'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Sampling">
      <sch:assert test="count(child::*) > 0">
        <title>//img:Sampling/Rule</title>
        IMG:error:sampling_child_check: img:Sampling must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Shutter_Subtraction">
      <sch:assert test="if (exists(img:shutter_subtraction_mode)) then (img:shutter_subtraction_mode != 'Conditional') or (img:shutter_subtraction_mode = 'Conditional' and exists(img:exposure_duration_threshold_count)) else true()">
        <title>//img:Shutter_Subtraction/Rule</title>
        IMG:error:shutter_subtraction_check: if img:shutter_subtraction_mode = 'Conditional', then img:exposure_duration_threshold_count must exist.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:StarPixel_Flexible_Parameters">
      <sch:assert test="count(child::*) > 0">
        <title>//img:StarPixel_Flexible_Parameters/Rule</title>
        IMG:error:starpixel_flexible_params_child_check: img:StarPixel_Flexible_Parameters must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:StarPixel_Lossless_Parameters">
      <sch:assert test="count(child::*) > 0">
        <title>//img:StarPixel_Lossless_Parameters/Rule</title>
        IMG:error:starpixel_lossless_params_child_check: img:StarPixel_Lossless_Parameters must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Subframe">
      <sch:assert test="count(child::*) > 0">
        <title>//img:Subframe/Rule</title>
        IMG:error:subframe_child_check: img:Subframe must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//img:Video">
      <sch:assert test="count(child::*) > 0">
        <title>//img:Video/Rule</title>
        IMG:error:video_child_check: img:Video must have at least 1 attribute or class specified.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Autoexposure">
      <sch:assert test="if (img:active_flag) then img:active_flag = ('true', 'false') else true()">
        <title>img:Autoexposure/img:active_flag</title>
        The attribute img:active_flag must be equal to one of the following values 'true', 'false'.</sch:assert>
      <sch:assert test="if (img:exposure_table_update_flag) then img:exposure_table_update_flag = ('true', 'false') else true()">
        <title>img:Autoexposure/img:exposure_table_update_flag</title>
        The attribute img:exposure_table_update_flag must be equal to one of the following values 'true', 'false'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Autoexposure/img:metering_mode">
      <sch:assert test=". = ('Average', 'Center-weighted average', 'Multi-segment', 'Multi-spot', 'Other', 'Partial', 'Spot', 'Unknown')">
        <title>img:Autoexposure/img:metering_mode/img:metering_mode</title>
        The attribute img:Autoexposure/img:metering_mode must be equal to one of the following values 'Average', 'Center-weighted average', 'Multi-segment', 'Multi-spot', 'Other', 'Partial', 'Spot', 'Unknown'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Brightness_Correction_Image/pds:Internal_Reference">
      <sch:assert test="pds:reference_type = 'data_to_brightness_correction'">
        <title>img:Brightness_Correction_Image/pds:Internal_Reference/Rule</title>
        In img:Brightness_Correction_Image, Internal_Reference.reference_type must be equal to 'data_to_brightness_correction'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Camera_Settings/img:contrast">
      <sch:assert test=". = ('High', 'Low', 'Normal')">
        <title>img:Camera_Settings/img:contrast/img:contrast</title>
        The attribute img:Camera_Settings/img:contrast must be equal to one of the following values 'High', 'Low', 'Normal'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Camera_Settings/img:gain_control">
      <sch:assert test=". = ('High gain down', 'High gain up', 'Low gain down', 'Low gain up', 'None')">
        <title>img:Camera_Settings/img:gain_control/img:gain_control</title>
        The attribute img:Camera_Settings/img:gain_control must be equal to one of the following values 'High gain down', 'High gain up', 'Low gain down', 'Low gain up', 'None'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Camera_Settings/img:saturation">
      <sch:assert test=". = ('High', 'Low', 'Normal')">
        <title>img:Camera_Settings/img:saturation/img:saturation</title>
        The attribute img:Camera_Settings/img:saturation must be equal to one of the following values 'High', 'Low', 'Normal'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Camera_Settings/img:scene_capture_type">
      <sch:assert test=". = ('Landscape', 'Night', 'Other', 'Portrait', 'Standard')">
        <title>img:Camera_Settings/img:scene_capture_type/img:scene_capture_type</title>
        The attribute img:Camera_Settings/img:scene_capture_type must be equal to one of the following values 'Landscape', 'Night', 'Other', 'Portrait', 'Standard'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Camera_Settings/img:sharpness">
      <sch:assert test=". = ('Hard', 'Normal', 'Soft')">
        <title>img:Camera_Settings/img:sharpness/img:sharpness</title>
        The attribute img:Camera_Settings/img:sharpness must be equal to one of the following values 'Hard', 'Normal', 'Soft'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Color_Filter_Array">
      <sch:assert test="if (img:active_flag) then img:active_flag = ('true', 'false') else true()">
        <title>img:Color_Filter_Array/img:active_flag</title>
        The attribute img:active_flag must be equal to one of the following values 'true', 'false'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Color_Filter_Array/img:color_filter_array_state">
      <sch:assert test=". = ('Decoded', 'Encoded', 'No CFA')">
        <title>img:Color_Filter_Array/img:color_filter_array_state/img:color_filter_array_state</title>
        The attribute img:Color_Filter_Array/img:color_filter_array_state must be equal to one of the following values 'Decoded', 'Encoded', 'No CFA'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Color_Filter_Array/img:color_filter_array_type">
      <sch:assert test=". = ('Bayer RGGB', 'Bayer RGYB', 'None')">
        <title>img:Color_Filter_Array/img:color_filter_array_type/img:color_filter_array_type</title>
        The attribute img:Color_Filter_Array/img:color_filter_array_type must be equal to one of the following values 'Bayer RGGB', 'Bayer RGYB', 'None'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Color_Processing">
      <sch:assert test="if (img:active_flag) then img:active_flag = ('true', 'false') else true()">
        <title>img:Color_Processing/img:active_flag</title>
        The attribute img:active_flag must be equal to one of the following values 'true', 'false'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Color_Processing/img:color_component">
      <sch:assert test=". = ('All', 'Blue', 'Green', 'Hue', 'Intensity', 'Red', 'Saturation', 'XYZ_X', 'XYZ_Y', 'XYZ_Z', 'xyY_YY', 'xyY_x', 'xyY_y')">
        <title>img:Color_Processing/img:color_component/img:color_component</title>
        The attribute img:Color_Processing/img:color_component must be equal to one of the following values 'All', 'Blue', 'Green', 'Hue', 'Intensity', 'Red', 'Saturation', 'XYZ_X', 'XYZ_Y', 'XYZ_Z', 'xyY_YY', 'xyY_x', 'xyY_y'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Companding">
      <sch:assert test="if (img:active_flag) then img:active_flag = ('true', 'false') else true()">
        <title>img:Companding/img:active_flag</title>
        The attribute img:active_flag must be equal to one of the following values 'true', 'false'.</sch:assert>
      <sch:assert test="if (img:early_scaling) then img:early_scaling = ('true', 'false') else true()">
        <title>img:Companding/img:early_scaling</title>
        The attribute img:early_scaling must be equal to one of the following values 'true', 'false'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Companding/img:companding_state">
      <sch:assert test=". = ('Companded', 'Expanded', 'None')">
        <title>img:Companding/img:companding_state/img:companding_state</title>
        The attribute img:Companding/img:companding_state must be equal to one of the following values 'Companded', 'Expanded', 'None'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Detector">
      <sch:assert test="if (img:bad_pixel_replacement_flag) then img:bad_pixel_replacement_flag = ('true', 'false') else true()">
        <title>img:Detector/img:bad_pixel_replacement_flag</title>
        The attribute img:bad_pixel_replacement_flag must be equal to one of the following values 'true', 'false'.</sch:assert>
      <sch:assert test="if (img:early_image_return) then img:early_image_return = ('true', 'false') else true()">
        <title>img:Detector/img:early_image_return</title>
        The attribute img:early_image_return must be equal to one of the following values 'true', 'false'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Detector/img:detector_to_image_flip">
      <sch:assert test=". = ('Horizontal', 'None', 'Vertical')">
        <title>img:Detector/img:detector_to_image_flip/img:detector_to_image_flip</title>
        The attribute img:Detector/img:detector_to_image_flip must be equal to one of the following values 'Horizontal', 'None', 'Vertical'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Detector/img:sensing_method">
      <sch:assert test=". = ('Color sequential area', 'Monochrome area', 'Monochrome linear', 'One-chip color area', 'Three-chip color area', 'Trilinear', 'Two-chip color area')">
        <title>img:Detector/img:sensing_method/img:sensing_method</title>
        The attribute img:Detector/img:sensing_method must be equal to one of the following values 'Color sequential area', 'Monochrome area', 'Monochrome linear', 'One-chip color area', 'Three-chip color area', 'Trilinear', 'Two-chip color area'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Detector/pds:Internal_Reference">
      <sch:assert test="pds:reference_type = 'data_to_raw_source_product'">
        <title>img:Detector/pds:Internal_Reference/Rule</title>
        In img:Detector, Internal_Reference.reference_type must be equal to 'data_to_raw_source_product'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Exposure/img:exposure_type">
      <sch:assert test=". = ('Auto', 'Auto Bracket', 'Auto Last', 'Manual', 'Manual Last', 'None', 'Test')">
        <title>img:Exposure/img:exposure_type/img:exposure_type</title>
        The attribute img:Exposure/img:exposure_type must be equal to one of the following values 'Auto', 'Auto Bracket', 'Auto Last', 'Manual', 'Manual Last', 'None', 'Test'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Frame">
      <sch:assert test="if (img:product_flag) then img:product_flag = ('true', 'false') else true()">
        <title>img:Frame/img:product_flag</title>
        The attribute img:product_flag must be equal to one of the following values 'true', 'false'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Frame/img:frame_type_name">
      <sch:assert test=". = ('Mono', 'Stereo')">
        <title>img:Frame/img:frame_type_name/img:frame_type_name</title>
        The attribute img:Frame/img:frame_type_name must be equal to one of the following values 'Mono', 'Stereo'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:High_Dynamic_Range">
      <sch:assert test="if (img:active_flag) then img:active_flag = ('true', 'false') else true()">
        <title>img:High_Dynamic_Range/img:active_flag</title>
        The attribute img:active_flag must be equal to one of the following values 'true', 'false'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:High_Dynamic_Range/img:hdr_acquisition_mode">
      <sch:assert test=". = ('Multiframe', 'None', 'Piecewise', 'Single')">
        <title>img:High_Dynamic_Range/img:hdr_acquisition_mode/img:hdr_acquisition_mode</title>
        The attribute img:High_Dynamic_Range/img:hdr_acquisition_mode must be equal to one of the following values 'Multiframe', 'None', 'Piecewise', 'Single'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:High_Dynamic_Range_Exposure/pds:Internal_Reference">
      <sch:assert test="pds:reference_type = 'data_to_raw_source_product'">
        <title>img:High_Dynamic_Range_Exposure/pds:Internal_Reference/Rule</title>
        In img:High_Dynamic_Range_Exposure, Internal_Reference.reference_type must be equal to 'data_to_raw_source_product'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:ISO/img:sensitivity_type">
      <sch:assert test=". = ('ISO Speed', 'Recommended Exposure Index', 'Recommended Exposure Index and ISO Speed', 'Standard Output Sensitivity', 'Standard Output Sensitivity and ISO Speed', 'Standard Output Sensitivity and Recommended Exposure Index', 'Standard Output Sensitivity, Recommended Exposure Index and ISO Speed', 'Unknown')">
        <title>img:ISO/img:sensitivity_type/img:sensitivity_type</title>
        The attribute img:ISO/img:sensitivity_type must be equal to one of the following values 'ISO Speed', 'Recommended Exposure Index', 'Recommended Exposure Index and ISO Speed', 'Standard Output Sensitivity', 'Standard Output Sensitivity and ISO Speed', 'Standard Output Sensitivity and Recommended Exposure Index', 'Standard Output Sensitivity, Recommended Exposure Index and ISO Speed', 'Unknown'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Image_Mask_File/img:mask_type">
      <sch:assert test=". = ('description', 'image')">
        <title>img:Image_Mask_File/img:mask_type/img:mask_type</title>
        The attribute img:Image_Mask_File/img:mask_type must be equal to one of the following values 'description', 'image'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:JPEG_Parameters/img:chrominance_positioning">
      <sch:assert test=". = ('Centered', 'Co-sited')">
        <title>img:JPEG_Parameters/img:chrominance_positioning/img:chrominance_positioning</title>
        The attribute img:JPEG_Parameters/img:chrominance_positioning must be equal to one of the following values 'Centered', 'Co-sited'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:JPEG_Parameters/img:color_subsampling_mode">
      <sch:assert test=". = ('4:2:2', '4:4:4', 'Grayscale')">
        <title>img:JPEG_Parameters/img:color_subsampling_mode/img:color_subsampling_mode</title>
        The attribute img:JPEG_Parameters/img:color_subsampling_mode must be equal to one of the following values '4:2:2', '4:4:4', 'Grayscale'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:JPEG_Progressive_Parameters/img:chrominance_positioning">
      <sch:assert test=". = ('Centered', 'Co-sited')">
        <title>img:JPEG_Progressive_Parameters/img:chrominance_positioning/img:chrominance_positioning</title>
        The attribute img:JPEG_Progressive_Parameters/img:chrominance_positioning must be equal to one of the following values 'Centered', 'Co-sited'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:JPEG_Progressive_Parameters/img:color_subsampling_mode">
      <sch:assert test=". = ('4:2:2', '4:4:4', 'Grayscale')">
        <title>img:JPEG_Progressive_Parameters/img:color_subsampling_mode/img:color_subsampling_mode</title>
        The attribute img:JPEG_Progressive_Parameters/img:color_subsampling_mode must be equal to one of the following values '4:2:2', '4:4:4', 'Grayscale'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:LED_Illumination_Source/img:illumination_state">
      <sch:assert test=". = ('Off', 'On')">
        <title>img:LED_Illumination_Source/img:illumination_state/img:illumination_state</title>
        The attribute img:LED_Illumination_Source/img:illumination_state must be equal to one of the following values 'Off', 'On'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Onboard_Compression">
      <sch:assert test="if (img:deferred_flag) then img:deferred_flag = ('true', 'false') else true()">
        <title>img:Onboard_Compression/img:deferred_flag</title>
        The attribute img:deferred_flag must be equal to one of the following values 'true', 'false'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Onboard_Compression/img:onboard_compression_class">
      <sch:assert test=". = ('Lossless', 'Lossy', 'Uncompressed')">
        <title>img:Onboard_Compression/img:onboard_compression_class/img:onboard_compression_class</title>
        The attribute img:Onboard_Compression/img:onboard_compression_class must be equal to one of the following values 'Lossless', 'Lossy', 'Uncompressed'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Onboard_Compression/img:onboard_compression_type">
      <sch:assert test=". = ('GZIP', 'H.264 Frame', 'ICER', 'ICT', 'JPEG', 'JPEG Progressive', 'LOCO', 'LZO', 'Lossless', 'MSSS Lossless', 'NEF', 'NEF High Efficiency Star', 'Nikon NEF Compressed', 'None', 'Rice', 'StarPixel Flexible', 'StarPixel Lossless', 'Wavelet')">
        <title>img:Onboard_Compression/img:onboard_compression_type/img:onboard_compression_type</title>
        The attribute img:Onboard_Compression/img:onboard_compression_type must be equal to one of the following values 'GZIP', 'H.264 Frame', 'ICER', 'ICT', 'JPEG', 'JPEG Progressive', 'LOCO', 'LZO', 'Lossless', 'MSSS Lossless', 'NEF', 'NEF High Efficiency Star', 'Nikon NEF Compressed', 'None', 'Rice', 'StarPixel Flexible', 'StarPixel Lossless', 'Wavelet'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Onboard_Compression/img:onboard_compression_venue">
      <sch:assert test=". = ('Hardware', 'Software')">
        <title>img:Onboard_Compression/img:onboard_compression_venue/img:onboard_compression_venue</title>
        The attribute img:Onboard_Compression/img:onboard_compression_venue must be equal to one of the following values 'Hardware', 'Software'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Radiometric_Correction">
      <sch:assert test="if (img:active_flag) then img:active_flag = ('true', 'false') else true()">
        <title>img:Radiometric_Correction/img:active_flag</title>
        The attribute img:active_flag must be equal to one of the following values 'true', 'false'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Radiometric_Correction/img:radiometric_type">
      <sch:assert test=". = ('No CFA', 'Radiance', 'Radiance Factor', 'Scaled Spectral Radiance', 'Spectral Radiance')">
        <title>img:Radiometric_Correction/img:radiometric_type/img:radiometric_type</title>
        The attribute img:Radiometric_Correction/img:radiometric_type must be equal to one of the following values 'No CFA', 'Radiance', 'Radiance Factor', 'Scaled Spectral Radiance', 'Spectral Radiance'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Shutter/img:readout_direction_line">
      <sch:assert test=". = ('Bottom to Top', 'Left to Right', 'Right to Left', 'Top to Bottom')">
        <title>img:Shutter/img:readout_direction_line/img:readout_direction_line</title>
        The attribute img:Shutter/img:readout_direction_line must be equal to one of the following values 'Bottom to Top', 'Left to Right', 'Right to Left', 'Top to Bottom'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Shutter/img:readout_direction_pixel">
      <sch:assert test=". = ('Bottom to Top', 'Left to Right', 'Right to Left', 'Top to Bottom')">
        <title>img:Shutter/img:readout_direction_pixel/img:readout_direction_pixel</title>
        The attribute img:Shutter/img:readout_direction_pixel must be equal to one of the following values 'Bottom to Top', 'Left to Right', 'Right to Left', 'Top to Bottom'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Shutter/img:shutter_type">
      <sch:assert test=". = ('Global', 'Rolling', 'Unknown')">
        <title>img:Shutter/img:shutter_type/img:shutter_type</title>
        The attribute img:Shutter/img:shutter_type must be equal to one of the following values 'Global', 'Rolling', 'Unknown'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Shutter_Subtraction">
      <sch:assert test="if (img:active_flag) then img:active_flag = ('true', 'false') else true()">
        <title>img:Shutter_Subtraction/img:active_flag</title>
        The attribute img:active_flag must be equal to one of the following values 'true', 'false'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Shutter_Subtraction/img:shutter_subtraction_mode">
      <sch:assert test=". = ('Always', 'Conditional', 'None', 'True')">
        <title>img:Shutter_Subtraction/img:shutter_subtraction_mode/img:shutter_subtraction_mode</title>
        The attribute img:Shutter_Subtraction/img:shutter_subtraction_mode must be equal to one of the following values 'Always', 'Conditional', 'None', 'True'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Subframe/img:subframe_type">
      <sch:assert test=". = ('Hardware Compatible', 'Hardware Else Software', 'None', 'Software Only', 'Subframe Around Sun', 'Sun Subframe Or Full')">
        <title>img:Subframe/img:subframe_type/img:subframe_type</title>
        The attribute img:Subframe/img:subframe_type must be equal to one of the following values 'Hardware Compatible', 'Hardware Else Software', 'None', 'Software Only', 'Subframe Around Sun', 'Sun Subframe Or Full'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Thumbnail">
      <sch:assert test="if (img:product_flag) then img:product_flag = ('true', 'false') else true()">
        <title>img:Thumbnail/img:product_flag</title>
        The attribute img:product_flag must be equal to one of the following values 'true', 'false'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Thumbnail/img:frame_type_name">
      <sch:assert test=". = ('Mono', 'Stereo')">
        <title>img:Thumbnail/img:frame_type_name/img:frame_type_name</title>
        The attribute img:Thumbnail/img:frame_type_name must be equal to one of the following values 'Mono', 'Stereo'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Tile/img:tile_upsample_method">
      <sch:assert test=". = ('Bilinear', 'None', 'Replication')">
        <title>img:Tile/img:tile_upsample_method/img:tile_upsample_method</title>
        The attribute img:Tile/img:tile_upsample_method must be equal to one of the following values 'Bilinear', 'None', 'Replication'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Tile/pds:Internal_Reference">
      <sch:assert test="pds:reference_type = 'data_to_tile_source_data'">
        <title>img:Tile/pds:Internal_Reference/Rule</title>
        In img:Tile, Internal_Reference.reference_type must be equal to 'data_to_tile_source_data'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Tiling/img:tile_type">
      <sch:assert test=". = ('Irregular', 'Regular')">
        <title>img:Tiling/img:tile_type/img:tile_type</title>
        The attribute img:Tiling/img:tile_type must be equal to one of the following values 'Irregular', 'Regular'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Tiling/img:tile_venue">
      <sch:assert test=". = ('Ground', 'Onboard')">
        <title>img:Tiling/img:tile_venue/img:tile_venue</title>
        The attribute img:Tiling/img:tile_venue must be equal to one of the following values 'Ground', 'Onboard'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Video/pds:External_Reference">
      <sch:assert test="pds:reference_type = 'video_frame_to_video'">
        <title>img:Video/pds:External_Reference/Rule</title>
        In img:Video, External_Reference.reference_type must be equal to 'video_frame_to_video'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="img:Video/pds:Internal_Reference">
      <sch:assert test="pds:reference_type = 'video_frame_to_video'">
        <title>img:Video/pds:Internal_Reference/Rule</title>
        In img:Video, Internal_Reference.reference_type must be equal to 'video_frame_to_video'.</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
