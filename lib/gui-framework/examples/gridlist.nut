local randomChar = @() rand() % 255

local window = GUI.Window(500, 1500, anx(700), any(400), "MENU_INGAME.TGA", null, true)
local grid = GUI.GridList(anx(400), 0, anx(300), any(300), "MENU_INGAME.TGA", "MENU_INGAME.TGA", "BAR_MISC.TGA", "O.TGA", "U.TGA", window)
grid.setMarginPx(10, 0, 0, 10)
grid.setSpacingPx(5)
grid.setRowSizePx(grid.getRowSizePx() + 10)

local playerColumn = grid.addColumn("Player", anx(132), Align.Center)
playerColumn.draw.setColor(145, 175, 205)
playerColumn.setFile("INV_SLOT_EQUIPPED_HIGHLIGHTED.TGA")
playerColumn.setSizePx(playerColumn.getSizePx().width, grid.getRowSizePx())

local pingColumn = grid.addColumn("Ping", anx(133), Align.Center)
pingColumn.draw.setColor(190, 210, 240)
pingColumn.setFile("INV_SLOT_EQUIPPED_HIGHLIGHTED.TGA")
pingColumn.setSizePx(playerColumn.getSizePx().width, grid.getRowSizePx())

{
	local ASCIILetter = 'A'

	for(local i = 1; i <= 26; i++)
	{
		local index = grid.addRow(ASCIILetter.tochar().tostring(), randomChar())

		foreach (row in grid.rows)
		{
			foreach (cell in row.cells)
			{
				cell.draw.setColor(randomChar(), randomChar(), randomChar())
				cell.setFile("INV_SLOT_EQUIPPED.TGA")
			}
		}

		++ASCIILetter
	}
}

local addFirstRowButton = GUI.Button(anx(60), any(0), anx(300), any(40), "MENU_INGAME.TGA", "Add first row", window)
local addLastRowButton = GUI.Button(anx(60), any(40), anx(300), any(40), "MENU_INGAME.TGA", "Add last row", window)
local removeFirstRowButton = GUI.Button(anx(60), any(80), anx(300), any(40), "MENU_INGAME.TGA", "Remove first row", window)
local removeLastRowButton = GUI.Button(anx(60), any(120), anx(300), any(40), "MENU_INGAME.TGA", "Remove last row", window)
local addPlayerColumnFirstCellButton = GUI.Button(anx(60), any(160), anx(300), any(40), "MENU_INGAME.TGA", "Add Player Column first cell", window)
local addPingColumnFirstCellButton = GUI.Button(anx(60), any(200), anx(300), any(40), "MENU_INGAME.TGA", "Add Ping Column first cell", window)
local removePlayerColumnFirstCellButton = GUI.Button(anx(60), any(240), anx(300), any(40), "MENU_INGAME.TGA", "Remove Player Column first cell", window)
local removePingColumnFirstCellButton = GUI.Button(anx(60), any(280), anx(300), any(40), "MENU_INGAME.TGA", "Remove Ping Column first cell", window)
local removePlayerColumnButton = GUI.Button(anx(60), any(320), anx(300), any(40), "MENU_INGAME.TGA", "Remove Player Column", window)
local removePingColumnButton = GUI.Button(anx(60), any(360), anx(300), any(40), "MENU_INGAME.TGA", "Remove Ping Column", window)

addEventHandler("onInit", function()
{
 	window.setVisible(true)
 	setCursorVisible(true)
})

addEventHandler("GUI.onClick", function(self)
{
	if (!(self instanceof GUI.Button))
		return

	switch (self)
	{
		case addFirstRowButton:
			if (!grid.columns.len())
				return

			grid.insertRow(0, "1.Cell First", "2.Cell First")
			break

		case addLastRowButton:
			if (!grid.columns.len())
				return

			grid.addRow("1.Cell Last", "2.Cell Last")
			break

		case removeFirstRowButton:
			if (!(0 in grid.columns))
				return

			if (!grid.rows.len())
				return

			grid.removeRow(0)
			break

		case removeLastRowButton:
			if (!(0 in grid.columns))
				return

			local rowsCount = grid.rows.len()

			if (!rowsCount)
				return

			grid.removeRow(rowsCount - 1)
			break

		case addPlayerColumnFirstCellButton:
			if (!playerColumn)
				return

			if (!(0 in grid.rows))
				return

			if (grid.rows[0].cells[playerColumn.id])
				return

			grid.rows[0].insertCell(playerColumn.id, "Player")

			grid.rows[0].cells[playerColumn.id].draw.setColor(randomChar(), randomChar(), randomChar())
			grid.rows[0].cells[playerColumn.id].setFile("INV_SLOT_EQUIPPED.TGA")

			break

		case addPingColumnFirstCellButton:
			if (!pingColumn)
				return

			if (!(0 in grid.rows))
				return

			if (grid.rows[0].cells[pingColumn.id])
				return

			grid.rows[0].insertCell(pingColumn.id, randomChar())

			grid.rows[0].cells[pingColumn.id].draw.setColor(randomChar(), randomChar(), randomChar())
			grid.rows[0].cells[pingColumn.id].setFile("INV_SLOT_EQUIPPED.TGA")

			break

		case removePlayerColumnFirstCellButton:
			if (!playerColumn)
				return

			grid.rows[0].removeCell(playerColumn.id)

			break

		case removePingColumnFirstCellButton:
			if (!pingColumn)
				return

			grid.rows[0].removeCell(pingColumn.id)

			break

		case removePlayerColumnButton:
			if (!playerColumn)
				return

			playerColumn = grid.removeColumn(playerColumn.id)
			break

		case removePingColumnButton:
			if (!pingColumn)
				return

			pingColumn = grid.removeColumn(pingColumn.id)
			break
	}
})

addEventHandler("GUI.onClick", function(self)
{
	if (!(self instanceof GUI.GridListCell))
		return

	local row = self.parent
	local gridlist = row.parent

	if (gridlist != grid)
		return

	foreach (cell in row.cells)
		cell.draw.setColor(randomChar(), randomChar(), randomChar())
})

local columnsSortDirection = array(grid.columns.len(), 1)

addEventHandler("GUI.onClick", function(self)
{
	if (!(self instanceof GUI.GridListColumn))
		return

	if (self.parent != grid)
		return

	columnsSortDirection[self.id] = -columnsSortDirection[self.id]

	grid.sort(function(a, b)
	{
		local aValue = a.cells[self.id].getValue()
		local bValue = b.cells[self.id].getValue()

		if (aValue > bValue)
			return -columnsSortDirection[self.id]
		else if (aValue < bValue)
			return columnsSortDirection[self.id]

		return 0
	})
})
