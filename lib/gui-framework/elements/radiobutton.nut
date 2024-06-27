class GUI.RadioButton extends GUI.CheckBox
{
#private:
	m_group = null

#public:
	static activeRadio = {}

	constructor(x, y, width, height, file, selector, group = null, window = null)
	{
		base.constructor(x, y, width, height, file, selector, window)

		if (group)
			setGroup(group)

		enableDeselection(false)
	}

	function destroy()
	{
		if (activeRadio[m_group] == this)
			activeRadio[m_group] = null

		base.destroy()
	}

	function getGroup()
	{
		return m_group
	}

	function setGroup(group)
	{
		if (m_group != null)
			delete activeRadio[m_group]

		m_group = group

		if (group != null)
		{
			if (!(group in activeRadio))
				activeRadio[group] <- null
		}
	}

	function setChecked(checked)
	{
		if (m_group != null && checked)
		{
			if (this == GUI.RadioButton.activeRadio[m_group])
				return

			if (GUI.RadioButton.activeRadio[m_group] != null)
				GUI.RadioButton.activeRadio[m_group].setChecked(false)

			GUI.RadioButton.activeRadio[m_group] = this
			base.setChecked(checked)
		}
		else
			base.setChecked(checked)
	}
}
