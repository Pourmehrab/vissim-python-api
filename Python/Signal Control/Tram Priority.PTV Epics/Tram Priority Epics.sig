<?xml version="1.0" encoding="UTF-8"?>
<sc version="201502" id="1" name="" frequency="1" steps="0" defaultIntergreenMatrix="1" EPICSTimeHorizon="100000" EPICSLogLevel="3" interstagesUsingMinDurations="false">
  <signaldisplays>
    <display id="1" name="Red" state="RED">
      <patterns>
        <pattern pattern="MINUS" color="#FF0000" isBold="true" />
      </patterns>
    </display>
    <display id="2" name="Red/Amber" state="REDAMBER">
      <patterns>
        <pattern pattern="FRAME" color="#CCCC00" isBold="true" />
        <pattern pattern="SLASH" color="#CC0000" isBold="false" />
        <pattern pattern="MINUS" color="#CC0000" isBold="false" />
      </patterns>
    </display>
    <display id="3" name="Green" state="GREEN">
      <patterns>
        <pattern pattern="FRAME" color="#00CC00" isBold="true" />
        <pattern pattern="SOLID" color="#00CC00" isBold="false" />
      </patterns>
    </display>
    <display id="4" name="Amber" state="AMBER">
      <patterns>
        <pattern pattern="FRAME" color="#CCCC00" isBold="true" />
        <pattern pattern="SLASH" color="#CCCC00" isBold="false" />
      </patterns>
    </display>
  </signaldisplays>
  <signalsequences>
    <signalsequence id="3" name="Red-Red/Amber-Green-Amber">
      <state display="1" isFixedDuration="false" isClosed="true" defaultDuration="1000" />
      <state display="2" isFixedDuration="true" isClosed="true" defaultDuration="1000" />
      <state display="3" isFixedDuration="false" isClosed="false" defaultDuration="5000" />
      <state display="4" isFixedDuration="true" isClosed="true" defaultDuration="3000" />
    </signalsequence>
    <signalsequence id="4" name="Red-Green">
      <state display="1" isFixedDuration="false" isClosed="true" defaultDuration="1000" />
      <state display="3" isFixedDuration="false" isClosed="false" defaultDuration="5000" />
    </signalsequence>
  </signalsequences>
  <sgs>
    <sg id="1" name="K1 all" defaultSignalSequence="3" underEPICSControl="true">
      <defaultDurations>
        <defaultDuration display="1" duration="1000" />
        <defaultDuration display="2" duration="1000" />
        <defaultDuration display="3" duration="5000" />
        <defaultDuration display="4" duration="3000" />
      </defaultDurations>
      <EPICSTrafficDemands>
        <EPICSITDemand numberLanes="2" maximumSpeed="50" weight="1" timeRequirement="2000" helpSignalGroup="0" competingSignalGroup="0">
          <occupancyDetectors />
          <subtractionDetectors />
          <ITDetectionPoints>
            <ITDetectionPoint travelTime="4000">
              <countingDetectors>
                <countingDetector countingDetId="1" />
                <countingDetector countingDetId="2" />
              </countingDetectors>
            </ITDetectionPoint>
          </ITDetectionPoints>
        </EPICSITDemand>
      </EPICSTrafficDemands>
    </sg>
    <sg id="2" name="K2 left" defaultSignalSequence="3" underEPICSControl="true">
      <defaultDurations>
        <defaultDuration display="1" duration="1000" />
        <defaultDuration display="2" duration="1000" />
        <defaultDuration display="3" duration="5000" />
        <defaultDuration display="4" duration="3000" />
      </defaultDurations>
      <EPICSTrafficDemands>
        <EPICSITDemand numberLanes="1" maximumSpeed="50" weight="1" timeRequirement="2000" helpSignalGroup="0" competingSignalGroup="0">
          <occupancyDetectors />
          <subtractionDetectors />
          <ITDetectionPoints>
            <ITDetectionPoint travelTime="1000">
              <countingDetectors>
                <countingDetector countingDetId="3" />
              </countingDetectors>
            </ITDetectionPoint>
          </ITDetectionPoints>
        </EPICSITDemand>
      </EPICSTrafficDemands>
    </sg>
    <sg id="3" name="K2 straight/right" defaultSignalSequence="3" underEPICSControl="true">
      <defaultDurations>
        <defaultDuration display="1" duration="1000" />
        <defaultDuration display="2" duration="1000" />
        <defaultDuration display="3" duration="5000" />
        <defaultDuration display="4" duration="3000" />
      </defaultDurations>
      <EPICSTrafficDemands>
        <EPICSITDemand numberLanes="1" maximumSpeed="50" weight="1" timeRequirement="2000" helpSignalGroup="0" competingSignalGroup="0">
          <occupancyDetectors />
          <subtractionDetectors />
          <ITDetectionPoints>
            <ITDetectionPoint travelTime="4000">
              <countingDetectors>
                <countingDetector countingDetId="4" />
              </countingDetectors>
            </ITDetectionPoint>
          </ITDetectionPoints>
        </EPICSITDemand>
        <EPICSPTDemand maximumSpeed="40" weight0="1" weight="1" weight2="1" weight3="1" timeRequirement="4000" helpSignalGroup="0" competingSignalGroup="0">
          <PTDetectionPoints>
            <PTDetectionPoint travelTime="15000" callingPointPair="1" hasOwnLane="false" fastestTravelTime="12000" slowTravelTime="21000" slowestTravelTime="25000" />
          </PTDetectionPoints>
        </EPICSPTDemand>
      </EPICSTrafficDemands>
    </sg>
    <sg id="4" name="K3 left/straight" defaultSignalSequence="3" underEPICSControl="true">
      <defaultDurations>
        <defaultDuration display="1" duration="1000" />
        <defaultDuration display="2" duration="1000" />
        <defaultDuration display="3" duration="5000" />
        <defaultDuration display="4" duration="3000" />
      </defaultDurations>
      <EPICSTrafficDemands>
        <EPICSITDemand numberLanes="2" maximumSpeed="50" weight="1" timeRequirement="2000" helpSignalGroup="0" competingSignalGroup="0">
          <occupancyDetectors />
          <subtractionDetectors />
          <ITDetectionPoints>
            <ITDetectionPoint travelTime="4000">
              <countingDetectors>
                <countingDetector countingDetId="5" />
                <countingDetector countingDetId="6" />
              </countingDetectors>
            </ITDetectionPoint>
          </ITDetectionPoints>
        </EPICSITDemand>
      </EPICSTrafficDemands>
    </sg>
    <sg id="5" name="K3 right" defaultSignalSequence="3" underEPICSControl="true">
      <defaultDurations>
        <defaultDuration display="1" duration="1000" />
        <defaultDuration display="2" duration="1000" />
        <defaultDuration display="3" duration="5000" />
        <defaultDuration display="4" duration="3000" />
      </defaultDurations>
      <EPICSTrafficDemands />
    </sg>
    <sg id="6" name="K4 left" defaultSignalSequence="3" underEPICSControl="true">
      <defaultDurations>
        <defaultDuration display="1" duration="1000" />
        <defaultDuration display="2" duration="1000" />
        <defaultDuration display="3" duration="5000" />
        <defaultDuration display="4" duration="3000" />
      </defaultDurations>
      <EPICSTrafficDemands>
        <EPICSITDemand numberLanes="1" maximumSpeed="50" weight="1" timeRequirement="2000" helpSignalGroup="0" competingSignalGroup="0">
          <occupancyDetectors />
          <subtractionDetectors />
          <ITDetectionPoints>
            <ITDetectionPoint travelTime="1000">
              <countingDetectors>
                <countingDetector countingDetId="7" />
              </countingDetectors>
            </ITDetectionPoint>
          </ITDetectionPoints>
        </EPICSITDemand>
      </EPICSTrafficDemands>
    </sg>
    <sg id="7" name="K4 straight/right" defaultSignalSequence="3" underEPICSControl="true">
      <defaultDurations>
        <defaultDuration display="1" duration="1000" />
        <defaultDuration display="2" duration="1000" />
        <defaultDuration display="3" duration="5000" />
        <defaultDuration display="4" duration="3000" />
      </defaultDurations>
      <EPICSTrafficDemands>
        <EPICSITDemand numberLanes="1" maximumSpeed="50" weight="1" timeRequirement="2000" helpSignalGroup="0" competingSignalGroup="0">
          <occupancyDetectors />
          <subtractionDetectors />
          <ITDetectionPoints>
            <ITDetectionPoint travelTime="4000">
              <countingDetectors>
                <countingDetector countingDetId="8" />
              </countingDetectors>
            </ITDetectionPoint>
          </ITDetectionPoints>
        </EPICSITDemand>
        <EPICSPTDemand maximumSpeed="40" weight0="1" weight="1" weight2="1" weight3="1" timeRequirement="4000" helpSignalGroup="0" competingSignalGroup="0">
          <PTDetectionPoints>
            <PTDetectionPoint travelTime="40000" callingPointPair="2" hasOwnLane="false" fastestTravelTime="36000" slowTravelTime="48000" slowestTravelTime="52000" />
          </PTDetectionPoints>
        </EPICSPTDemand>
      </EPICSTrafficDemands>
    </sg>
    <sg id="8" name="P1 South" defaultSignalSequence="4" underEPICSControl="true">
      <defaultDurations>
        <defaultDuration display="1" duration="1000" />
        <defaultDuration display="3" duration="5000" />
      </defaultDurations>
      <EPICSTrafficDemands>
        <EPICSPedDemand weight="5">
          <pedestrianDetectors>
            <pedestrianDetector pedestrianDetId="9" />
          </pedestrianDetectors>
        </EPICSPedDemand>
      </EPICSTrafficDemands>
    </sg>
    <sg id="9" name="P1 Middle" defaultSignalSequence="4" underEPICSControl="true">
      <defaultDurations>
        <defaultDuration display="1" duration="1000" />
        <defaultDuration display="3" duration="5000" />
      </defaultDurations>
      <EPICSTrafficDemands>
        <EPICSPedDemand weight="5">
          <pedestrianDetectors>
            <pedestrianDetector pedestrianDetId="10" />
          </pedestrianDetectors>
        </EPICSPedDemand>
      </EPICSTrafficDemands>
    </sg>
    <sg id="10" name="P1 North" defaultSignalSequence="4" underEPICSControl="true">
      <defaultDurations>
        <defaultDuration display="1" duration="1000" />
        <defaultDuration display="3" duration="5000" />
      </defaultDurations>
      <EPICSTrafficDemands>
        <EPICSPedDemand weight="5">
          <pedestrianDetectors>
            <pedestrianDetector pedestrianDetId="11" />
          </pedestrianDetectors>
        </EPICSPedDemand>
      </EPICSTrafficDemands>
    </sg>
    <sg id="11" name="P2" defaultSignalSequence="4" underEPICSControl="true">
      <defaultDurations>
        <defaultDuration display="1" duration="1000" />
        <defaultDuration display="3" duration="5000" />
      </defaultDurations>
      <EPICSTrafficDemands>
        <EPICSPedDemand weight="5">
          <pedestrianDetectors>
            <pedestrianDetector pedestrianDetId="12" />
          </pedestrianDetectors>
        </EPICSPedDemand>
      </EPICSTrafficDemands>
    </sg>
    <sg id="12" name="P3 North" defaultSignalSequence="4" underEPICSControl="true">
      <defaultDurations>
        <defaultDuration display="1" duration="1000" />
        <defaultDuration display="3" duration="5000" />
      </defaultDurations>
      <EPICSTrafficDemands>
        <EPICSPedDemand weight="5">
          <pedestrianDetectors>
            <pedestrianDetector pedestrianDetId="13" />
          </pedestrianDetectors>
        </EPICSPedDemand>
      </EPICSTrafficDemands>
    </sg>
    <sg id="13" name="P3 Middle" defaultSignalSequence="4" underEPICSControl="true">
      <defaultDurations>
        <defaultDuration display="1" duration="1000" />
        <defaultDuration display="3" duration="5000" />
      </defaultDurations>
      <EPICSTrafficDemands>
        <EPICSPedDemand weight="5">
          <pedestrianDetectors>
            <pedestrianDetector pedestrianDetId="14" />
          </pedestrianDetectors>
        </EPICSPedDemand>
      </EPICSTrafficDemands>
    </sg>
    <sg id="14" name="P3 South" defaultSignalSequence="4" underEPICSControl="true">
      <defaultDurations>
        <defaultDuration display="1" duration="1000" />
        <defaultDuration display="3" duration="5000" />
      </defaultDurations>
      <EPICSTrafficDemands>
        <EPICSPedDemand weight="5">
          <pedestrianDetectors>
            <pedestrianDetector pedestrianDetId="15" />
          </pedestrianDetectors>
        </EPICSPedDemand>
      </EPICSTrafficDemands>
    </sg>
    <sg id="15" name="P4" defaultSignalSequence="4" underEPICSControl="true">
      <defaultDurations>
        <defaultDuration display="1" duration="1000" />
        <defaultDuration display="3" duration="5000" />
      </defaultDurations>
      <EPICSTrafficDemands>
        <EPICSPedDemand weight="5">
          <pedestrianDetectors>
            <pedestrianDetector pedestrianDetId="16" />
          </pedestrianDetectors>
        </EPICSPedDemand>
      </EPICSTrafficDemands>
    </sg>
    <sg id="16" name="T1" defaultSignalSequence="3" underEPICSControl="true">
      <defaultDurations>
        <defaultDuration display="1" duration="1000" />
        <defaultDuration display="2" duration="1000" />
        <defaultDuration display="3" duration="2000" />
        <defaultDuration display="4" duration="3000" />
      </defaultDurations>
      <EPICSTrafficDemands />
    </sg>
    <sg id="17" name="T3" defaultSignalSequence="3" underEPICSControl="true">
      <defaultDurations>
        <defaultDuration display="1" duration="1000" />
        <defaultDuration display="2" duration="1000" />
        <defaultDuration display="3" duration="2000" />
        <defaultDuration display="4" duration="3000" />
      </defaultDurations>
      <EPICSTrafficDemands />
    </sg>
  </sgs>
  <dets>
    <det id="1" name="K1-4" />
    <det id="2" name="K1-5" />
    <det id="3" name="K2-2-Left" />
    <det id="4" name="K2-2" />
    <det id="5" name="K3-3" />
    <det id="6" name="K3-4" />
    <det id="7" name="K4-3-left" />
    <det id="8" name="K4-2" />
    <det id="9" name="P1-South" />
    <det id="10" name="P1-Middle" />
    <det id="11" name="P1-North" />
    <det id="12" name="P2" />
    <det id="13" name="P3-North" />
    <det id="14" name="P3-Middle" />
    <det id="15" name="P3-South" />
    <det id="16" name="P4" />
    <det id="17" name="K2-Bus-On" />
    <det id="18" name="K2-Bus-Off" />
    <det id="19" name="K4-Bus-On" />
    <det id="20" name="K4-Bus-Off" />
    <det id="21" name="K1-Tram-On" />
    <det id="22" name="K1-Tram-Off" />
    <det id="23" name="K3-Tram-On" />
    <det id="24" name="K3-Tram-Off" />
  </dets>
  <callingPoints />
  <callingPointPairs>
    <callingPointPair id="1" name="Bus - North-South" vehicleTimeForcedLogOff="120000" signalGroupTimeForcedLogOff="0">
      <loginPoints>
        <loginPoint loginDetectorId="17" />
      </loginPoints>
      <logoffPoints>
        <logoffPoint logoffDetectorId="18" />
      </logoffPoints>
    </callingPointPair>
    <callingPointPair id="2" name="Bus - South-North" vehicleTimeForcedLogOff="120000" signalGroupTimeForcedLogOff="0">
      <loginPoints>
        <loginPoint loginDetectorId="19" />
      </loginPoints>
      <logoffPoints>
        <logoffPoint logoffDetectorId="20" />
      </logoffPoints>
    </callingPointPair>
    <callingPointPair id="3" name="Tram - East-West" vehicleTimeForcedLogOff="120000" signalGroupTimeForcedLogOff="0">
      <loginPoints>
        <loginPoint loginDetectorId="21" />
      </loginPoints>
      <logoffPoints>
        <logoffPoint logoffDetectorId="22" />
      </logoffPoints>
    </callingPointPair>
  </callingPointPairs>
  <intergreenmatrices>
    <intergreenmatrix id="1" name="Zwischenzeitmatrix 1">
      <intergreen clearingsg="1" enteringsg="2" value="1000" />
      <intergreen clearingsg="1" enteringsg="3" value="2000" />
      <intergreen clearingsg="1" enteringsg="7" value="3000" />
      <intergreen clearingsg="1" enteringsg="10" value="1000" />
      <intergreen clearingsg="1" enteringsg="12" value="4000" />
      <intergreen clearingsg="1" enteringsg="16" value="3000" />
      <intergreen clearingsg="1" enteringsg="17" value="3000" />
      <intergreen clearingsg="2" enteringsg="1" value="1000" />
      <intergreen clearingsg="3" enteringsg="1" value="1000" />
      <intergreen clearingsg="5" enteringsg="1" value="0" />
      <intergreen clearingsg="6" enteringsg="1" value="3000" />
      <intergreen clearingsg="7" enteringsg="1" value="3000" />
      <intergreen clearingsg="10" enteringsg="1" value="6000" />
      <intergreen clearingsg="12" enteringsg="1" value="3000" />
      <intergreen clearingsg="15" enteringsg="1" value="5000" />
      <intergreen clearingsg="2" enteringsg="4" value="4000" />
      <intergreen clearingsg="2" enteringsg="11" value="1000" />
      <intergreen clearingsg="2" enteringsg="16" value="3000" />
      <intergreen clearingsg="2" enteringsg="17" value="3000" />
      <intergreen clearingsg="4" enteringsg="2" value="1000" />
      <intergreen clearingsg="11" enteringsg="2" value="6000" />
      <intergreen clearingsg="3" enteringsg="4" value="4000" />
      <intergreen clearingsg="3" enteringsg="11" value="1000" />
      <intergreen clearingsg="3" enteringsg="15" value="3000" />
      <intergreen clearingsg="3" enteringsg="16" value="2000" />
      <intergreen clearingsg="3" enteringsg="17" value="2000" />
      <intergreen clearingsg="11" enteringsg="3" value="6000" />
      <intergreen clearingsg="15" enteringsg="3" value="5000" />
      <intergreen clearingsg="4" enteringsg="8" value="3000" />
      <intergreen clearingsg="4" enteringsg="11" value="5000" />
      <intergreen clearingsg="4" enteringsg="16" value="3000" />
      <intergreen clearingsg="4" enteringsg="17" value="3000" />
      <intergreen clearingsg="6" enteringsg="4" value="3000" />
      <intergreen clearingsg="7" enteringsg="4" value="3000" />
      <intergreen clearingsg="8" enteringsg="4" value="3000" />
      <intergreen clearingsg="11" enteringsg="4" value="2000" />
      <intergreen clearingsg="14" enteringsg="4" value="6000" />
      <intergreen clearingsg="6" enteringsg="15" value="1000" />
      <intergreen clearingsg="6" enteringsg="16" value="3000" />
      <intergreen clearingsg="6" enteringsg="17" value="3000" />
      <intergreen clearingsg="15" enteringsg="6" value="8000" />
      <intergreen clearingsg="7" enteringsg="11" value="2000" />
      <intergreen clearingsg="7" enteringsg="15" value="1000" />
      <intergreen clearingsg="7" enteringsg="16" value="2000" />
      <intergreen clearingsg="7" enteringsg="17" value="2000" />
      <intergreen clearingsg="11" enteringsg="7" value="2000" />
      <intergreen clearingsg="15" enteringsg="7" value="8000" />
      <intergreen clearingsg="9" enteringsg="16" value="5000" />
      <intergreen clearingsg="9" enteringsg="17" value="4000" />
      <intergreen clearingsg="13" enteringsg="16" value="4000" />
      <intergreen clearingsg="13" enteringsg="17" value="5000" />
      <intergreen clearingsg="1" enteringsg="5" value="7000" />
      <intergreen clearingsg="1" enteringsg="6" value="3000" />
      <intergreen clearingsg="1" enteringsg="4" value="7000" />
      <intergreen clearingsg="4" enteringsg="1" value="7000" />
      <intergreen clearingsg="1" enteringsg="15" value="7000" />
      <intergreen clearingsg="3" enteringsg="5" value="1000" />
      <intergreen clearingsg="4" enteringsg="6" value="3000" />
      <intergreen clearingsg="4" enteringsg="7" value="3000" />
      <intergreen clearingsg="4" enteringsg="3" value="3000" />
      <intergreen clearingsg="5" enteringsg="3" value="3000" />
      <intergreen clearingsg="17" enteringsg="4" value="7000" />
      <intergreen clearingsg="16" enteringsg="1" value="7000" />
      <intergreen clearingsg="17" enteringsg="1" value="7000" />
      <intergreen clearingsg="17" enteringsg="2" value="7000" />
      <intergreen clearingsg="16" enteringsg="2" value="7000" />
      <intergreen clearingsg="17" enteringsg="3" value="7000" />
      <intergreen clearingsg="16" enteringsg="3" value="7000" />
      <intergreen clearingsg="16" enteringsg="4" value="7000" />
      <intergreen clearingsg="16" enteringsg="6" value="7000" />
      <intergreen clearingsg="17" enteringsg="6" value="7000" />
      <intergreen clearingsg="17" enteringsg="7" value="7000" />
      <intergreen clearingsg="16" enteringsg="7" value="7000" />
      <intergreen clearingsg="17" enteringsg="9" value="5000" />
      <intergreen clearingsg="16" enteringsg="13" value="5000" />
      <intergreen clearingsg="4" enteringsg="14" value="4000" />
      <intergreen clearingsg="5" enteringsg="14" value="4000" />
      <intergreen clearingsg="17" enteringsg="13" value="8000" />
      <intergreen clearingsg="16" enteringsg="9" value="8000" />
    </intergreenmatrix>
  </intergreenmatrices>
  <progs />
  <stages>
    <stage id="1" name="Phase 1" isPseudoStage="false">
      <activations>
        <activation sg_id="1" activation="ON" />
        <activation sg_id="2" activation="OFF" />
        <activation sg_id="3" activation="OFF" />
        <activation sg_id="4" activation="OFF" />
        <activation sg_id="5" activation="OFF" />
        <activation sg_id="6" activation="OFF" />
        <activation sg_id="7" activation="OFF" />
        <activation sg_id="8" activation="OFF" />
        <activation sg_id="9" activation="OFF" />
        <activation sg_id="10" activation="OFF" />
        <activation sg_id="11" activation="ON" />
        <activation sg_id="12" activation="OFF" />
        <activation sg_id="13" activation="OFF" />
        <activation sg_id="14" activation="OFF" />
        <activation sg_id="15" activation="OFF" />
        <activation sg_id="16" activation="OFF" />
        <activation sg_id="17" activation="OFF" />
      </activations>
    </stage>
    <stage id="2" name="Phase 2" isPseudoStage="false">
      <activations>
        <activation sg_id="1" activation="OFF" />
        <activation sg_id="2" activation="OFF" />
        <activation sg_id="3" activation="OFF" />
        <activation sg_id="4" activation="ON" />
        <activation sg_id="5" activation="ON" />
        <activation sg_id="6" activation="OFF" />
        <activation sg_id="7" activation="OFF" />
        <activation sg_id="8" activation="OFF" />
        <activation sg_id="9" activation="OFF" />
        <activation sg_id="10" activation="OFF" />
        <activation sg_id="11" activation="OFF" />
        <activation sg_id="12" activation="OFF" />
        <activation sg_id="13" activation="OFF" />
        <activation sg_id="14" activation="OFF" />
        <activation sg_id="15" activation="ON" />
        <activation sg_id="16" activation="OFF" />
        <activation sg_id="17" activation="OFF" />
      </activations>
    </stage>
    <stage id="3" name="Phase 3" isPseudoStage="false">
      <activations>
        <activation sg_id="1" activation="OFF" />
        <activation sg_id="2" activation="ON" />
        <activation sg_id="3" activation="ON" />
        <activation sg_id="4" activation="OFF" />
        <activation sg_id="5" activation="OFF" />
        <activation sg_id="6" activation="ON" />
        <activation sg_id="7" activation="ON" />
        <activation sg_id="8" activation="ON" />
        <activation sg_id="9" activation="ON" />
        <activation sg_id="10" activation="ON" />
        <activation sg_id="11" activation="OFF" />
        <activation sg_id="12" activation="ON" />
        <activation sg_id="13" activation="ON" />
        <activation sg_id="14" activation="ON" />
        <activation sg_id="15" activation="OFF" />
        <activation sg_id="16" activation="OFF" />
        <activation sg_id="17" activation="OFF" />
      </activations>
    </stage>
    <stage id="4" name="Phase 4" isPseudoStage="false">
      <activations>
        <activation sg_id="1" activation="OFF" />
        <activation sg_id="2" activation="OFF" />
        <activation sg_id="3" activation="OFF" />
        <activation sg_id="4" activation="OFF" />
        <activation sg_id="5" activation="OFF" />
        <activation sg_id="6" activation="OFF" />
        <activation sg_id="7" activation="OFF" />
        <activation sg_id="8" activation="OFF" />
        <activation sg_id="9" activation="OFF" />
        <activation sg_id="10" activation="OFF" />
        <activation sg_id="11" activation="OFF" />
        <activation sg_id="12" activation="OFF" />
        <activation sg_id="13" activation="OFF" />
        <activation sg_id="14" activation="OFF" />
        <activation sg_id="15" activation="OFF" />
        <activation sg_id="16" activation="ON" />
        <activation sg_id="17" activation="ON" />
      </activations>
    </stage>
  </stages>
  <interstageProgs>
    <interstageProg id="1" cycletime="7000" intergreens="1" fromStage="1" toStage="2" name="1: Phase 1->2: Phase 2" virtualDuration="7000">
      <sgs>
        <sg sg_id="1" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="2" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="3" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="4" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="7000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="5" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="7000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="6" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="7" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="8" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="9" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="10" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="11" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="5000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="12" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="13" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="14" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="15" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="7000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="16" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="17" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
      </sgs>
    </interstageProg>
    <interstageProg id="2" cycletime="6000" intergreens="1" fromStage="1" toStage="3" name="1: Phase 1->3: Phase 3" virtualDuration="6000">
      <sgs>
        <sg sg_id="1" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="2" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="6000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="3" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="6000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="4" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="5" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="6" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="7" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="8" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="9" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="10" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="1000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="11" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="12" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="4000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="13" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="14" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="15" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="16" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="17" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
      </sgs>
    </interstageProg>
    <interstageProg id="3" cycletime="3000" intergreens="1" fromStage="1" toStage="4" name="1: Phase 1->4: Phase 4" virtualDuration="3000">
      <sgs>
        <sg sg_id="1" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="2" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="3" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="4" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="5" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="6" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="7" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="8" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="9" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="10" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="11" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="12" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="13" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="14" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="15" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="16" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="17" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
      </sgs>
    </interstageProg>
    <interstageProg id="4" cycletime="7000" intergreens="1" fromStage="2" toStage="1" name="2: Phase 2->1: Phase 1" virtualDuration="7000">
      <sgs>
        <sg sg_id="1" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="7000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="2" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="3" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="4" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="5" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="7000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="6" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="7" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="8" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="9" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="10" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="11" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="5000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="12" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="13" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="14" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="15" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="2000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="16" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="17" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
      </sgs>
    </interstageProg>
    <interstageProg id="5" cycletime="8000" intergreens="1" fromStage="2" toStage="3" name="2: Phase 2->3: Phase 3" virtualDuration="8000">
      <sgs>
        <sg sg_id="1" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="2" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="1000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="3" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="5000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="4" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="5" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="6" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="8000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="7" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="8000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="8" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="3000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="9" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="10" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="11" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="12" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="13" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="14" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="4000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="15" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="16" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="17" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
      </sgs>
    </interstageProg>
    <interstageProg id="6" cycletime="3000" intergreens="1" fromStage="2" toStage="4" name="2: Phase 2->4: Phase 4" virtualDuration="3000">
      <sgs>
        <sg sg_id="1" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="2" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="3" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="4" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="5" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="6" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="7" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="8" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="9" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="10" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="11" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="12" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="13" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="14" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="15" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="16" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="17" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
      </sgs>
    </interstageProg>
    <interstageProg id="7" cycletime="6000" intergreens="1" fromStage="3" toStage="1" name="3: Phase 3->1: Phase 1" virtualDuration="6000">
      <sgs>
        <sg sg_id="1" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="6000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="2" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="4000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="3" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="4000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="4" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="5" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="6" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="6000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="7" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="8" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="6000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="9" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="6000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="10" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="11" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="2000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="12" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="13" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="6000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="14" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="6000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="15" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="16" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="17" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
      </sgs>
    </interstageProg>
    <interstageProg id="8" cycletime="6000" intergreens="1" fromStage="3" toStage="2" name="3: Phase 3->2: Phase 2" virtualDuration="6000">
      <sgs>
        <sg sg_id="1" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="2" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="5000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="3" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="4" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="6000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="5" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="1000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="6" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="5000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="7" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="5000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="8" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="9" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="6000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="10" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="6000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="11" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="12" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="6000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="13" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="6000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="14" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="15" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="3000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="16" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="17" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
      </sgs>
    </interstageProg>
    <interstageProg id="9" cycletime="5000" intergreens="1" fromStage="3" toStage="4" name="3: Phase 3->4: Phase 4" virtualDuration="5000">
      <sgs>
        <sg sg_id="1" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="2" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="5000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="3" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="5000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="4" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="5" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="6" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="5000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="7" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="5000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="8" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="5000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="9" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="10" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="5000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="11" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="12" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="5000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="13" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="14" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="5000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="15" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="16" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="5000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="17" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="5000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
      </sgs>
    </interstageProg>
    <interstageProg id="10" cycletime="7000" intergreens="1" fromStage="4" toStage="1" name="4: Phase 4->1: Phase 1" virtualDuration="7000">
      <sgs>
        <sg sg_id="1" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="7000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="2" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="3" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="4" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="5" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="6" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="7" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="8" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="9" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="10" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="11" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="12" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="13" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="14" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="15" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="16" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="17" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
      </sgs>
    </interstageProg>
    <interstageProg id="11" cycletime="7000" intergreens="1" fromStage="4" toStage="2" name="4: Phase 4->2: Phase 2" virtualDuration="7000">
      <sgs>
        <sg sg_id="1" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="2" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="3" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="4" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="7000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="5" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="1000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="6" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="7" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="8" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="9" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="10" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="11" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="12" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="13" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="14" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="15" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="16" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="17" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
      </sgs>
    </interstageProg>
    <interstageProg id="12" cycletime="8000" intergreens="1" fromStage="4" toStage="3" name="4: Phase 4->3: Phase 3" virtualDuration="8000">
      <sgs>
        <sg sg_id="1" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="2" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="7000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="3" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="7000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="4" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="5" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="6" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="7000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="7" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="7000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="8" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="9" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="8000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="10" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="11" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="12" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="13" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="8000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="14" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="15" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="16" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="17" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
      </sgs>
    </interstageProg>
  </interstageProgs>
  <stageProgs>
    <stageProg id="1" cycletime="120000" switchpoint="0" offset="30000" intergreens="1" fitness="0.000000" vehicleCount="0" weightBalance="0" weightStops="0" balanceFixedTimeControl="false" name="Phase 1, Phase 2, Phase 3, Phase 4">
      <interstages>
        <interstage display="1" begin="10000" />
        <interstage display="5" begin="50000" />
        <interstage display="9" begin="81000" />
        <interstage display="10" begin="88000" />
      </interstages>
      <BALANCEInterstages>
        <BALANCEInterstage balIstId="1" earliestStart="0" originalStart="10000" latestStart="119000" notes="" />
        <BALANCEInterstage balIstId="5" earliestStart="0" originalStart="50000" latestStart="119000" notes="" />
        <BALANCEInterstage balIstId="9" earliestStart="0" originalStart="81000" latestStart="119000" notes="" />
        <BALANCEInterstage balIstId="10" earliestStart="0" originalStart="88000" latestStart="119000" notes="" />
      </BALANCEInterstages>
      <activeInterstages>
        <activeInterstage actIstId="1" />
        <activeInterstage actIstId="3" />
        <activeInterstage actIstId="5" />
        <activeInterstage actIstId="6" />
        <activeInterstage actIstId="7" />
        <activeInterstage actIstId="9" />
        <activeInterstage actIstId="10" />
        <activeInterstage actIstId="11" />
        <activeInterstage actIstId="12" />
      </activeInterstages>
      <EPICSStageParameters>
        <EPICSStageParameter stageId="1" earliestStart="0" latestEnd="120000" minimumLength="0" maximumLength="170000" preferredStart="95000" preferredEnd="10000" costPreferred="0" costNonPreferred="5" notes="" />
        <EPICSStageParameter stageId="2" earliestStart="0" latestEnd="120000" minimumLength="0" maximumLength="170000" preferredStart="17000" preferredEnd="50000" costPreferred="0" costNonPreferred="5" notes="" />
        <EPICSStageParameter stageId="3" earliestStart="0" latestEnd="120000" minimumLength="0" maximumLength="170000" preferredStart="58000" preferredEnd="81000" costPreferred="0" costNonPreferred="5" notes="" />
        <EPICSStageParameter stageId="4" earliestStart="0" latestEnd="120000" minimumLength="0" maximumLength="170000" preferredStart="86000" preferredEnd="88000" costPreferred="5" costNonPreferred="5" notes="" />
      </EPICSStageParameters>
      <sgs>
        <sg sg_id="1" cyclical="true" epicsMinRed="0" epicsMaxRed="120000" balMinGreen="5000" balMaxGreen="120000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="2" cyclical="true" epicsMinRed="0" epicsMaxRed="120000" balMinGreen="9000" balMaxGreen="120000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="3" cyclical="true" epicsMinRed="0" epicsMaxRed="120000" balMinGreen="5000" balMaxGreen="120000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="4" cyclical="true" epicsMinRed="0" epicsMaxRed="120000" balMinGreen="5000" balMaxGreen="120000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="5" cyclical="true" epicsMinRed="0" epicsMaxRed="120000" balMinGreen="5000" balMaxGreen="120000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="6" cyclical="true" epicsMinRed="0" epicsMaxRed="120000" balMinGreen="5000" balMaxGreen="120000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="7" cyclical="true" epicsMinRed="0" epicsMaxRed="120000" balMinGreen="5000" balMaxGreen="120000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="8" cyclical="true" epicsMinRed="0" epicsMaxRed="120000" balMinGreen="10000" balMaxGreen="120000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="9" cyclical="true" epicsMinRed="0" epicsMaxRed="120000" balMinGreen="8000" balMaxGreen="120000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="10" cyclical="true" epicsMinRed="0" epicsMaxRed="120000" balMinGreen="13000" balMaxGreen="120000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="11" cyclical="true" epicsMinRed="0" epicsMaxRed="120000" balMinGreen="12000" balMaxGreen="120000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="12" cyclical="true" epicsMinRed="0" epicsMaxRed="120000" balMinGreen="13000" balMaxGreen="120000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="13" cyclical="true" epicsMinRed="0" epicsMaxRed="120000" balMinGreen="8000" balMaxGreen="120000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="14" cyclical="true" epicsMinRed="0" epicsMaxRed="120000" balMinGreen="9000" balMaxGreen="120000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="15" cyclical="true" epicsMinRed="0" epicsMaxRed="120000" balMinGreen="5000" balMaxGreen="120000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="16" cyclical="true" epicsMinRed="0" epicsMaxRed="120000" balMinGreen="2000" balMaxGreen="120000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="17" cyclical="true" epicsMinRed="0" epicsMaxRed="120000" balMinGreen="2000" balMaxGreen="120000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
      </sgs>
    </stageProg>
  </stageProgs>
  <dailyProgLists />
</sc>