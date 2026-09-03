## geometry

A lightweight Luau util module for Roblox for `Bezier curves` and `spatial/vector` math w/ `easing`.

https://github.com/user-attachments/assets/49f86cf0-923d-4b11-bdbf-534a9c0d1ca0

## Usage

**Tween a value over time with easing:**
```lua
geometry.new(1, "quadOut", function(t, dt)
	part.Position = startPos:Lerp(endPos, t)
end, function()
	print("done")
end)
```
**Cast a directional ray:**

`directionalRay` (and `ray`, which takes two points instead of an origin + direction) return a table with `get`, `cast`, `vector`, `direction`, and `length`:

```lua
local ray = geometry.spatial("directionalRay")(origin, direction, 50)

-- Get a point along the ray at t (0-1)
local midpoint = ray.get(0.5)

-- Actually raycast it in the world
local result = ray.cast(raycastParams)

-- Or inspect its properties directly
print(ray.vector)     -- the full displacement vector
print(ray.direction)  -- unit direction
print(ray.length)     -- distance
```

## etc.
