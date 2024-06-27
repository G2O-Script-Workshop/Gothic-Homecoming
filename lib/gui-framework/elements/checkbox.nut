class GUI.CheckBox extends GUI.Button
{
#protected:
	m_originalTexture = null
	m_selector = null

	m_checked = false
	m_enableDeselection = true

#public:
	constructor(x, y, width, height, file, selector, window = null)
	{
		if (selector.len() >= 4 && selector.slice(selector.len() - 4).toupper() == ".TGA")
		{
			base.constructor(x, y, width, height, file, null, window)
			m_originalTexture = file
		}
		else
		{
			base.constructor(x, y, width, height, file, selector, window)
		}

		m_selector = selector
	}

	function setText(text)
	{
		base.setText(text)

		if (draw)
			m_selector = text
	}

	function setVisible(visible)
	{
		GUI.Texture.setVisible.call(this, visible)

		if (draw && m_checked)
			draw.setVisible(visible)
	}

	function setFile(file)
	{
		if (draw)
			base.setFile(file)
		else
		{
			if (!m_checked)
				base.setFile(file)
			else
				m_originalTexture = file
		}
	}

	function getChecked()
	{
		return m_checked
	}

	function setChecked(checked)
	{
		m_checked = checked

		if (draw)
		{
			if (m_visible)
				draw.setVisible(checked)
		}
		else
			file = (checked) ? m_selector : m_originalTexture
	}

	function getSelector()
	{
		return m_selector
	}

	function setSelector(text)
	{
		if (draw)
			draw.setText(text)
		else
			m_selector = text
	}

	function enableDeselection(deselection)
	{
		m_enableDeselection = deselection
	}

	static function onClick(self)
	{
		if (!(self instanceof GUI.CheckBox))
			return

		if (self.m_checked && !self.m_enableDeselection)
			return

		self.m_checked = !self.m_checked
		self.setChecked(self.m_checked)
	}
}

addEventHandler("GUI.onClick", GUI.CheckBox.onClick)
