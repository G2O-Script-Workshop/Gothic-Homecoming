class GUI.Texture extends classes(Texture, GUI.Base)
{
#protected:
	m_scaling = false

	m_FPS = 0

	m_beginFrame = 0
	m_endFrame = 0
	m_direction = 1
	m_repeat = true
	m_isPlaying = true

	m_currentFrame = 0
	m_nextFrameTime = 0

	constructor(x, y, width, height, file, window = null)
	{
		GUI.Base.constructor.call(this)
		Texture.constructor.call(this, x, y, width, height, file)

		m_nextFrameTime = getTickCount()

		if (window)
			window.insert(this)
	}

	function top()
	{
		GUI.Base.top.call(this)
		Texture.top.call(this)
	}

	function setPositionPx(x, y)
	{
		base.setPositionPx(x, y)
	}

	function getVisible()
	{
		return visible
	}

	function setVisible(visible)
	{
		base.setVisible(visible)
		this.visible = visible
	}

	function getFile()
	{
		return file
	}

	function setFile(file)
	{
		this.file = file
	}

	function getScaling()
	{
		return m_scaling
	}

	function setScaling(scaling)
	{
		m_scaling = scaling
	}

	function getFPS()
	{
		return m_FPS
	}

	function setFPS(FPS)
	{
		m_FPS = FPS
	}

	function getBeginFrame()
	{
		return m_beginFrame
	}

	function setBeginFrame(beginFrame)
	{
		m_beginFrame = beginFrame
	}

	function getEndFrame()
	{
		return m_endFrame
	}

	function setEndFrame(endFrame)
	{
		m_endFrame = endFrame
	}

	function getCurrentFrame()
	{
		return m_currentFrame
	}

	function setCurrentFrame(currentFrame)
	{
		if (currentFrame < m_beginFrame)
			currentFrame = m_beginFrame
		else if (currentFrame > m_endFrame)
			currentFrame = m_endFrame

		m_currentFrame = currentFrame

		local baseName = ""

		for (local ch = file.len() - 1; ch > 0; --ch)
		{
			if (file[ch] == '_')
			{
				baseName = file.slice(0, ch)
				break
			}
		}

		file = baseName+"_A"+currentFrame+".TGA"
	}

	function getDirection()
	{
		return m_direction
	}

	function setDirection(direction)
	{
		if (direction > 1)
			direction = 1
		else if (direction < -1)
			direction = -1

		m_direction = direction
	}

	function getRepeat()
	{
		return m_repeat
	}

	function setRepeat(repeat)
	{
		m_repeat = repeat
	}

	function isPlaying()
	{
		return (m_isPlaying && m_FPS > 0)
	}

	function play()
	{
		m_isPlaying = true
	}

	function stop()
	{
		m_isPlaying = false
	}

	static function onRender(self)
	{
		if (!(self instanceof GUI.Texture))
			return

		// FPS Animation

		local now = getTickCount()

		if (self.isPlaying())
		{
			if (now >= self.m_nextFrameTime)
			{
				if (self.m_direction == 1 && self.m_currentFrame < self.m_endFrame
				|| self.m_direction == -1 && self.m_currentFrame > self.m_beginFrame)
					self.m_currentFrame += self.m_direction
				else if (self.m_repeat)
					self.m_currentFrame = (self.m_direction == 1) ? self.m_beginFrame : self.m_endFrame

				local baseName = ""

				for (local ch = self.file.len() - 1; ch > 0; --ch)
				{
					if (self.file[ch] == '_')
					{
						baseName = self.file.slice(0, ch)
						break
					}
				}

				self.file = baseName+"_A"+self.m_currentFrame+".TGA"
				self.m_nextFrameTime += 1000 / self.m_FPS
			}
		}
		else
			self.m_nextFrameTime = now
	}

	static function onChangeResolution()
	{
		local scalingProportion = getResolutionChangedScale()

		foreach (object in base.m_objects)
		{
			if (!(object instanceof GUI.Texture))
				break

			if (!object.m_scaling)
				continue

			local size = object.getSizePx()
			object.setSizePx(size.width * scalingProportion.x, size.height * scalingProportion.y)
		}
	}
}

addEventHandler("GUI.onRender", GUI.Texture.onRender)
addEventHandler("onChangeResolution", GUI.Texture.onChangeResolution)
