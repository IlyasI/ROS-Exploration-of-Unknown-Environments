
"use strict";

let AddCO2Source = require('./AddCO2Source.js')
let DeleteSoundSource = require('./DeleteSoundSource.js')
let AddRfidTag = require('./AddRfidTag.js')
let MoveRobot = require('./MoveRobot.js')
let RegisterGui = require('./RegisterGui.js')
let DeleteRfidTag = require('./DeleteRfidTag.js')
let DeleteCO2Source = require('./DeleteCO2Source.js')
let AddThermalSource = require('./AddThermalSource.js')
let DeleteThermalSource = require('./DeleteThermalSource.js')
let LoadExternalMap = require('./LoadExternalMap.js')
let AddSoundSource = require('./AddSoundSource.js')
let LoadMap = require('./LoadMap.js')

module.exports = {
  AddCO2Source: AddCO2Source,
  DeleteSoundSource: DeleteSoundSource,
  AddRfidTag: AddRfidTag,
  MoveRobot: MoveRobot,
  RegisterGui: RegisterGui,
  DeleteRfidTag: DeleteRfidTag,
  DeleteCO2Source: DeleteCO2Source,
  AddThermalSource: AddThermalSource,
  DeleteThermalSource: DeleteThermalSource,
  LoadExternalMap: LoadExternalMap,
  AddSoundSource: AddSoundSource,
  LoadMap: LoadMap,
};
