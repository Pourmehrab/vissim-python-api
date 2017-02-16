<?xml version="1.0" encoding="UTF-8"?>
<sc id="1" name="FSA" frequency="1" defaultIntergreenMatrix="0">
  <sgs>
    <sg id="1" name="A" defaultSignalSequence="3">
      <defaultDurations>
        <defaultDuration display="2" duration="1000" />
        <defaultDuration display="4" duration="3000" />
        <defaultDuration display="1" duration="0" />
        <defaultDuration display="3" duration="0" />
      </defaultDurations>
    </sg>
    <sg id="2" name="B" defaultSignalSequence="4">
      <defaultDurations>
        <defaultDuration display="1" duration="0" />
        <defaultDuration display="3" duration="0" />
      </defaultDurations>
    </sg>
  </sgs>
  <intergreenmatrices />
  <progs>
    <prog id="1" cycletime="30000" switchpoint="0" offset="0" intergreens="0" name="Signal program">
      <sgs>
        <sg sg_id="1" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="5000" />
            <cmd display="1" begin="20000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="2" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="22000" />
            <cmd display="1" begin="28000" />
          </cmds>
          <fixedstates />
        </sg>
      </sgs>
    </prog>
  </progs>
  <stages />
  <interstageProgs />
  <stageProgs />
</sc>