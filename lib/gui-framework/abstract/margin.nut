class GUI.Margin
{
#protected:
    m_marginPx = null

#public:
    constructor()
    {
        m_marginPx =
        {
            top = 0,
            right = 0
            bottom = 0,
            left = 0,
        }
    }

    function getMarginPx()
    {
        return m_marginPx
    }

    function setMarginPx(top, right, bottom, left)
    {
        m_marginPx.top = top
        m_marginPx.right = right
        m_marginPx.bottom = bottom
        m_marginPx.left = left
    }

    function getMargin()
    {
        return {
            top = any(m_marginPx.top)
            right = anx(m_marginPx.right)
            bottom = any(m_marginPx.bottom)
            left = anx(m_marginPx.left)
        }
    }

    function setMargin(top, right, bottom, left)
    {
        setMarginPx(nay(top), nax(right), nay(bottom), nax(left))
    }
}
