<?xml version="1.0" encoding="UTF-8"?>
<!-- PDS4 Schematron file for Imaging Dictionary -->
 <!-- Generated from the PDS4_Imaging_1100_20131118224915_ext_ext.xml
  Ingest_LDD file (with supplemental Schematron rules) -->

<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">

  <sch:title>Schematron using XPath 2.0</sch:title>

  <sch:ns uri="http://pds.nasa.gov/pds4/img/v1" prefix="img"/>
  <sch:ns uri="http://pds.nasa.gov/pds4/pds/v1" prefix="pds"/>

  <sch:pattern id="Enumerated_Value_Checks">

    <sch:rule context="img:Telemetry_Parameters">
      <sch:assert test="img:downlink_telemetry_protocol_type = ('SFDU', 'Data Product', 'CFDP')">
        Imaging Dictionary: In the img:Telemetry_Parameters class, the img:downlink_telemetry_protocol_type must be equal to one of the following values: 'SFDU', 'Data Product', 'CFDP'.
      </sch:assert>
      <sch:assert test="img:telemetry_provider_id = ('MPCS', 'FDM', 'TTACS', 'TDS')">
        Imaging Dictionary: In the img:Telemetry_Parameters class, the img:telemetry_provider_id must be equal to one of the following values: 'MPCS', 'FDM', 'TTACS', 'TDS'.
      </sch:assert>
    </sch:rule>

    <sch:rule context="img:Imaging_Instrument_Parameters">
      <sch:assert test="img:light_flood_state_flag = ('On', 'Off')">
        Imaging Dictionary: In the img:Imaging_Instrument_Parameters class, the img:light_flood_state_flag must be equal to one of the following values: 'On', 'Off'.
      </sch:assert>
    </sch:rule>

    <sch:rule context="img:Packet_Parameters">
      <sch:assert test="img:missing_packet_flag = ('0', 'false', '1', 'true')">
        Imaging Dictionary: In the img:Packet_Parameters class, the img:missing_packet_flag must be equal to one of the following values: '0', 'false', '1', 'true'.
      </sch:assert>
    </sch:rule>
  </sch:pattern>

</sch:schema>
