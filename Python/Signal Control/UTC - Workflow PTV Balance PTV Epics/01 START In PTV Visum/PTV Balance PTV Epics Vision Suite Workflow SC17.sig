<?xml version="1.0" encoding="UTF-8"?>
<sc version="201502" id="17" name="SC17" frequency="1" steps="0" defaultIntergreenMatrix="1" EPICSTimeHorizon="100000" EPICSLogLevel="1" interstagesUsingMinDurations="false">
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
    <sg id="1" name="SG1" defaultSignalSequence="3" underEPICSControl="true">
      <defaultDurations>
        <defaultDuration display="1" duration="1000" />
        <defaultDuration display="2" duration="1000" />
        <defaultDuration display="3" duration="5000" />
        <defaultDuration display="4" duration="3000" />
      </defaultDurations>
      <EPICSTrafficDemands>
        <EPICSITDemand numberLanes="1" maximumSpeed="40" weight="1" timeRequirement="2000" helpSignalGroup="0" competingSignalGroup="0">
          <occupancyDetectors />
          <subtractionDetectors />
          <ITDetectionPoints>
            <ITDetectionPoint travelTime="5000">
              <countingDetectors>
                <countingDetector countingDetId="7" />
              </countingDetectors>
            </ITDetectionPoint>
          </ITDetectionPoints>
        </EPICSITDemand>
      </EPICSTrafficDemands>
    </sg>
    <sg id="2" name="SG2" defaultSignalSequence="3" underEPICSControl="true">
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
                <countingDetector countingDetId="8" />
                <countingDetector countingDetId="10" />
              </countingDetectors>
            </ITDetectionPoint>
          </ITDetectionPoints>
        </EPICSITDemand>
        <EPICSPTDemand maximumSpeed="50" weight0="100" weight="100" weight2="100" weight3="100" timeRequirement="4000" helpSignalGroup="0" competingSignalGroup="0">
          <PTDetectionPoints>
            <PTDetectionPoint travelTime="17000" callingPointPair="1" hasOwnLane="false" fastestTravelTime="14000" slowTravelTime="23000" slowestTravelTime="27000" />
          </PTDetectionPoints>
        </EPICSPTDemand>
      </EPICSTrafficDemands>
    </sg>
    <sg id="3" name="SG3" defaultSignalSequence="3" underEPICSControl="true">
      <defaultDurations>
        <defaultDuration display="1" duration="1000" />
        <defaultDuration display="2" duration="1000" />
        <defaultDuration display="3" duration="5000" />
        <defaultDuration display="4" duration="3000" />
      </defaultDurations>
      <EPICSTrafficDemands>
        <EPICSITDemand numberLanes="1" maximumSpeed="40" weight="1" timeRequirement="2000" helpSignalGroup="0" competingSignalGroup="0">
          <occupancyDetectors />
          <subtractionDetectors />
          <ITDetectionPoints>
            <ITDetectionPoint travelTime="5000">
              <countingDetectors>
                <countingDetector countingDetId="11" />
              </countingDetectors>
            </ITDetectionPoint>
          </ITDetectionPoints>
        </EPICSITDemand>
      </EPICSTrafficDemands>
    </sg>
    <sg id="4" name="SG4L" defaultSignalSequence="3" underEPICSControl="true">
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
                <countingDetector countingDetId="15" />
              </countingDetectors>
            </ITDetectionPoint>
          </ITDetectionPoints>
        </EPICSITDemand>
      </EPICSTrafficDemands>
    </sg>
    <sg id="5" name="SG4SR" defaultSignalSequence="3" underEPICSControl="true">
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
            <ITDetectionPoint travelTime="1000">
              <countingDetectors>
                <countingDetector countingDetId="14" />
                <countingDetector countingDetId="16" />
              </countingDetectors>
            </ITDetectionPoint>
          </ITDetectionPoints>
        </EPICSITDemand>
        <EPICSPTDemand maximumSpeed="50" weight0="100" weight="100" weight2="100" weight3="100" timeRequirement="4000" helpSignalGroup="0" competingSignalGroup="0">
          <PTDetectionPoints>
            <PTDetectionPoint travelTime="17000" callingPointPair="2" hasOwnLane="false" fastestTravelTime="14000" slowTravelTime="23000" slowestTravelTime="27000" />
          </PTDetectionPoints>
        </EPICSPTDemand>
      </EPICSTrafficDemands>
    </sg>
    <sg id="6" name="Crosswalk1" defaultSignalSequence="4" underEPICSControl="true">
      <defaultDurations>
        <defaultDuration display="1" duration="1000" />
        <defaultDuration display="3" duration="5000" />
      </defaultDurations>
      <EPICSTrafficDemands />
    </sg>
    <sg id="7" name="Crosswalk2E" defaultSignalSequence="4" underEPICSControl="true">
      <defaultDurations>
        <defaultDuration display="1" duration="1000" />
        <defaultDuration display="3" duration="5000" />
      </defaultDurations>
      <EPICSTrafficDemands />
    </sg>
    <sg id="8" name="Crosswalk2W" defaultSignalSequence="4" underEPICSControl="true">
      <defaultDurations>
        <defaultDuration display="1" duration="1000" />
        <defaultDuration display="3" duration="5000" />
      </defaultDurations>
      <EPICSTrafficDemands />
    </sg>
    <sg id="9" name="Crosswalk3" defaultSignalSequence="4" underEPICSControl="true">
      <defaultDurations>
        <defaultDuration display="1" duration="1000" />
        <defaultDuration display="3" duration="5000" />
      </defaultDurations>
      <EPICSTrafficDemands />
    </sg>
    <sg id="10" name="Crosswalk4W" defaultSignalSequence="4" underEPICSControl="true">
      <defaultDurations>
        <defaultDuration display="1" duration="1000" />
        <defaultDuration display="3" duration="5000" />
      </defaultDurations>
      <EPICSTrafficDemands />
    </sg>
    <sg id="11" name="Crosswalk4E" defaultSignalSequence="4" underEPICSControl="true">
      <defaultDurations>
        <defaultDuration display="1" duration="1000" />
        <defaultDuration display="3" duration="5000" />
      </defaultDurations>
      <EPICSTrafficDemands />
    </sg>
  </sgs>
  <dets>
    <det id="1" name="17_Crosswalk_1" />
    <det id="2" name="17_Crosswalk_2E" />
    <det id="3" name="17_Crosswalk_2W" />
    <det id="4" name="17_Crosswalk_3" />
    <det id="5" name="17_Crosswalk_4" />
    <det id="6" name="17_Crosswalk_4E" />
    <det id="7" name="17_SG_1_Lane2" />
    <det id="8" name="17_SG_2_Lane3" />
    <det id="9" name="17_SG_2_BusLogOff_Lane3" />
    <det id="10" name="17_SG_2_Lane4" />
    <det id="11" name="17_SG_3_Lane2" />
    <det id="12" name="17_SG_4_BusLogOff_Lane4" />
    <det id="13" name="17_SG_4_BusLogOn_Lane4" />
    <det id="14" name="17_SG_4_Lane4" />
    <det id="15" name="17_SG_4_Lane3" />
    <det id="16" name="17_SG_4_Lane5" />
    <det id="31" name="17_SG_2_BusLogOn_Lane3" />
  </dets>
  <callingPoints />
  <callingPointPairs>
    <callingPointPair id="1" name="North-South" vehicleTimeForcedLogOff="120000" signalGroupTimeForcedLogOff="0">
      <loginPoints>
        <loginPoint loginDetectorId="31" />
      </loginPoints>
      <logoffPoints>
        <logoffPoint logoffDetectorId="9" />
      </logoffPoints>
    </callingPointPair>
    <callingPointPair id="2" name="South-North" vehicleTimeForcedLogOff="120000" signalGroupTimeForcedLogOff="0">
      <loginPoints>
        <loginPoint loginDetectorId="13" />
      </loginPoints>
      <logoffPoints>
        <logoffPoint logoffDetectorId="12" />
      </logoffPoints>
    </callingPointPair>
  </callingPointPairs>
  <intergreenmatrices>
    <intergreenmatrix id="1" name="IG_SC17">
      <intergreen clearingsg="2" enteringsg="1" value="1000" />
      <intergreen clearingsg="3" enteringsg="1" value="3000" />
      <intergreen clearingsg="1" enteringsg="3" value="3000" />
      <intergreen clearingsg="4" enteringsg="1" value="3000" />
      <intergreen clearingsg="5" enteringsg="1" value="3000" />
      <intergreen clearingsg="6" enteringsg="1" value="7000" />
      <intergreen clearingsg="9" enteringsg="1" value="5000" />
      <intergreen clearingsg="1" enteringsg="2" value="3000" />
      <intergreen clearingsg="3" enteringsg="2" value="2000" />
      <intergreen clearingsg="4" enteringsg="2" value="3000" />
      <intergreen clearingsg="8" enteringsg="2" value="7000" />
      <intergreen clearingsg="10" enteringsg="2" value="5000" />
      <intergreen clearingsg="2" enteringsg="3" value="2000" />
      <intergreen clearingsg="4" enteringsg="3" value="3000" />
      <intergreen clearingsg="5" enteringsg="3" value="2000" />
      <intergreen clearingsg="6" enteringsg="3" value="5000" />
      <intergreen clearingsg="9" enteringsg="3" value="7000" />
      <intergreen clearingsg="1" enteringsg="4" value="3000" />
      <intergreen clearingsg="2" enteringsg="4" value="2000" />
      <intergreen clearingsg="3" enteringsg="4" value="3000" />
      <intergreen clearingsg="11" enteringsg="4" value="9000" />
      <intergreen clearingsg="11" enteringsg="5" value="9000" />
      <intergreen clearingsg="1" enteringsg="5" value="2000" />
      <intergreen clearingsg="3" enteringsg="5" value="4000" />
      <intergreen clearingsg="7" enteringsg="5" value="5000" />
      <intergreen clearingsg="1" enteringsg="6" value="2000" />
      <intergreen clearingsg="3" enteringsg="6" value="4000" />
      <intergreen clearingsg="5" enteringsg="7" value="4000" />
      <intergreen clearingsg="2" enteringsg="8" value="2000" />
      <intergreen clearingsg="1" enteringsg="9" value="4000" />
      <intergreen clearingsg="3" enteringsg="9" value="2000" />
      <intergreen clearingsg="2" enteringsg="10" value="3000" />
      <intergreen clearingsg="4" enteringsg="11" value="2000" />
      <intergreen clearingsg="5" enteringsg="11" value="2000" />
    </intergreenmatrix>
  </intergreenmatrices>
  <progs />
  <stages>
    <stage id="1" name="Stage 1" isPseudoStage="false">
      <activations>
        <activation sg_id="1" activation="ON" />
        <activation sg_id="2" activation="OFF" />
        <activation sg_id="3" activation="OFF" />
        <activation sg_id="4" activation="OFF" />
        <activation sg_id="5" activation="OFF" />
        <activation sg_id="6" activation="OFF" />
        <activation sg_id="7" activation="ON" />
        <activation sg_id="8" activation="ON" />
        <activation sg_id="9" activation="OFF" />
        <activation sg_id="10" activation="ON" />
        <activation sg_id="11" activation="ON" />
      </activations>
    </stage>
    <stage id="2" name="Stage 2" isPseudoStage="false">
      <activations>
        <activation sg_id="1" activation="OFF" />
        <activation sg_id="2" activation="OFF" />
        <activation sg_id="3" activation="ON" />
        <activation sg_id="4" activation="OFF" />
        <activation sg_id="5" activation="OFF" />
        <activation sg_id="6" activation="OFF" />
        <activation sg_id="7" activation="ON" />
        <activation sg_id="8" activation="ON" />
        <activation sg_id="9" activation="OFF" />
        <activation sg_id="10" activation="ON" />
        <activation sg_id="11" activation="ON" />
      </activations>
    </stage>
    <stage id="3" name="Stage 3" isPseudoStage="false">
      <activations>
        <activation sg_id="1" activation="OFF" />
        <activation sg_id="2" activation="ON" />
        <activation sg_id="3" activation="OFF" />
        <activation sg_id="4" activation="OFF" />
        <activation sg_id="5" activation="ON" />
        <activation sg_id="6" activation="ON" />
        <activation sg_id="7" activation="OFF" />
        <activation sg_id="8" activation="OFF" />
        <activation sg_id="9" activation="ON" />
        <activation sg_id="10" activation="OFF" />
        <activation sg_id="11" activation="OFF" />
      </activations>
    </stage>
    <stage id="4" name="Stage 4" isPseudoStage="false">
      <activations>
        <activation sg_id="1" activation="OFF" />
        <activation sg_id="2" activation="OFF" />
        <activation sg_id="3" activation="OFF" />
        <activation sg_id="4" activation="ON" />
        <activation sg_id="5" activation="ON" />
        <activation sg_id="6" activation="ON" />
        <activation sg_id="7" activation="OFF" />
        <activation sg_id="8" activation="OFF" />
        <activation sg_id="9" activation="ON" />
        <activation sg_id="10" activation="OFF" />
        <activation sg_id="11" activation="OFF" />
      </activations>
    </stage>
  </stages>
  <interstageProgs>
    <interstageProg id="1" cycletime="3000" intergreens="1" fromStage="1" toStage="2" name="1: Stage 1->2: Stage 2" virtualDuration="3000">
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
        <sg sg_id="3" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="3000" />
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
        <sg sg_id="6" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="7" signal_sequence="2">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="8" signal_sequence="2">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="9" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="10" signal_sequence="2">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="11" signal_sequence="2">
          <cmds />
          <fixedstates />
        </sg>
      </sgs>
    </interstageProg>
    <interstageProg id="2" cycletime="9000" intergreens="1" fromStage="1" toStage="3" name="1: Stage 1->3: Stage 3" virtualDuration="9000">
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
            <cmd display="3" begin="7000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="3" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="4" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="5" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="9000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="6" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="2000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="7" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="4000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="8" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="9" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="4000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="10" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="2000" />
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
      </sgs>
    </interstageProg>
    <interstageProg id="3" cycletime="9000" intergreens="1" fromStage="1" toStage="4" name="1: Stage 1->4: Stage 4" virtualDuration="9000">
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
            <cmd display="3" begin="9000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="5" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="9000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="6" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="2000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="7" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="4000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="8" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="9000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="9" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="4000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="10" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="9000" />
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
      </sgs>
    </interstageProg>
    <interstageProg id="4" cycletime="3000" intergreens="1" fromStage="2" toStage="1" name="2: Stage 2->1: Stage 1" virtualDuration="3000">
      <sgs>
        <sg sg_id="1" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="2" signal_sequence="1">
          <cmds />
          <fixedstates />
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
        <sg sg_id="7" signal_sequence="2">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="8" signal_sequence="2">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="9" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="10" signal_sequence="2">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="11" signal_sequence="2">
          <cmds />
          <fixedstates />
        </sg>
      </sgs>
    </interstageProg>
    <interstageProg id="5" cycletime="9000" intergreens="1" fromStage="2" toStage="3" name="2: Stage 2->3: Stage 3" virtualDuration="9000">
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
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="4" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="5" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="9000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="6" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="4000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="7" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="4000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="8" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="9" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="2000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="10" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="2000" />
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
      </sgs>
    </interstageProg>
    <interstageProg id="6" cycletime="9000" intergreens="1" fromStage="2" toStage="4" name="2: Stage 2->4: Stage 4" virtualDuration="9000">
      <sgs>
        <sg sg_id="1" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="2" signal_sequence="1">
          <cmds />
          <fixedstates />
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
            <cmd display="3" begin="9000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="5" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="9000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="6" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="4000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="7" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="4000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="8" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="9000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="9" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="2000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="10" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="9000" />
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
      </sgs>
    </interstageProg>
    <interstageProg id="7" cycletime="7000" intergreens="1" fromStage="3" toStage="1" name="3: Stage 3->1: Stage 1" virtualDuration="7000">
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
        <sg sg_id="2" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="3" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="4" signal_sequence="1">
          <cmds />
          <fixedstates />
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
        <sg sg_id="6" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="7" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="4000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="8" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="2000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="9" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="2000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="10" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="3000" />
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
      </sgs>
    </interstageProg>
    <interstageProg id="8" cycletime="7000" intergreens="1" fromStage="3" toStage="2" name="3: Stage 3->2: Stage 2" virtualDuration="7000">
      <sgs>
        <sg sg_id="1" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="2" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
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
        <sg sg_id="5" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="6" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="2000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="7" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="4000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="8" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="2000" />
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
            <cmd display="1" begin="0" />
            <cmd display="3" begin="3000" />
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
      </sgs>
    </interstageProg>
    <interstageProg id="9" cycletime="3000" intergreens="1" fromStage="3" toStage="4" name="3: Stage 3->4: Stage 4" virtualDuration="3000">
      <sgs>
        <sg sg_id="1" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="2" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="3" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="4" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="2000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="5" signal_sequence="2">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="6" signal_sequence="2">
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
        <sg sg_id="9" signal_sequence="2">
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
      </sgs>
    </interstageProg>
    <interstageProg id="10" cycletime="7000" intergreens="1" fromStage="4" toStage="1" name="4: Stage 4->1: Stage 1" virtualDuration="7000">
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
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="6" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="7" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="4000" />
          </cmds>
          <fixedstates />
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
            <cmd display="3" begin="0" />
            <cmd display="1" begin="2000" />
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
        <sg sg_id="11" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="2000" />
          </cmds>
          <fixedstates />
        </sg>
      </sgs>
    </interstageProg>
    <interstageProg id="11" cycletime="7000" intergreens="1" fromStage="4" toStage="2" name="4: Stage 4->2: Stage 2" virtualDuration="7000">
      <sgs>
        <sg sg_id="1" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="2" signal_sequence="1">
          <cmds />
          <fixedstates />
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
        <sg sg_id="6" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="2000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="7" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="4000" />
          </cmds>
          <fixedstates />
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
            <cmd display="3" begin="0" />
            <cmd display="1" begin="0" />
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
        <sg sg_id="11" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="2000" />
          </cmds>
          <fixedstates />
        </sg>
      </sgs>
    </interstageProg>
    <interstageProg id="12" cycletime="3000" intergreens="1" fromStage="4" toStage="3" name="4: Stage 4->3: Stage 3" virtualDuration="3000">
      <sgs>
        <sg sg_id="1" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="2" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
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
        <sg sg_id="5" signal_sequence="2">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="6" signal_sequence="2">
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
        <sg sg_id="9" signal_sequence="2">
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
      </sgs>
    </interstageProg>
  </interstageProgs>
  <stageProgs>
    <stageProg id="1" cycletime="90000" switchpoint="0" offset="23000" intergreens="1" fitness="0.000000" vehicleCount="0" weightBalance="1" weightStops="0" balanceFixedTimeControl="false" name="Stage 1, Stage 2, Stage 3, Stage 4">
      <interstages>
        <interstage display="1" begin="0" />
        <interstage display="5" begin="31000" />
        <interstage display="9" begin="65000" />
        <interstage display="10" begin="77000" />
      </interstages>
      <BALANCEInterstages>
        <BALANCEInterstage balIstId="1" earliestStart="0" originalStart="0" latestStart="89000" notes="" />
        <BALANCEInterstage balIstId="5" earliestStart="0" originalStart="31000" latestStart="89000" notes="" />
        <BALANCEInterstage balIstId="9" earliestStart="0" originalStart="65000" latestStart="89000" notes="" />
        <BALANCEInterstage balIstId="10" earliestStart="0" originalStart="77000" latestStart="89000" notes="" />
      </BALANCEInterstages>
      <activeInterstages>
        <activeInterstage actIstId="1" />
        <activeInterstage actIstId="2" />
        <activeInterstage actIstId="3" />
        <activeInterstage actIstId="4" />
        <activeInterstage actIstId="5" />
        <activeInterstage actIstId="6" />
        <activeInterstage actIstId="7" />
        <activeInterstage actIstId="8" />
        <activeInterstage actIstId="9" />
        <activeInterstage actIstId="10" />
        <activeInterstage actIstId="11" />
        <activeInterstage actIstId="12" />
      </activeInterstages>
      <EPICSStageParameters>
        <EPICSStageParameter stageId="1" earliestStart="0" latestEnd="90000" minimumLength="0" maximumLength="125000" preferredStart="84000" preferredEnd="0" costPreferred="0" costNonPreferred="5" notes="" />
        <EPICSStageParameter stageId="2" earliestStart="0" latestEnd="90000" minimumLength="0" maximumLength="125000" preferredStart="3000" preferredEnd="31000" costPreferred="0" costNonPreferred="5" notes="" />
        <EPICSStageParameter stageId="3" earliestStart="0" latestEnd="90000" minimumLength="0" maximumLength="125000" preferredStart="40000" preferredEnd="65000" costPreferred="0" costNonPreferred="5" notes="" />
        <EPICSStageParameter stageId="4" earliestStart="0" latestEnd="90000" minimumLength="0" maximumLength="125000" preferredStart="68000" preferredEnd="77000" costPreferred="0" costNonPreferred="5" notes="" />
      </EPICSStageParameters>
      <sgs>
        <sg sg_id="1" cyclical="true" epicsMinRed="0" epicsMaxRed="90000" balMinGreen="5000" balMaxGreen="90000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="2" cyclical="true" epicsMinRed="0" epicsMaxRed="90000" balMinGreen="5000" balMaxGreen="90000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="3" cyclical="true" epicsMinRed="0" epicsMaxRed="90000" balMinGreen="5000" balMaxGreen="90000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="4" cyclical="true" epicsMinRed="0" epicsMaxRed="90000" balMinGreen="5000" balMaxGreen="90000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="5" cyclical="true" epicsMinRed="0" epicsMaxRed="90000" balMinGreen="5000" balMaxGreen="90000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="6" cyclical="true" epicsMinRed="0" epicsMaxRed="90000" balMinGreen="8000" balMaxGreen="90000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="7" cyclical="true" epicsMinRed="0" epicsMaxRed="90000" balMinGreen="10000" balMaxGreen="90000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="8" cyclical="true" epicsMinRed="0" epicsMaxRed="90000" balMinGreen="10000" balMaxGreen="90000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="9" cyclical="true" epicsMinRed="0" epicsMaxRed="90000" balMinGreen="12000" balMaxGreen="90000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="10" cyclical="true" epicsMinRed="0" epicsMaxRed="90000" balMinGreen="12000" balMaxGreen="90000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="11" cyclical="true" epicsMinRed="0" epicsMaxRed="90000" balMinGreen="8000" balMaxGreen="90000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
      </sgs>
    </stageProg>
    <stageProg id="2" cycletime="90000" switchpoint="0" offset="23000" intergreens="1" fitness="0.000000" vehicleCount="0" weightBalance="1" weightStops="0" balanceFixedTimeControl="true" name="Stage 1, Stage 2, Stage 3, Stage 4">
      <interstages>
        <interstage display="1" begin="0" />
        <interstage display="5" begin="31000" />
        <interstage display="9" begin="65000" />
        <interstage display="10" begin="77000" />
      </interstages>
      <BALANCEInterstages>
        <BALANCEInterstage balIstId="1" earliestStart="0" originalStart="0" latestStart="89000" notes="" />
        <BALANCEInterstage balIstId="5" earliestStart="0" originalStart="31000" latestStart="89000" notes="" />
        <BALANCEInterstage balIstId="9" earliestStart="0" originalStart="65000" latestStart="89000" notes="" />
        <BALANCEInterstage balIstId="10" earliestStart="0" originalStart="77000" latestStart="89000" notes="" />
      </BALANCEInterstages>
      <activeInterstages>
        <activeInterstage actIstId="1" />
        <activeInterstage actIstId="2" />
        <activeInterstage actIstId="3" />
        <activeInterstage actIstId="4" />
        <activeInterstage actIstId="5" />
        <activeInterstage actIstId="6" />
        <activeInterstage actIstId="7" />
        <activeInterstage actIstId="8" />
        <activeInterstage actIstId="9" />
        <activeInterstage actIstId="10" />
        <activeInterstage actIstId="11" />
        <activeInterstage actIstId="12" />
      </activeInterstages>
      <EPICSStageParameters>
        <EPICSStageParameter stageId="1" earliestStart="0" latestEnd="90000" minimumLength="0" maximumLength="125000" preferredStart="84000" preferredEnd="0" costPreferred="0" costNonPreferred="5" notes="" />
        <EPICSStageParameter stageId="2" earliestStart="0" latestEnd="90000" minimumLength="0" maximumLength="125000" preferredStart="3000" preferredEnd="31000" costPreferred="0" costNonPreferred="5" notes="" />
        <EPICSStageParameter stageId="3" earliestStart="0" latestEnd="90000" minimumLength="0" maximumLength="125000" preferredStart="40000" preferredEnd="65000" costPreferred="0" costNonPreferred="5" notes="" />
        <EPICSStageParameter stageId="4" earliestStart="0" latestEnd="90000" minimumLength="0" maximumLength="125000" preferredStart="68000" preferredEnd="77000" costPreferred="0" costNonPreferred="5" notes="" />
      </EPICSStageParameters>
      <sgs>
        <sg sg_id="1" cyclical="true" epicsMinRed="0" epicsMaxRed="90000" balMinGreen="5000" balMaxGreen="90000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="2" cyclical="true" epicsMinRed="0" epicsMaxRed="90000" balMinGreen="5000" balMaxGreen="90000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="3" cyclical="true" epicsMinRed="0" epicsMaxRed="90000" balMinGreen="5000" balMaxGreen="90000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="4" cyclical="true" epicsMinRed="0" epicsMaxRed="90000" balMinGreen="5000" balMaxGreen="90000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="5" cyclical="true" epicsMinRed="0" epicsMaxRed="90000" balMinGreen="5000" balMaxGreen="90000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="6" cyclical="true" epicsMinRed="0" epicsMaxRed="90000" balMinGreen="8000" balMaxGreen="90000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="7" cyclical="true" epicsMinRed="0" epicsMaxRed="90000" balMinGreen="10000" balMaxGreen="90000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="8" cyclical="true" epicsMinRed="0" epicsMaxRed="90000" balMinGreen="10000" balMaxGreen="90000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="9" cyclical="true" epicsMinRed="0" epicsMaxRed="90000" balMinGreen="12000" balMaxGreen="90000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="10" cyclical="true" epicsMinRed="0" epicsMaxRed="90000" balMinGreen="12000" balMaxGreen="90000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
        <sg sg_id="11" cyclical="true" epicsMinRed="0" epicsMaxRed="90000" balMinGreen="8000" balMaxGreen="90000" balWeightDelay="1.000000" balWeightQueue="10.000000" balWeightStops="50.000000" notes="" />
      </sgs>
    </stageProg>
  </stageProgs>
  <dailyProgLists />
</sc>