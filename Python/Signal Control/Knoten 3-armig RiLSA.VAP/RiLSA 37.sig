<?xml version="1.0" encoding="UTF-8"?>
<sc id="2" name="" frequency="1" steps="0" defaultIntergreenMatrix="1">
  <sgs>
    <sg id="1" name="K1" defaultSignalSequence="3">
      <defaultDurations>
        <defaultDuration display="3" duration="10000" />
      </defaultDurations>
    </sg>
    <sg id="2" name="K2" defaultSignalSequence="3">
      <defaultDurations />
    </sg>
    <sg id="3" name="K3" defaultSignalSequence="12">
      <defaultDurations />
    </sg>
    <sg id="4" name="K4" defaultSignalSequence="3">
      <defaultDurations />
    </sg>
    <sg id="5" name="K5" defaultSignalSequence="3">
      <defaultDurations>
        <defaultDuration display="3" duration="10000" />
      </defaultDurations>
    </sg>
    <sg id="6" name="F1" defaultSignalSequence="4">
      <defaultDurations />
    </sg>
    <sg id="7" name="F2" defaultSignalSequence="4">
      <defaultDurations>
        <defaultDuration display="3" duration="7000" />
      </defaultDurations>
    </sg>
    <sg id="8" name="F3" defaultSignalSequence="4">
      <defaultDurations>
        <defaultDuration display="3" duration="7000" />
      </defaultDurations>
    </sg>
  </sgs>
  <intergreenmatrices>
    <intergreenmatrix id="1" name="Zwischenzeitmatrix">
      <intergreen clearingsg="1" enteringsg="4" value="4000" />
      <intergreen clearingsg="2" enteringsg="4" value="5000" />
      <intergreen clearingsg="2" enteringsg="5" value="5000" />
      <intergreen clearingsg="3" enteringsg="5" value="4000" />
      <intergreen clearingsg="4" enteringsg="5" value="5000" />
      <intergreen clearingsg="2" enteringsg="6" value="6000" />
      <intergreen clearingsg="3" enteringsg="6" value="4000" />
      <intergreen clearingsg="4" enteringsg="6" value="4000" />
      <intergreen clearingsg="5" enteringsg="7" value="4000" />
      <intergreen clearingsg="1" enteringsg="8" value="6000" />
      <intergreen clearingsg="4" enteringsg="1" value="5000" />
      <intergreen clearingsg="4" enteringsg="2" value="5000" />
      <intergreen clearingsg="5" enteringsg="2" value="5000" />
      <intergreen clearingsg="6" enteringsg="2" value="9000" />
      <intergreen clearingsg="5" enteringsg="3" value="6000" />
      <intergreen clearingsg="6" enteringsg="3" value="10000" />
      <intergreen clearingsg="6" enteringsg="4" value="10000" />
      <intergreen clearingsg="5" enteringsg="4" value="6000" />
      <intergreen clearingsg="7" enteringsg="5" value="4000" />
      <intergreen clearingsg="8" enteringsg="1" value="2000" />
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
        <activation sg_id="5" activation="ON" />
        <activation sg_id="6" activation="ON" />
        <activation sg_id="7" activation="OFF" />
        <activation sg_id="8" activation="OFF" />
      </activations>
    </stage>
    <stage id="2" name="Phase 2" isPseudoStage="false">
      <activations>
        <activation sg_id="1" activation="ON" />
        <activation sg_id="2" activation="ON" />
        <activation sg_id="3" activation="ON" />
        <activation sg_id="4" activation="OFF" />
        <activation sg_id="5" activation="OFF" />
        <activation sg_id="6" activation="OFF" />
        <activation sg_id="7" activation="OFF" />
        <activation sg_id="8" activation="OFF" />
      </activations>
    </stage>
    <stage id="3" name="Phase 3" isPseudoStage="false">
      <activations>
        <activation sg_id="1" activation="OFF" />
        <activation sg_id="2" activation="OFF" />
        <activation sg_id="3" activation="OFF" />
        <activation sg_id="4" activation="ON" />
        <activation sg_id="5" activation="OFF" />
        <activation sg_id="6" activation="OFF" />
        <activation sg_id="7" activation="ON" />
        <activation sg_id="8" activation="ON" />
      </activations>
    </stage>
  </stages>
  <interstageProgs>
    <interstageProg id="1" cycletime="10000" intergreens="1" fromStage="1" toStage="2" name="1: Phase 1->2: Phase 2">
      <sgs>
        <sg sg_id="1" signal_sequence="2">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="2" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="9000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="3" signal_sequence="12">
          <cmds>
            <cmd display="7" begin="0" />
            <cmd display="3" begin="10000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="4" signal_sequence="1">
          <cmds />
          <fixedstates />
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
        <sg sg_id="6" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="0" />
          </cmds>
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
      </sgs>
    </interstageProg>
    <interstageProg id="2" cycletime="10000" intergreens="1" fromStage="1" toStage="3" name="1: Phase 1->3: Phase 3">
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
        <sg sg_id="3" signal_sequence="9">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="4" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="10000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
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
            <cmd display="3" begin="6000" />
          </cmds>
          <fixedstates />
        </sg>
      </sgs>
    </interstageProg>
    <interstageProg id="3" cycletime="6000" intergreens="1" fromStage="2" toStage="1" name="2: Phase 2->1: Phase 1">
      <sgs>
        <sg sg_id="1" signal_sequence="2">
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
        <sg sg_id="3" signal_sequence="12">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="7" begin="1000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="4" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="5" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="5000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="6" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="6000" />
          </cmds>
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
      </sgs>
    </interstageProg>
    <interstageProg id="4" cycletime="6000" intergreens="1" fromStage="2" toStage="3" name="2: Phase 2->3: Phase 3">
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
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="3" signal_sequence="12">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="7" begin="3000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="4" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="5000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="5" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="6" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="7" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="8" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="6000" />
          </cmds>
          <fixedstates />
        </sg>
      </sgs>
    </interstageProg>
    <interstageProg id="5" cycletime="5000" intergreens="1" fromStage="3" toStage="1" name="3: Phase 3->1: Phase 1">
      <sgs>
        <sg sg_id="1" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="5000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="2" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="3" signal_sequence="9">
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
            <cmd display="1" begin="0" />
            <cmd display="3" begin="5000" />
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
            <cmd display="1" begin="1000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="8" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates />
        </sg>
      </sgs>
    </interstageProg>
    <interstageProg id="6" cycletime="5000" intergreens="1" fromStage="3" toStage="2" name="3: Phase 3->2: Phase 2">
      <sgs>
        <sg sg_id="1" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="5000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="2" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="5000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="3" signal_sequence="12">
          <cmds>
            <cmd display="7" begin="0" />
            <cmd display="3" begin="1000" />
          </cmds>
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
        <sg sg_id="5" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="6" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="7" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="5000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="8" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates />
        </sg>
      </sgs>
    </interstageProg>
  </interstageProgs>
  <stageProgs>
    <stageProg id="1" cycletime="60000" switchpoint="0" offset="0" intergreens="1" fitness="0.000000" vehicleCount="0" name="Phase 1, Phase 2, Phase 3">
      <interstages>
        <interstage display="1" begin="10000" />
        <interstage display="4" begin="30000" />
        <interstage display="5" begin="45000" />
      </interstages>
    </stageProg>
  </stageProgs>
  <dailyProgLists />
</sc>