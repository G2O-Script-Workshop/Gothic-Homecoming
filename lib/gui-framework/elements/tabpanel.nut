addEvent("GUI.onSwitch")

local movableTab = null
local cursorOffset = 0

class GUI.Tab extends GUI.Button
{
#private:
	m_title = ""

#public:
	id = -1

	constructor(parent, id, file, text)
	{
		this.parent = parent
		this.id = id

		base.constructor(0, 0, 0, 0, file, text)

		m_title = text
	}

	function destroy()
	{
		if (this == movableTab)
			movableTab = null

		base.destroy()
	}

	function setText(text)
	{
		if (draw)
			base.setText(text)

		m_title = text
	}

	static function onMouseDown(self, btn)
	{
		if (btn != MOUSE_LMB)
			return

		if (!(self instanceof GUI.Tab))
			return

		local panel = self.parent

		if (!panel.m_tabsMovementEnabled)
			return

		local position = self.getPositionPx()
		local cursorPosition = getCursorPositionPx()

		if (panel.m_orientation == Orientation.Horizontal)
			cursorOffset = cursorPosition.x - position.x
		else if (panel.m_orientation == Orientation.Vertical)
			cursorOffset = cursorPosition.y - position.y

		self.top()

		panel.setActiveTab(self.id)
		movableTab = self
	}

	static function onMouseRelease(button)
	{
		if (button != MOUSE_LMB)
			return

		if (!movableTab)
			return

		local panel = movableTab.parent

		local position = panel.getPositionPx()
		local margin = panel.getMarginPx()

		position.x += margin.left
		position.y += margin.top

		for (local i = 0; i < movableTab.id; ++i)
		{
			local size = panel.tabs[i].getSizePx()

			if (panel.m_orientation == Orientation.Horizontal)
				position.x += size.width
			else if (panel.m_orientation == Orientation.Vertical)
				position.y += size.height
		}

		movableTab.setPositionPx(position.x, position.y)
		movableTab = null
	}

	static function onMouseMove(newCursorX, newCursorY, oldCursorX, oldCursorY)
	{
		if (!isMouseBtnPressed(MOUSE_LMB))
			return

		if (!movableTab)
			return

		local tabPosition = movableTab.getPositionPx()
		local tabSize = movableTab.getSizePx()

		local panel = movableTab.parent
		local tabsCount = panel.tabs.len()

		local dimension, size
		local minimumPanelRange, maximumPanelRange
		local cursorMovingDirection

		// Moving tab, keeping tab in panel range,
		//determinating the cursor movement direction

		if (panel.m_orientation == Orientation.Horizontal)
		{
			dimension = "x"
			size = "width"

			tabPosition.x = newCursorX - cursorOffset
			minimumPanelRange = maximumPanelRange = panel.getPositionPx().x

			cursorMovingDirection = (newCursorX - oldCursorX) < 0 ? -1 : 1
		}
		else if (panel.m_orientation == Orientation.Vertical)
		{
			dimension = "y"
			size = "height"

			tabPosition.y = newCursorY -cursorOffset
			minimumPanelRange = maximumPanelRange = panel.getPositionPx().y

			cursorMovingDirection = (newCursorY - oldCursorY) < 0 ? -1 : 1
		}

		for (local i = 0; i < tabsCount - 1; ++i)
			maximumPanelRange += panel.tabs[i].getSizePx()[size]

		if (tabPosition[dimension] < minimumPanelRange)
			tabPosition[dimension] = minimumPanelRange
		else if (tabPosition[dimension] > maximumPanelRange)
			tabPosition[dimension] = maximumPanelRange

		// Checking if tab can be swapped,
		//swapping tab with nearest tab, if our tab is on half way to the nearest tab

		if ((cursorMovingDirection == -1 && movableTab.id > 0)
		|| (cursorMovingDirection == 1 && movableTab.id < tabsCount - 1))
		{
			local nearTab = panel.tabs[movableTab.id + cursorMovingDirection]
			local nearTabPosition = nearTab.getPositionPx()
			local nearTabSize = nearTab.getSizePx()

			if ((cursorMovingDirection == -1 && tabPosition[dimension] < nearTabPosition[dimension] + nearTabSize[size] / 2)
			|| (cursorMovingDirection == 1 && tabPosition[dimension] >= nearTabPosition[dimension] - nearTabSize[size] / 2))
			{
				if (panel.m_orientation == Orientation.Horizontal)
					nearTab.setPositionPx(nearTabPosition.x + tabSize.width * -cursorMovingDirection, nearTabPosition.y)
				else
					nearTab.setPositionPx(nearTabPosition.x, nearTabPosition.y + tabSize.height * -cursorMovingDirection)

				panel.tabs[movableTab.id + cursorMovingDirection] = movableTab
				panel.tabs[movableTab.id] = nearTab

				nearTab.id -= cursorMovingDirection
				movableTab.id += cursorMovingDirection
			}
		}

		movableTab.setPositionPx(tabPosition.x, tabPosition.y)
	}
}

addEventHandler("GUI.onMouseDown", GUI.Tab.onMouseDown)
addEventHandler("onMouseRelease", GUI.Tab.onMouseRelease)
addEventHandler("onMouseMove", GUI.Tab.onMouseMove)

class GUI.TabPanel extends classes(GUI.Texture, GUI.Orientation, GUI.Margin)
{
#private:
	m_tabsMovementEnabled = true

	m_font = "FONT_OLD_10_WHITE_HI.TGA"

	m_activeTab = null
	m_tabSizePx = null

#public:
	tabs = null

	constructor(x, y, width, height, file, orientation = Orientation.Horizontal, window = null)
	{
		tabs = []

		m_tabSizePx = {width = 0, height = 0}

		GUI.Margin.constructor.call(this)
		GUI.Orientation.setOrientation.call(this, orientation)
		GUI.Texture.constructor.call(this, x, y, width, height, file, window)
	}

	function destroy()
	{
		m_activeTab = null

		foreach (index, _ in tabs)
			tabs[index] = tabs[index].destroy()

		GUI.Texture.destroy.call(this)
	}

	function insertTab(index, file, text)
	{
		local tab = GUI.Tab(this, index, file, text)

		if (tab.draw)
			tab.draw.setFont(m_font)

		tabs.insert(index, tab)

		local tabsCount = tabs.len()

		for (local i = index + 1; i < tabsCount; ++i)
			++tabs[i].id

		local size = getSizePx()
		setSizePx(size.width, size.height)

		if (visible)
			tab.setVisible(true)

		return tab
	}

	function addTab(file, text)
	{
		return insertTab(tabs.len(), file, text)
	}

	function removeTab(id)
	{
		local tabsCount = tabs.len()

		if (!tabsCount)
			return

		for (local i = id; i < tabsCount; ++i)
			--tabs[i].id

		if (m_activeTab == tabs[id])
		{
			if (tabsCount == 1)
				setActiveTab(null)
			else if (id + 1 < tabsCount)
				setActiveTab(id + 1)
			else
				setActiveTab(id - 1)
		}

		tabs[id] = tabs[id].destroy()
		tabs.remove(id)

		local size = getSizePx()
		setSizePx(size.width, size.height)
	}

	function setMarginPx(top, right, bottom, left)
	{
		GUI.Margin.setMarginPx.call(this, top, right, bottom, left)

		local position = getPositionPx()
		setPositionPx(position.x, position.y)

		local size = getSizePx()
		setSizePx(size.width, size.height)
	}

	function setMargin(top, right, bottom, left)
	{
		setMarginPx(nay(top), nax(right), nay(bottom), nax(left))
	}

	function getActiveTab()
	{
		return m_activeTab
	}

	function setActiveTab(id)
	{
		local tab = (id != null) ? tabs[id] : null

		callEvent("GUI.onSwitch", tab, m_activeTab)
		m_activeTab = tab
	}

	function getTabsMovement()
	{
		return m_tabsMovementEnabled
	}

	function setTabsMovement(movement)
	{
		m_tabsMovementEnabled = movement
	}

	function setPositionPx(x, y)
	{
		GUI.Texture.setPositionPx.call(this, x, y)

		x += m_marginPx.left
		y += m_marginPx.top

		foreach (tab in tabs)
		{
			tab.setPositionPx(x, y)

			if (m_orientation == Orientation.Horizontal)
				x += m_tabSizePx.width
			else if (m_orientation == Orientation.Vertical)
				y += m_tabSizePx.height
		}
	}

	function setPosition(x, y)
	{
		setPositionPx(nax(x), nay(y))
	}

	function setSizePx(width, height)
	{
		GUI.Texture.setSizePx.call(this, width, height)

		local tabsCount = tabs.len()

		if (!tabsCount)
			return

		width -= m_marginPx.left + m_marginPx.right
		height -= m_marginPx.top + m_marginPx.bottom

		if (m_orientation == Orientation.Horizontal)
		{
			m_tabSizePx.width = width / tabsCount
			m_tabSizePx.height = height
		}
		else if (m_orientation == Orientation.Vertical)
		{
			m_tabSizePx.width = width
			m_tabSizePx.height = height / tabsCount
		}

		foreach (tab in tabs)
			tab.setSizePx(m_tabSizePx.width, m_tabSizePx.height)

		local position = getPositionPx()
		setPositionPx(position.x, position.y)
	}

	function setSize(width, height)
	{
		setSizePx(nax(width), nay(height))
	}

	function setVisible(visible)
	{
		GUI.Texture.setVisible.call(this, visible)

		foreach (tab in tabs)
			tab.setVisible(visible)

		if (visible)
		{
			if (!m_activeTab && (0 in tabs))
				setActiveTab(0)
		}
		else
			setActiveTab(null)
	}

	function top()
	{
		GUI.Texture.top.call(this)

		foreach (tab in tabs)
			tab.top()
	}

	function getFont()
	{
		return m_font
	}

	function setFont(font)
	{
		m_font = font

		foreach (tab in tabs)
		{
			if (tab.draw)
				tab.draw.setFont(m_font)
		}
	}
}
