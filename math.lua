---@param x real
---@param distance real
---@param angle real radian
---@return real
function math.offsetX(x, distance, angle)
	return distance * math.cos(angle) + x
end

---@param y real
---@param distance real
---@param angle real radian
---@return real
function math.offsetY(y, distance, angle)
	return distance * math.sin(angle) + y
end

---@param x real
---@param y real
---@param distance real
---@param angle real radian
---@return real, real
function math.offsetXY(x, y, distance, angle)
	return distance * math.cos(angle) + x, distance * math.sin(angle) + y
end

---@param zs real начальная высота одного края дуги
---@param ze real конечная высота другого края дуги
---@param h real максимальная высота на середине расстояния (x = d / 2)
---@param d real общее расстояние до цели
---@param x real расстояние от исходной цели до точки
---@return real
function math.parabolaZ(zs, ze, h, d, x)
	return (2 * (zs + ze - 2 * h) * (x / d - 1) + ze - zs) * (x / d) + zs
end

---@param xa real
---@param ya real
---@param xb real
---@param yb real
---@return real
function math.distanceXY(xa, ya, xb, yb)
	local dx, dy = xb - xa, yb - ya
	return math.sqrt(dx * dx + dy * dy)
end

---@param xa real
---@param ya real
---@param za real
---@param xb real
---@param yb real
---@param zb real
---@return real
function math.distanceXYZ(xa, ya, za, xb, yb, zb)
	local dx, dy, dz = xb - xa, yb - ya, zb - za
	return math.sqrt(dx * dx + dy * dy + dz * dz)
end

---@param xa real
---@param ya real
---@param xb real
---@param yb real
---@return real radian
function math.angleXY(xa, ya, xb, yb)
	return math.atan(yb - ya, xb - xa)
end

---@param a real radian
---@param b real radian
---@return real radian
function math.angleDiff(a, b)
	local c = a > b and a - b or b - a
	local d = a > b and b - a + 2 * math.pi or a - b + 2 * math.pi
	return c > d and d or c
end

--https://xgm.guru/p/wc3/iscoordsincircle
-- Проверяет, находится ли [x,y] в окружности [cx,cy] радиусом r
---@param x table
---@param y table
---@param cx table
---@param cy table
---@param r table
---@return boolean
function math.inCircleXY(x, y, cx, cy, r)
	return (cx - x) * (cx - x) + (cy - y) * (cy - y) < r * r
end

-- xgm.guru/p/wc3/warden-math
---@param a real degrees
---@param b real degrees
---@return real degrees
function math.angleDiffDeg(a, b)
	a, b = math.abs(a), math.abs(b)
	if a > b then
		a, b = b, a
	end
	local x = b - 360
	if b - a > a - x then
		b = x
	end
	return math.abs(a - b)
end

-- https://xgm.guru/p/wc3/perpendicular
-- Находит длину перпендикуляра от линии проходящей через [xa, ya][xb, yb] к точке [xc, yc]
---@param xa real
---@param ya real
---@param xb real
---@param yb real
---@param xc real
---@param yc real
---@return real
function math.perpendicular(xa, ya, xb, yb, xc, yc)
	return math.sqrt((xa - xc) * (xa - xc) + (ya - yc) * (ya - yc)) * math.sin(math.atan(yc - ya, xc - xa) - math.atan(yb - ya, xb - xa))
end