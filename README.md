## geometry

A lightweight Luau util module for Roblox for `Bezier curves` and `spatial/vector` math w/ `easing`.

https://github.com/user-attachments/assets/49f86cf0-923d-4b11-bdbf-534a9c0d1ca0

- Built primarily for projectile systems.
- Lightweight and efficient.
- Rotation and orientation helpers.
- Easing styles for unique movement.

# Easings

- Linear
- Sine
- Quad
- Cubic
- Back
- Elastic
- Bounce
- Circular

## What are Bezier curves?

A Bezier curve is a smooth path that can be controlled using points. 

Imagine throwing a projectile from one position to another. Instead of moving in a 
completely straight line, you can use a Bezier curve to control exactly how the
projectile travels between those two points

Bezier curves can also be useful for AI abilities and skills. For example, they could
be used to control an AI's movement during a curved dash attack, a slam, or another 
skill that requires the character to follow a specific movement path.

## Usage

**Basic Bezier Example**

First, require the module.

```lua
local geometry = require(path.to.geometry)
```

Next, define the points that the curve will use

```lua
local points = {
    Vector3.new(0, 5, 0), -- Start
    Vector3.new(10, 15, 0), -- Control point
    Vector3.new(20, 5, 0), -- End
}
```

**What is a Control Point?**

A control point is a point that influences the shape of the Bezier curve.

The first point is where the curve starts, and the last point is where it ends.
The points in between are control points that influence the direction and shape of the curve.

In the example above, the middle control point pulls the curve upward.

You can add more vectors to the table to create more complex curves:

```lua
local points = {
    Vector3.new(0, 5, 0),    -- Start
    Vector3.new(5, 20, 0),   -- Control point
    Vector3.new(15, -5, 0),  -- Control point
    Vector3.new(20, 5, 0),   -- End
}
```

Each additional point between the start and end gives you more control over the shape of the curve.

**Completing the Curve**

Now that the points have been defined, you can use `geometry.new()` and the generic Bezier function
to move an object along the curve.

```lua
geometry.new(1, "quadOut", function(t, dt)
    local position = geometry.bezier.generic(points, t)

    part.Position = position
end, function()
    print("done")
end)
```

*Duration*
The first parameter controls how long the movement lasts.
```lua geometry.new(1, ...) ```

*Easing Style*
The second parameter controls how the movement progresses over time.
```lua geometry.new(1, "quadOut", ...)```

Easing styles can make the movement accelerate, decelerate, or change speed throughout the curve.

The third parameter is a function that runs during each physics update before the frame is rendered.
Each time this function runs, `t` is updated.

- `t = 0` represents the beginning of the curve.
- `t = 0.5` represents a position somewhere around the middle.
- `t = 1` represents the end of the curve

*Completion Function*
The fourth parameter is a function that runs once the curve has finished.

*Max Progress*
The fifth and optional parameter controls the maximum value that `t` can reach.
By default, the maximum value is `1`.

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
