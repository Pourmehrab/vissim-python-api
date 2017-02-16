<?xml version="1.0" encoding="UTF-8"?>
<sc version="201503" id="1" name="" frequency="1" steps="0" defaultIntergreenMatrix="0" EPICSTimeHorizon="100000" EPICSLogLevel="3" interstagesUsingMinDurations="true" checkSum="2164968320">
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
    <display id="6" name="Flashing Amber" state="FLASHING_AMBER">
      <patterns>
        <pattern pattern="FRAME" color="#CCCC00" isBold="true" />
        <pattern pattern="FLASHING" color="#CCCC00" isBold="true" />
      </patterns>
    </display>
    <display id="7" name="Off" state="OFF">
      <patterns>
        <pattern pattern="MINUS" color="#000000" isBold="true" />
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
    <signalsequence id="13" name="Flashing Amber-Off">
      <state display="6" isFixedDuration="false" isClosed="true" defaultDuration="1000" />
      <state display="7" isFixedDuration="false" isClosed="false" defaultDuration="1000" />
    </signalsequence>
  </signalsequences>
  <sgs>
    <sg id="1" name="Pedestrians" defaultSignalSequence="3" underEPICSControl="false">
      <defaultDurations>
        <defaultDuration display="3" duration="10000" />
        <defaultDuration display="1" duration="5000" />
        <defaultDuration display="2" duration="1000" />
        <defaultDuration display="4" duration="3000" />
      </defaultDurations>
      <EPICSTrafficDemands />
    </sg>
    <sg id="2" name="Left Turning Vehicles" defaultSignalSequence="3" underEPICSControl="false">
      <defaultDurations>
        <defaultDuration display="1" duration="1000" />
        <defaultDuration display="2" duration="1000" />
        <defaultDuration display="3" duration="5000" />
        <defaultDuration display="4" duration="3000" />
      </defaultDurations>
      <EPICSTrafficDemands />
    </sg>
    <sg id="11" name="Flashing Amber" defaultSignalSequence="13" underEPICSControl="false">
      <defaultDurations>
        <defaultDuration display="6" duration="1000" />
        <defaultDuration display="7" duration="1000" />
      </defaultDurations>
      <EPICSTrafficDemands />
    </sg>
    <sg id="21" name="Pedestrians" defaultSignalSequence="4" underEPICSControl="false">
      <defaultDurations>
        <defaultDuration display="1" duration="1000" />
        <defaultDuration display="3" duration="6000" />
      </defaultDurations>
      <EPICSTrafficDemands />
    </sg>
  </sgs>
  <dets />
  <callingPoints />
  <callingPointPairs />
  <intergreenmatrices />
  <progs>
    <prog id="1" cycletime="60000" switchpoint="0" offset="0" intergreens="0" fitness="0.000000" vehicleCount="0" name="Signal Programs">
      <sgs>
        <sg sg_id="1" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="5000" />
            <cmd display="1" begin="43000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="2" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="47000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="11" signal_sequence="13">
          <cmds>
            <cmd display="6" begin="2000" />
            <cmd display="7" begin="27000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="21" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="2000" />
            <cmd display="1" begin="20000" />
          </cmds>
          <fixedstates />
        </sg>
      </sgs>
    </prog>
  </progs>
  <stages />
  <interstageProgs />
  <stageProgs />
  <dailyProgLists />
</sc>