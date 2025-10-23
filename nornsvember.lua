-- nornsvember
-- monome norns script
--
-- description goes here
--
-- https://github.com/yourusername/nornsvember

engine.name = "PolyPerc"

local MusicUtil = require "musicutil"

-- state
local note = 60
local level = 1.0

-- init
function init()
  -- parameters
  params:add_separator("nornsvember")

  params:add{
    type = "number",
    id = "note",
    name = "Note",
    min = 0,
    max = 127,
    default = 60,
    action = function(value)
      note = value
    end
  }

  params:add{
    type = "control",
    id = "level",
    name = "Level",
    controlspec = controlspec.new(0, 1, "lin", 0.01, 0.5),
    action = function(value)
      level = value
    end
  }

  -- screen redraw timer
  screen_dirty = true
  screen_timer = metro.init()
  screen_timer.time = 1/15
  screen_timer.event = function()
    if screen_dirty then
      redraw()
      screen_dirty = false
    end
  end
  screen_timer:start()
end

-- encoders
function enc(n, d)
  if n == 1 then
    -- encoder 1: level
    params:delta("level", d)
  elseif n == 2 then
    -- encoder 2: note
    params:delta("note", d)
  elseif n == 3 then
    -- encoder 3: (unused)
  end
  screen_dirty = true
end

-- keys
function key(n, z)
  if n == 2 and z == 1 then
    -- key 2: play note
    engine.hz(MusicUtil.note_num_to_freq(note))
  elseif n == 3 and z == 1 then
    -- key 3: (unused)
  end
  screen_dirty = true
end

-- redraw
function redraw()
  screen.clear()

  screen.level(15)
  screen.move(0, 10)
  screen.text("nornsvember")

  screen.move(0, 30)
  screen.level(4)
  screen.text("note: " .. MusicUtil.note_num_to_name(note))

  screen.move(0, 40)
  screen.text("level: " .. string.format("%.2f", level))

  screen.update()
end

-- cleanup
function cleanup()
  screen_timer:stop()
end
