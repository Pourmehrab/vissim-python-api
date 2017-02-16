<?xml version="1.0" encoding="UTF-8"?>
<sc id="1" name="My SC" frequency="1" defaultIntergreenMatrix="1">
  <notes>VISSIG example</notes>
  <sgs>
    <sg id="1" name="N RS" defaultSignalSequence="7">
      <notes>Main street</notes>
      <defaultDurations />
    </sg>
    <sg id="2" name="N L" defaultSignalSequence="7">
      <notes>Left turn on main street</notes>
      <defaultDurations />
    </sg>
    <sg id="3" name="E RSL" defaultSignalSequence="7">
      <defaultDurations />
    </sg>
    <sg id="4" name="S RS" defaultSignalSequence="7">
      <notes>Main street</notes>
      <defaultDurations />
    </sg>
    <sg id="5" name="S L" defaultSignalSequence="7">
      <notes>Left turn on main street</notes>
      <defaultDurations />
    </sg>
    <sg id="6" name="W RSL" defaultSignalSequence="7">
      <defaultDurations />
    </sg>
    <sg id="11" name="N P" defaultSignalSequence="4">
      <notes>Pedestrian North</notes>
      <defaultDurations />
    </sg>
    <sg id="12" name="E P" defaultSignalSequence="4">
      <notes>Pedestrian East</notes>
      <defaultDurations />
    </sg>
    <sg id="13" name="S P" defaultSignalSequence="4">
      <notes>Pedestrian South</notes>
      <defaultDurations />
    </sg>
    <sg id="14" name="W P" defaultSignalSequence="4">
      <notes>Pedestrian West</notes>
      <defaultDurations />
    </sg>
  </sgs>
  <intergreenmatrices>
    <intergreenmatrix id="1" name="Used intergreen matrix">
      <intergreen clearingsg="1" enteringsg="11" value="10000" />
      <intergreen clearingsg="1" enteringsg="13" value="10000" />
      <intergreen clearingsg="1" enteringsg="3" value="5000" />
      <intergreen clearingsg="1" enteringsg="6" value="5000" />
      <intergreen clearingsg="2" enteringsg="3" value="5000" />
      <intergreen clearingsg="2" enteringsg="6" value="5000" />
      <intergreen clearingsg="2" enteringsg="11" value="10000" />
      <intergreen clearingsg="2" enteringsg="13" value="10000" />
      <intergreen clearingsg="4" enteringsg="3" value="5000" />
      <intergreen clearingsg="5" enteringsg="3" value="5000" />
      <intergreen clearingsg="5" enteringsg="6" value="5000" />
      <intergreen clearingsg="5" enteringsg="11" value="10000" />
      <intergreen clearingsg="5" enteringsg="13" value="10000" />
      <intergreen clearingsg="3" enteringsg="1" value="5000" />
      <intergreen clearingsg="6" enteringsg="1" value="5000" />
      <intergreen clearingsg="11" enteringsg="1" value="10000" />
      <intergreen clearingsg="13" enteringsg="1" value="10000" />
      <intergreen clearingsg="3" enteringsg="2" value="5000" />
      <intergreen clearingsg="6" enteringsg="2" value="5000" />
      <intergreen clearingsg="11" enteringsg="2" value="10000" />
      <intergreen clearingsg="13" enteringsg="2" value="10000" />
      <intergreen clearingsg="3" enteringsg="12" value="10000" />
      <intergreen clearingsg="3" enteringsg="14" value="10000" />
      <intergreen clearingsg="3" enteringsg="4" value="5000" />
      <intergreen clearingsg="3" enteringsg="5" value="5000" />
      <intergreen clearingsg="6" enteringsg="4" value="5000" />
      <intergreen clearingsg="6" enteringsg="5" value="5000" />
      <intergreen clearingsg="6" enteringsg="12" value="10000" />
      <intergreen clearingsg="6" enteringsg="14" value="10000" />
      <intergreen clearingsg="11" enteringsg="4" value="10000" />
      <intergreen clearingsg="11" enteringsg="5" value="10000" />
      <intergreen clearingsg="13" enteringsg="4" value="10000" />
      <intergreen clearingsg="13" enteringsg="5" value="10000" />
      <intergreen clearingsg="12" enteringsg="3" value="10000" />
      <intergreen clearingsg="14" enteringsg="3" value="10000" />
      <intergreen clearingsg="12" enteringsg="6" value="10000" />
      <intergreen clearingsg="14" enteringsg="6" value="10000" />
      <intergreen clearingsg="4" enteringsg="6" value="0" />
      <intergreen clearingsg="4" enteringsg="11" value="5000" />
      <intergreen clearingsg="4" enteringsg="13" value="5000" />
    </intergreenmatrix>
    <intergreenmatrix id="2" name="Conflict between 3 and 6">
      <intergreen clearingsg="1" enteringsg="11" value="10000" />
      <intergreen clearingsg="1" enteringsg="13" value="10000" />
      <intergreen clearingsg="1" enteringsg="3" value="5000" />
      <intergreen clearingsg="1" enteringsg="6" value="5000" />
      <intergreen clearingsg="2" enteringsg="3" value="5000" />
      <intergreen clearingsg="2" enteringsg="6" value="5000" />
      <intergreen clearingsg="2" enteringsg="11" value="10000" />
      <intergreen clearingsg="2" enteringsg="13" value="10000" />
      <intergreen clearingsg="4" enteringsg="3" value="5000" />
      <intergreen clearingsg="5" enteringsg="3" value="5000" />
      <intergreen clearingsg="5" enteringsg="6" value="5000" />
      <intergreen clearingsg="5" enteringsg="11" value="10000" />
      <intergreen clearingsg="5" enteringsg="13" value="10000" />
      <intergreen clearingsg="3" enteringsg="1" value="5000" />
      <intergreen clearingsg="6" enteringsg="1" value="5000" />
      <intergreen clearingsg="11" enteringsg="1" value="10000" />
      <intergreen clearingsg="13" enteringsg="1" value="10000" />
      <intergreen clearingsg="3" enteringsg="2" value="5000" />
      <intergreen clearingsg="6" enteringsg="2" value="5000" />
      <intergreen clearingsg="11" enteringsg="2" value="10000" />
      <intergreen clearingsg="13" enteringsg="2" value="10000" />
      <intergreen clearingsg="3" enteringsg="12" value="10000" />
      <intergreen clearingsg="3" enteringsg="14" value="10000" />
      <intergreen clearingsg="3" enteringsg="4" value="5000" />
      <intergreen clearingsg="3" enteringsg="5" value="5000" />
      <intergreen clearingsg="6" enteringsg="4" value="5000" />
      <intergreen clearingsg="6" enteringsg="5" value="5000" />
      <intergreen clearingsg="6" enteringsg="12" value="10000" />
      <intergreen clearingsg="6" enteringsg="14" value="10000" />
      <intergreen clearingsg="11" enteringsg="4" value="10000" />
      <intergreen clearingsg="11" enteringsg="5" value="10000" />
      <intergreen clearingsg="13" enteringsg="4" value="10000" />
      <intergreen clearingsg="13" enteringsg="5" value="10000" />
      <intergreen clearingsg="12" enteringsg="3" value="10000" />
      <intergreen clearingsg="14" enteringsg="3" value="10000" />
      <intergreen clearingsg="12" enteringsg="6" value="10000" />
      <intergreen clearingsg="14" enteringsg="6" value="10000" />
      <intergreen clearingsg="4" enteringsg="6" value="0" />
      <intergreen clearingsg="4" enteringsg="11" value="5000" />
      <intergreen clearingsg="4" enteringsg="13" value="5000" />
      <intergreen clearingsg="3" enteringsg="6" value="5000" />
      <intergreen clearingsg="6" enteringsg="3" value="5000" />
    </intergreenmatrix>
  </intergreenmatrices>
  <progs>
    <prog id="1" cycletime="120000" switchpoint="0" offset="21000" intergreens="1" name="Signal program used in VISUM">
      <sgs>
        <sg sg_id="1" signal_sequence="7">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="43000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="2" signal_sequence="7">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="63000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="3" signal_sequence="7">
          <cmds>
            <cmd display="3" begin="65000" />
            <cmd display="1" begin="118000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="4" signal_sequence="7">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="43000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="5" signal_sequence="7">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="63000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="6" signal_sequence="7">
          <cmds>
            <cmd display="3" begin="65000" />
            <cmd display="1" begin="118000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="11" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="70000" />
            <cmd display="1" begin="110000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="12" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="5000" />
            <cmd display="1" begin="35000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="13" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="70000" />
            <cmd display="1" begin="110000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="14" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="5000" />
            <cmd display="1" begin="35000" />
          </cmds>
          <fixedstates />
        </sg>
      </sgs>
    </prog>
  </progs>
  <stages>
    <stage id="1" name="N_S">
      <activations>
        <activation sg_id="1" activation="ON" />
        <activation sg_id="2" activation="ON" />
        <activation sg_id="3" activation="OFF" />
        <activation sg_id="4" activation="ON" />
        <activation sg_id="5" activation="ON" />
        <activation sg_id="6" activation="OFF" />
        <activation sg_id="11" activation="OFF" />
        <activation sg_id="12" activation="ON" />
        <activation sg_id="13" activation="OFF" />
        <activation sg_id="14" activation="ON" />
      </activations>
    </stage>
    <stage id="2" name="N_S_L">
      <activations>
        <activation sg_id="1" activation="UNKNOWN" />
        <activation sg_id="2" activation="ON" />
        <activation sg_id="3" activation="OFF" />
        <activation sg_id="4" activation="UNKNOWN" />
        <activation sg_id="5" activation="ON" />
        <activation sg_id="6" activation="OFF" />
        <activation sg_id="11" activation="OFF" />
        <activation sg_id="12" activation="OFF" />
        <activation sg_id="13" activation="OFF" />
        <activation sg_id="14" activation="OFF" />
      </activations>
    </stage>
    <stage id="3" name="E_W">
      <activations>
        <activation sg_id="1" activation="OFF" />
        <activation sg_id="2" activation="OFF" />
        <activation sg_id="3" activation="ON" />
        <activation sg_id="4" activation="OFF" />
        <activation sg_id="5" activation="OFF" />
        <activation sg_id="6" activation="ON" />
        <activation sg_id="11" activation="ON" />
        <activation sg_id="12" activation="OFF" />
        <activation sg_id="13" activation="ON" />
        <activation sg_id="14" activation="OFF" />
      </activations>
    </stage>
  </stages>
  <interstageProgs>
    <interstageProg id="1" cycletime="3000" intergreens="1" fromStage="1" toStage="2" name="N_S (1)->N_S_L (2)">
      <sgs>
        <sg sg_id="1" signal_sequence="7">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="2" signal_sequence="2">
          <cmds>
            <cmd display="3" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="3" signal_sequence="1">
          <cmds>
            <cmd display="1" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="4" signal_sequence="7">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="5" signal_sequence="2">
          <cmds>
            <cmd display="3" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="6" signal_sequence="1">
          <cmds>
            <cmd display="1" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="11" signal_sequence="1">
          <cmds>
            <cmd display="1" begin="0" />
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
        <sg sg_id="13" signal_sequence="1">
          <cmds>
            <cmd display="1" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="14" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates />
        </sg>
      </sgs>
    </interstageProg>
    <interstageProg id="2" cycletime="10000" intergreens="1" fromStage="2" toStage="3" name="N_S_L (2)->E_W (3)">
      <sgs>
        <sg sg_id="1" signal_sequence="1">
          <cmds>
            <cmd display="1" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="2" signal_sequence="7">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="3" signal_sequence="7">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="5000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="4" signal_sequence="1">
          <cmds>
            <cmd display="1" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="5" signal_sequence="7">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="6" signal_sequence="7">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="5000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="11" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="10000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="12" signal_sequence="1">
          <cmds>
            <cmd display="1" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="13" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="10000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="14" signal_sequence="1">
          <cmds>
            <cmd display="1" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
      </sgs>
    </interstageProg>
    <interstageProg id="3" cycletime="10000" intergreens="1" fromStage="3" toStage="1" name="E_W (3)->N_S (1)">
      <sgs>
        <sg sg_id="1" signal_sequence="7">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="10000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="2" signal_sequence="7">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="10000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="3" signal_sequence="7">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="4" signal_sequence="7">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="10000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="5" signal_sequence="7">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="10000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="6" signal_sequence="7">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
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
            <cmd display="3" begin="10000" />
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
            <cmd display="1" begin="0" />
            <cmd display="3" begin="10000" />
          </cmds>
          <fixedstates />
        </sg>
      </sgs>
    </interstageProg>
    <interstageProg id="4" cycletime="3000" intergreens="1" fromStage="1" toStage="2" name="man_N_S (1)->N_S_L (2)">
      <sgs>
        <sg sg_id="1" signal_sequence="7">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="2" signal_sequence="2">
          <cmds>
            <cmd display="3" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="3" signal_sequence="1">
          <cmds>
            <cmd display="1" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="4" signal_sequence="7">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="5" signal_sequence="2">
          <cmds>
            <cmd display="3" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="6" signal_sequence="1">
          <cmds>
            <cmd display="1" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="11" signal_sequence="1">
          <cmds>
            <cmd display="1" begin="0" />
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
        <sg sg_id="13" signal_sequence="1">
          <cmds>
            <cmd display="1" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="14" signal_sequence="4">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates />
        </sg>
      </sgs>
    </interstageProg>
    <interstageProg id="5" cycletime="10000" intergreens="1" fromStage="2" toStage="3" name="man_N_S_L (2)->E_W (3)">
      <sgs>
        <sg sg_id="1" signal_sequence="1">
          <cmds>
            <cmd display="1" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="2" signal_sequence="7">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="3" signal_sequence="7">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="5000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="4" signal_sequence="1">
          <cmds>
            <cmd display="1" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="5" signal_sequence="7">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="3000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="6" signal_sequence="7">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="5000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="11" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="10000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="12" signal_sequence="1">
          <cmds>
            <cmd display="1" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="13" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="10000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="14" signal_sequence="1">
          <cmds>
            <cmd display="1" begin="0" />
          </cmds>
          <fixedstates />
        </sg>
      </sgs>
    </interstageProg>
    <interstageProg id="6" cycletime="15000" intergreens="1" fromStage="3" toStage="1" name="man_E_W (3)->N_S (1)">
      <sgs>
        <sg sg_id="1" signal_sequence="7">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="10000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="2" signal_sequence="7">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="10000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="3" signal_sequence="7">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="8000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
        </sg>
        <sg sg_id="4" signal_sequence="7">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="10000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="5" signal_sequence="7">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="10000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="6" signal_sequence="7">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="8000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
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
            <cmd display="3" begin="15000" />
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
            <cmd display="1" begin="0" />
            <cmd display="3" begin="15000" />
          </cmds>
          <fixedstates />
        </sg>
      </sgs>
    </interstageProg>
  </interstageProgs>
  <stageProgs>
    <stageProg id="2" cycletime="120000" switchpoint="0" offset="0" intergreens="1" name="Created automatically">
      <interstages>
        <interstage display="1" begin="40000" />
        <interstage display="2" begin="60000" />
        <interstage display="3" begin="110000" />
      </interstages>
    </stageProg>
    <stageProg id="3" cycletime="120000" switchpoint="0" offset="0" intergreens="1" name="Created manually">
      <interstages>
        <interstage display="4" begin="40000" />
        <interstage display="5" begin="60000" />
        <interstage display="6" begin="110000" />
      </interstages>
    </stageProg>
  </stageProgs>
</sc>