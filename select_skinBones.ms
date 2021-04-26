-- This script creates a selection set with the elements included
-- in the skin modifier from the selected object
-- Created:  		27-11-2020
-- Last Updated:
--
-- Author :  Andres Felipe Hernandez
-- Version:  3ds max 2019 / 2020
--********************************************************************

clearlistener()
max modify mode
selName = $.name

skinBones = #()

for sk in $.modifiers where iskindof sk Skin do
(
	
	modpanel.setcurrentobject sk
	
	for i=1 to skinOps.GetNumberBones sk do 
	(
		BoneName = skinOps.GetBoneName sk i 0
		append skinBones (getNodeByName BoneName)
	)
)

for c = 1 to skinBones.count  do (
	selectionSets[(selName as string) + "_bones"] = skinBones
)

select skinBones