class MinMaxBounds {
    min_x = null
    min_y = null
    max_x = null
    max_y = null

    constructor(min_x, min_y, max_x, max_y) {
        this.min_x = min_x
        this.min_y = min_y
        this.max_x = max_x
        this.max_y = max_y
    }
}

class ScreenSpace {
    _size = null
    _bounds = null
    _factor_2d = null
    _factor_3d = null

    constructor(size, bounds) {
        this._size = size
        this._bounds = bounds
        this._factor_2d = {x = 0.0, y = 0.0}
        this._factor_3d = {x = 0.0, z = 0.0}

        this._recalculate()
    }

    function _recalculate() {
        // Normalize map
        local map_width = abs(this._bounds.min_x - this._bounds.max_x)
        local map_height = abs(this._bounds.min_y - this._bounds.max_y)

        this._factor_2d.x = this._size.width / (map_width * 1.0)
        this._factor_2d.y = this._size.height / (map_height * 1.0)

        this._factor_3d.x = (map_width * 1.0) / this._size.width
        this._factor_3d.z = (map_height * 1.0) / this._size.height
    }

    function setSize(w, h) {
        this._size.width = w
        this._size.height = h

        this._recalculate()
    }

    function setBounds(bounds) {
        this._bounds = bounds
        this._recalculate()
    }

    function convertTo2d(x, z) {
        return {
            // Screen x
            x = abs(this._bounds.min_x - x) * this._factor_2d.x,
            // Screen y
            y = abs(this._bounds.min_y - z) * this._factor_2d.y
        }
    }

    function convertTo3d(x, y) {
        return {
            // Map x
            x = x * this._factor_3d.x + this._bounds.min_x,
            // Map y
            z = -y * this._factor_3d.z + this._bounds.min_y
        }
    }
}