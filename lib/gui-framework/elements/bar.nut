class GUI.Bar extends classes(GUI.Texture, GUI.Orientation, GUI.Alignment, GUI.Margin)
{
#proteced:
	m_stretching = true

	m_value = 0
	m_minimum = 0
	m_maximum = 100

#public:
	progress = null

	constructor(x, y, width, height, marginX, marginY, background, progress, orientation = Orientation.Horizontal, alignment = Align.Left, window = null)
	{
		base.constructor(x, y, width, height, background, window)
		setDisabled(true)

		GUI.Orientation.setOrientation.call(this, orientation)
		GUI.Alignment.setAlignment.call(this, alignment)
		GUI.Margin.constructor.call(this)

		this.progress = GUI.Texture(0, 0, 0, 0, progress)

		setPosition(x, y)
		setSize(width, height)

		// tmp?
		setMargin(marginY, marginX, marginY, marginX)
	}

	function getPercentage()
	{
		return fabs(m_value - m_minimum) / fabs(m_maximum - m_minimum)
	}

	function getValue()
	{
		return m_value
	}

	function setValue(value)
	{
		if (value > m_maximum)
			value = m_maximum
		else if (value < m_minimum)
			value = m_minimum

		m_value = value

		local maxSize = getSizePx()
		setSizePx(maxSize.width, maxSize.height)
	}

	function getMinimum()
	{
		return m_minimum
	}

	function setMinimum(minimum)
	{
		m_minimum = minimum
		setValue(m_minimum)
	}

	function getMaximum()
	{
		return m_maximum
	}

	function setMaximum(maximum)
	{
		m_maximum = maximum
		setValue(m_minimum)
	}

	function top()
	{
		base.top()
		progress.top()
	}

	function destroy()
	{
		base.destroy()
		progress.destroy()
	}

	function getStreching()
	{
		return m_stretching
	}

	function setStretching(stretching)
	{
		m_stretching = stretching
	}

	function setAlignment(alignment)
	{
		GUI.Alignment.setAlignment.call(this, alignment)

		local position = getPositionPx()
		setPositionPx(position.x, position.y)

		setValue(getValue())
	}

	function setVisible(visible)
	{
		base.setVisible(visible)
		progress.setVisible(visible)
	}

	function setAlpha(alpha)
	{
		base.setAlpha(alpha)
		progress.setAlpha(alpha)
	}

	function setPositionPx(x, y)
	{
		base.setPositionPx(x, y)

		local size = getSizePx()

		if (m_orientation == Orientation.Horizontal)
		{
			local progressWidth = ((size.width - m_marginPx.left - m_marginPx.right) * getPercentage()).tointeger()

			switch (m_alignment)
			{
				case Align.Left:
					progress.setPositionPx(x + m_marginPx.left, y + m_marginPx.top)
					break

				case Align.Right:
					progress.setPositionPx(x + (size.width - progressWidth) - m_marginPx.right, y + m_marginPx.top)
					break

				case Align.Center:
					progress.setPositionPx(x + (size.width - progressWidth) / 2, y + m_marginPx.top)
					break
			}
		}
		else if (m_orientation == Orientation.Vertical)
		{
			local progressHeight = ((size.height - m_marginPx.top - m_marginPx.bottom) * getPercentage()).tointeger()

			switch (m_alignment)
			{
				case Align.Left:
					progress.setPositionPx(x + m_marginPx.left, y + m_marginPx.top)
					break

				case Align.Right:
					progress.setPositionPx(x + m_marginPx.left, y + size.height - progressHeight - m_marginPx.bottom)
					break

				case Align.Center:
					progress.setPositionPx(x + m_marginPx.right, y + (size.height - progressHeight) / 2)
					break
			}
		}
	}

	function setPosition(x, y)
	{
		setPositionPx(nax(x), nay(y))
	}

	function changeProgress(rectX, rectY, rectWidth, rectHeight)
	{
		if (!m_stretching)
		{
			local size = getSizePx()

			progress.setSizePx((size.width - m_marginPx.left - m_marginPx.right), size.height - m_marginPx.top - m_marginPx.bottom)
			progress.setRectPx(rectX, rectY, rectWidth, rectHeight)
		}

		progress.setSizePx(rectWidth, rectHeight)
	}

	function setSizePx(width, height)
	{
		base.setSizePx(width, height)

		local position = getPositionPx()

		local progressWidth = width - m_marginPx.left - m_marginPx.right
		local progressHeight = height - m_marginPx.top - m_marginPx.bottom

		if (m_orientation == Orientation.Horizontal)
		{
			progressWidth = (progressWidth * getPercentage()).tointeger()

			switch (m_alignment)
			{
				case Align.Left:
					changeProgress(0, 0, progressWidth, progressHeight)
					break

				case Align.Right:					
					changeProgress(width - progressWidth - m_marginPx.left - m_marginPx.right, 0, progressWidth, progressHeight)
					setPositionPx(position.x, position.y)
					break

				case Align.Center:
					changeProgress((width - progressWidth - m_marginPx.left - m_marginPx.right) / 2, 0, progressWidth, progressHeight)
					setPositionPx(position.x, position.y)
					break
			}
		}
		else if (m_orientation == Orientation.Vertical)
		{
			progressHeight = (progressHeight * getPercentage()).tointeger()

			switch (m_alignment)
			{
				case Align.Left:
					changeProgress(0, 0, progressWidth, progressHeight)
					break

				case Align.Right:
					changeProgress(0, height - progressHeight - m_marginPx.top - m_marginPx.bottom, progressWidth, progressHeight)
					setPositionPx(position.x, position.y)
					break

				case Align.Center:
					changeProgress(0, (height - progressHeight - m_marginPx.top - m_marginPx.bottom) / 2, progressWidth, progressHeight)
					setPositionPx(position.x, position.y)
					break
			}
		}
	}

	function setSize(width, height)
	{
		setSizePx(nax(width), nay(height))
	}

	function setMarginPx(top, right, bottom, left)
	{
		GUI.Margin.setMarginPx.call(this, top, right, bottom, left)

		local position = getPositionPx()
		local size = getSizePx()

		setPositionPx(position.x, position.y)
		setSizePx(size.width, size.height)
	}

	function setMargin(top, right, bottom, left)
	{
		setMarginPx(nay(top), nax(right), nay(bottom), nax(left))
	}
}
