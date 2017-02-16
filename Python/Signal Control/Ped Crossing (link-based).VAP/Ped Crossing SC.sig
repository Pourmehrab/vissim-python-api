<?xml version="1.0" encoding="UTF-8"?>
<sc id="1" name="" frequency="1" steps="0" defaultIntergreenMatrix="1">
  <sgs>
    <sg id="1" name="A" defaultSignalSequence="3">
      <defaultDurations>
        <defaultDuration display="3" duration="7000" />
      </defaultDurations>
    </sg>
    <sg id="2" name="B" defaultSignalSequence="4">
      <defaultDurations>
        <defaultDuration display="3" duration="6000" />
      </defaultDurations>
    </sg>
  </sgs>
  <intergreenmatrices>
    <intergreenmatrix id="1" name="Zwischenzeitmatrix 1">
      <intergreen clearingsg="1" enteringsg="2" value="5000" />
      <intergreen clearingsg="2" enteringsg="1" value="8000" />
    </intergreenmatrix>
  </intergreenmatrices>
  <progs />
  <stages>
    <stage id="1" name="Phase 1" isPseudoStage="false">
      <activations>
        <activation sg_id="1" activation="ON" />
        <activation sg_id="2" activation="OFF" />
      </activations>
    </stage>
    <stage id="2" name="Phase 2" isPseudoStage="false">
      <activations>
        <activation sg_id="1" activation="OFF" />
        <activation sg_id="2" activation="ON" />
      </activations>
    </stage>
  </stages>
  <interstageProgs>
    <interstageProg id="1" cycletime="11000" intergreens="1" fromStage="1" toStage="2" name="1: Phase 1->2: Phase 2">
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
        <sg sg_id="2" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="5000" />
          </cmds>
          <fixedstates />
        </sg>
      </sgs>
    </interstageProg>
    <interstageProg id="2" cycletime="15000" intergreens="1" fromStage="2" toStage="1" name="2: Phase 2->1: Phase 1">
      <sgs>
        <sg sg_id="1" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="8000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="2" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
      </sgs>
    </interstageProg>
  </interstageProgs>
  <stageProgs>
    <stageProg id="1" cycletime="72000" switchpoint="0" offset="0" intergreens="1" fitness="0.000000" vehicleCount="0" name="Festzeitsteuerung 72">
      <interstages>
        <interstage display="1" begin="15000" />
        <interstage display="2" begin="30000" />
      </interstages>
    </stageProg>
  </stageProgs>
  <dailyProgLists />
</sc>