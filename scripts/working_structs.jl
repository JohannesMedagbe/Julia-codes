"""
Create a point.
Fields:x, y and are all numbers

"""
struct Point
	x
	y
end

"""
Compute distance between points.
Takes two points and return the distance between them.
"""
function distancebetweenpoints(p1, p2)
	sqrt((p2.x-p1.x)^2 + (p2.y-p1.y)^2)
end

"""
Represents a circle.
Fields: center(Point) and radius (Number)
"""
struct Circle
	center::Point
	radius::Number
end

"""
Check if point lies in or on boundary of the circle.
"""
function pointincircle(circ, po)
	dist=sqrt((po.x-circ.center.x)^2+(po.y-circ.center.y)^2)
	if dist <= 2*circ.radius
		return true
	end
	false
end


"""
Check if rectangle lies entirely in or on the circle boundary.
"""
function rectincircle(circ, rect)
	a=rect.corner; dista=sqrt((a.x-circ.center.x)^2+(a.y-circ.center.y)^2)
	b=MPoint(rect.corner.x+rect.width, rect.corner.y); distb=sqrt((b.x-circ.center.x)^2+(b.y-circ.center.y)^2)
	c=MPoint(rect.corner.x, rect.corner.y+rect.height); distc=sqrt((c.x-circ.center.x)^2+(c.y-circ.center.y)^2)
	d=MPoint(rect.corner.x+rect.width, rect.corner.y+rect.height); distd=sqrt((d.x-circ.center.x)^2+(d.y-circ.center.y)^2)
	if dista <= 2*circ.radius && distb <= 2*circ.radius && distc <= 2*circ.radius && distd <= 2*circ.radius
		return true
	end
	false
end

"""
Check if rectangle corners and circle oberlap.
"""
function rectcircleoverlap(circ, rect)
	a=rect.corner; dista=sqrt((a.x-circ.center.x)^2+(a.y-circ.center.y)^2)
	b=MPoint(rect.corner.x+rect.width, rect.corner.y); distb=sqrt((b.x-circ.center.x)^2+(b.y-circ.center.y)^2)
	c=MPoint(rect.corner.x, rect.corner.y+rect.height); distc=sqrt((c.x-circ.center.x)^2+(c.y-circ.center.y)^2)
	d=MPoint(rect.corner.x+rect.width, rect.corner.y+rect.height); distd=sqrt((d.x-circ.center.x)^2+(d.y-circ.center.y)^2)
	if dista <= 2*circ.radius || distb <= 2*circ.radius || distc <= 2*circ.radius || distd <= 2*circ.radius
		return true
	end
	false
end


"""
Check if rectangle and circle oberlap at any point.
"""
function rectcircleoverlapany(circ, rect)
	a=rect.corner; b=MPoint(rect.corner.x+rect.width, rect.corner.y); c=MPoint(rect.corner.x, rect.corner.y+rect.height); d=MPoint(rect.corner.x+rect.width, rect.corner.y+rect.height)
	i=a
	while a.x<=i.x<=b.x || a.y<=i.y<=b.y
		disti=sqrt((i.x-circ.center.x)^2+(i.y-circ.center.y)^2)
		if disti <= 2*circ.radius
			return true
		end
		i=MPoint(i.x+1, i.y+1)
	end
	j=a
	while a.x<=j.x<=c.x || a.y<=j.y<=c.y
		distj=sqrt((j.x-circ.center.x)^2+(j.y-circ.center.y)^2)
		if distj <= 2*circ.radius
			return true
		end
		j=MPoint(j.x+1, j.y+1)
	end
	k=b
	while b.x<=k.x<=d.x || b.y<=k.y<=d.y
		distk=sqrt((k.x-circ.center.x)^2+(k.y-circ.center.y)^2)
		if distk <= 2*circ.radius
			return true
		end
		k=MPoint(k.x+1, k.y+1)
	end
	l=c
	while c.x<=l.x<=d.x || c.y<=l.y<=d.y
		distl=sqrt((l.x-circ.center.x)^2+(l.y-circ.center.y)^2)
		if distl <= 2*circ.radius
			return true
		end
		l=MPoint(l.x+1, l.y+1)
	end
	false
end


