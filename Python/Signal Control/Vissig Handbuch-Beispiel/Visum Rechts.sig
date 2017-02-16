<?xml version="1.0" encoding="UTF-8"?>
<sc id="1" name="Meine LSA" frequency="1" defaultIntergreenMatrix="1">
  <notes>VISSIG Beispiel</notes>
  <sgs>
    <sg id="1" name="N RG" defaultSignalSequence="3">
      <notes>Hauptstraße</notes>
      <defaultDurations />
    </sg>
    <sg id="2" name="N L" defaultSignalSequence="3">
      <notes>Linksabbieger aus der Hauptstraße</notes>
      <defaultDurations />
    </sg>
    <sg id="3" name="O RGL" defaultSignalSequence="3">
      <notes>Nebenstraße</notes>
      <defaultDurations />
    </sg>
    <sg id="4" name="S RG" defaultSignalSequence="3">
      <notes>Hauptstraße</notes>
      <defaultDurations />
    </sg>
    <sg id="5" name="S L" defaultSignalSequence="3">
      <notes>Linksabbieger aus der Hauptstraße</notes>
      <defaultDurations />
    </sg>
    <sg id="6" name="W RGL" defaultSignalSequence="3">
      <notes>Nebenstraße</notes>
      <defaultDurations />
    </sg>
    <sg id="11" name="N FG" defaultSignalSequence="4">
      <notes>Fußgänger im Norden</notes>
      <defaultDurations />
    </sg>
    <sg id="12" name="O FG" defaultSignalSequence="4">
      <notes>Fußgänger im Osten</notes>
      <defaultDurations />
    </sg>
    <sg id="13" name="S FG" defaultSignalSequence="4">
      <notes>Fußgänger im Süden</notes>
      <defaultDurations />
    </sg>
    <sg id="14" name="W FG" defaultSignalSequence="4">
      <notes>Fußgänger im Westen</notes>
      <defaultDurations />
    </sg>
  </sgs>
  <intergreenmatrices>
    <intergreenmatrix id="1" name="Verwendete Zwischenzeitmatrix">
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
    <intergreenmatrix id="2" name="Zusätzliche Feindlichkeit zwischen 3 und 6">
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
    <prog id="1" cycletime="120000" switchpoint="0" offset="21000" intergreens="1" name="Signalprogramm wie in VISUM">
      <sgs>
        <sg sg_id="1" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="43000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="2" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="63000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="3" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="65000" />
            <cmd display="1" begin="118000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="4" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="43000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="5" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="63000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="6" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="65000" />
            <cmd display="1" begin="118000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
            <fixedstate display="2" duration="1000" />
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
    <stage id="1" name="Haupt">
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
    <stage id="2" name="Haupt Links">
      <activations>
        <activation sg_id="1" activation="OFF" />
        <activation sg_id="2" activation="ON" />
        <activation sg_id="3" activation="OFF" />
        <activation sg_id="4" activation="OFF" />
        <activation sg_id="5" activation="ON" />
        <activation sg_id="6" activation="OFF" />
        <activation sg_id="11" activation="OFF" />
        <activation sg_id="12" activation="OFF" />
        <activation sg_id="13" activation="OFF" />
        <activation sg_id="14" activation="OFF" />
      </activations>
    </stage>
    <stage id="3" name="Neben">
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
    <interstageProg id="1" cycletime="3000" intergreens="1" fromStage="1" toStage="2" name="Haupt (1)->Haupt Links (2)">
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
        <sg sg_id="2" signal_sequence="2">
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
        <sg sg_id="5" signal_sequence="2">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="6" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="11" signal_sequence="1">
          <cmds />
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
          <cmds />
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
    <interstageProg id="2" cycletime="15000" intergreens="1" fromStage="2" toStage="3" name="Haupt Links (2)->Neben (3)">
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
            <cmd display="3" begin="5000" />
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
        <sg sg_id="6" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="5000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="11" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="10000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="12" signal_sequence="1">
          <cmds />
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
          <cmds />
          <fixedstates />
        </sg>
      </sgs>
    </interstageProg>
    <interstageProg id="3" cycletime="15000" intergreens="1" fromStage="3" toStage="1" name="Neben (3)->Haupt (1)">
      <sgs>
        <sg sg_id="1" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="10000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="2" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="10000" />
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
            <cmd display="1" begin="0" />
            <cmd display="3" begin="10000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="6" signal_sequence="3">
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
    <interstageProg id="4" cycletime="3000" intergreens="1" fromStage="1" toStage="2" name="man_Haupt (1)->Haupt Links (2)">
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
        <sg sg_id="2" signal_sequence="2">
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
        <sg sg_id="5" signal_sequence="2">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="6" signal_sequence="1">
          <cmds />
          <fixedstates />
        </sg>
        <sg sg_id="11" signal_sequence="1">
          <cmds />
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
          <cmds />
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
    <interstageProg id="5" cycletime="15000" intergreens="1" fromStage="2" toStage="3" name="man_Haupt Links (2)->Neben (3)">
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
            <cmd display="3" begin="5000" />
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
        <sg sg_id="6" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="5000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="11" signal_sequence="4">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="10000" />
          </cmds>
          <fixedstates />
        </sg>
        <sg sg_id="12" signal_sequence="1">
          <cmds />
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
          <cmds />
          <fixedstates />
        </sg>
      </sgs>
    </interstageProg>
    <interstageProg id="6" cycletime="15000" intergreens="1" fromStage="3" toStage="1" name="man_Neben (3)->Haupt (1)">
      <sgs>
        <sg sg_id="1" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="10000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="2" signal_sequence="3">
          <cmds>
            <cmd display="1" begin="0" />
            <cmd display="3" begin="10000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="3" signal_sequence="3">
          <cmds>
            <cmd display="3" begin="0" />
            <cmd display="1" begin="8000" />
          </cmds>
          <fixedstates>
            <fixedstate display="4" duration="3000" />
          </fixedstates>
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
            <cmd display="1" begin="0" />
            <cmd display="3" begin="10000" />
          </cmds>
          <fixedstates>
            <fixedstate display="2" duration="1000" />
          </fixedstates>
        </sg>
        <sg sg_id="6" signal_sequence="3">
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
    <stageProg id="2" cycletime="120000" switchpoint="0" offset="0" intergreens="1" name="Signalprogramm aus automatisch erstellten Phasenübergängen">
      <interstages>
        <interstage display="1" begin="40000" />
        <interstage display="2" begin="60000" />
        <interstage display="3" begin="110000" />
      </interstages>
    </stageProg>
    <stageProg id="3" cycletime="120000" switchpoint="0" offset="0" intergreens="1" name="Signalprogramm aus manuell erstellten Phasenübergängen">
      <interstages>
        <interstage display="4" begin="40000" />
        <interstage display="5" begin="60000" />
        <interstage display="6" begin="110000" />
      </interstages>
    </stageProg>
  </stageProgs>
</sc>