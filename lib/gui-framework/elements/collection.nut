class GUI.Collection
{
#private:
	m_positionPx = null

#public:
	childs = null

	constructor(x, y)
	{
		m_positionPx = { x = nax(x), y = nay(y) }
		childs = {}
	}

	function insert(pointer)
	{
		if (pointer in childs)
			return

		local bodyPos = getPositionPx()
		local childPos = pointer.getPositionPx()

		childs[pointer] <- GUI.Vector2D(childPos.x, childPos.y)
		pointer.setPositionPx(bodyPos.x + childPos.x, bodyPos.y + childPos.y)
	}

	function remove(pointer)
	{
		delete childs[pointer]
	}

	function getPositionPx()
	{
        return m_positionPx
	}

	function getPosition()
	{
        return { x = nax(m_positionPx.x), y = nay(m_positionPx.y) }
	}

	function setPosition(x, y)
	{
		setPositionPx(nax(x), nay(y))
	}

	function setPositionPx(x, y)
	{
		m_positionPx.x = x
		m_positionPx.y = y

		foreach(item, offset in childs)
			item.setPositionPx(offset.x + x, offset.y + y)
	}

	function getChildPositionPx(pointer)
	{
		return childs[pointer]
	}

	function setChildPositionPx(pointer, x, y)
	{
		local bodyPos = getPositionPx()

		childs[pointer].x = x
		childs[pointer].y = y

		pointer.setPositionPx(bodyPos.x + x, bodyPos.y + y)
	}

	function getChildPosition(pointer)
	{
		local position = getChildPositionPx(pointer)
		return {x = anx(position.x), y = anx(position.y)}
	}

	function setChildPosition(pointer, x, y)
	{
		setChildPositionPx(pointer, nax(x), nay(y))
	}

	function setVisible(visible)
	{
		foreach (item, offset in childs)
			item.setVisible(visible)
	}

	function top()
	{
		foreach (item, offset in childs)
			item.top()
	}

	function destroy()
	{
		foreach (item, offset in childs)
			item.destroy()
	}
}
