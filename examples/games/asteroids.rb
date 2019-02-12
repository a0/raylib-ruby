# /*******************************************************************************************
# *
# *   raylib - sample game: asteroids
# *
# *   Sample game developed by Ian Eito, Albert Martos and Ramon Santamaria
# *
# *   This game has been created using raylib v1.3 (www.raylib.com)
# *   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
# *
# *   Copyright (c) 2015 Ramon Santamaria (@raysan5)
# *
# ********************************************************************************************/
# Ported to ruby by Aldrin Martoq (@aldrinmartoq)

require 'raylib'
require 'ostruct'

PLAYER_BASE_SIZE    = 20.0
PLAYER_SPEED        = 6.0
PLAYER_MAX_SHOOTS   = 10

METEORS_SPEED       = 2
MAX_BIG_METEORS     = 4
MAX_MEDIUM_METEORS  = 8
MAX_SMALL_METEORS   = 16
DEG2RAD             = Raylib::DEG2RAD

class Item
  attr_accessor :game, :color, :active, :pos, :spd, :acc, :rot, :size

  def initialize(game:, color:, active: false, x: 0, y: 0, vx: 0, vy: 0, acc: 0, rot: 0, size: 0)
    @game = game
    @color = color
    @active = active
    @pos = RayVector2.new x, y
    @spd = RayVector2.new vx, vy
    @acc = acc
    @rot = rot
    @size = size
  end
end

class Player < Item
  attr_accessor :collider, :ship_height

  def initialize(game)
    super game: game, x: game.screen_w / 2, y: game.screen_h / 2, color: RayColor::LIGHTGRAY, size: PLAYER_BASE_SIZE

    @ship_height = size / 2 / Math.tan(20 * DEG2RAD)
    @collider = RayVector3.new 0, 0, 0
  end

  def update
    # Player logic: rotation
    rot_rad = rot * DEG2RAD
    self.rot -= 5 if RayKey.is_down? RayKey::LEFT
    self.rot += 5 if RayKey.is_down? RayKey::RIGHT

    # Player logic: speed
    spd.x = Math.sin(rot_rad) * PLAYER_SPEED
    spd.y = Math.cos(rot_rad) * PLAYER_SPEED

    # Player logic: acceleration
    if RayKey.is_down? RayKey::UP
      self.acc += 0.04 if acc < 1
    else
      self.acc -= 0.02 if self.acc.positive?
      self.acc = 0 if self.acc.negative?
    end
    if RayKey.is_down? RayKey::DOWN
      self.acc -= 0.04 if self.acc.positive?
      self.acc = 0 if self.acc.negative?
    end

    # Player logic: movement
    pos.x += spd.x * self.acc
    pos.y -= spd.y * self.acc

    # Collision logic: player vs walls
    pos.x = -ship_height if pos.x > game.screen_w + ship_height
    pos.x = game.screen_w + ship_height if pos.x < -ship_height
    pos.y = -ship_height if pos.y > game.screen_h + ship_height
    pos.y = game.screen_h + ship_height if pos.y < -ship_height

    # Player shoot logic
    shoot if RayKey.is_pressed? RayKey::SPACE

    # Collision logic: player
    @collider.x = pos.x + Math.sin(rot_rad) * ship_height / 2.5
    @collider.y = pos.y - Math.cos(rot_rad) * ship_height / 2.5
    @collider.z = 12
  end

  def shoot
    game.shoots.each do |shoot|
      next if shoot.active

      rot_rad = rot * DEG2RAD
      shoot.pos.x = pos.x + Math.sin(rot_rad) * ship_height
      shoot.pos.y = pos.y - Math.cos(rot_rad) * ship_height
      shoot.active = true
      shoot.spd.x = 1.5 * Math.sin(rot_rad) * PLAYER_SPEED
      shoot.spd.y = 1.5 * Math.cos(rot_rad) * PLAYER_SPEED
      shoot.rot = rot

      break
    end
  end

  def draw
    rot_rad = rot * DEG2RAD
    cos_bas = Math.cos(rot_rad) * PLAYER_BASE_SIZE / 2
    sin_bas = Math.sin(rot_rad) * PLAYER_BASE_SIZE / 2

    v1 = RayVector2.new pos.x + Math.sin(rot_rad) * ship_height, pos.y - Math.cos(rot_rad) * ship_height
    v2 = RayVector2.new pos.x - cos_bas, pos.y - sin_bas
    v3 = RayVector2.new pos.x + cos_bas, pos.y + sin_bas

    RayDraw.triangle v1, v2, v3, RayColor::MAROON
  end
end

class Shoot < Item
  attr_accessor :ttl

  def initialize(game: )
    super game: game, color: RayColor::BLACK, size: 2

    @ttl = 0
  end

  def update
    return unless active

    # Movement
    self.ttl += 1
    pos.x += spd.x
    pos.y -= spd.y

    # Collision
    out_x = pos.x > game.screen_w + size || pos.x < 0 - size
    out_y = pos.y > game.screen_h + size || pos.y < 0 - size

    return unless out_x || out_y || ttl >= 60

    self.active = false
    self.ttl = 0
  end

  def draw
    return unless active

    RayDraw.circle_v pos, size, color
  end
end

class SmallMeteor < Item
  def initialize(**opts)
    super({ size: 10, color: RayColor::BLUE }.merge opts)
  end

  def update
    return unless active

    pos.x += spd.x
    pos.y += spd.y

    pos.x = -size if pos.x > game.screen_w + size
    pos.x = game.screen_w + size if pos.x < -size
    pos.y = -size if pos.y > game.screen_h + size
    pos.y = game.screen_h + size if pos.y < -size

    # Collision logic: player vs meteors
    player = game.player
    if RayCollision.check_circles RayVector2.new(player.collider.x, player.collider.y), player.collider.z, pos, size
      game.over = true
    elsif (shoot = game.shoots.find { |item| item.active && RayCollision.check_circles(item.pos, item.size, pos, size) })
      shoot.active = false
      shoot.ttl = 0
      self.active = false
      game.destroyed_meteors_count += 1

      split_meteor(shoot)
      split_meteor(shoot)

      if self.class == BigMeteor
        game.big_meteors.delete self
      elsif self.class == MediumMeteor
        game.medium_meteors.delete self
      elsif self.class == SmallMeteor
        game.small_meteors.delete self
      end
    end
  end

  def split_meteor(shoot)
    if self.class == BigMeteor
      split_array = game.medium_meteors
    elsif self.class == MediumMeteor
      split_array = game.small_meteors
    else
      return
    end

    if split_array.count.even?
      meteor = split_class.new game: game, active: true, x: pos.x, y: pos.y, vx: Math.cos(shoot.rot * DEG2RAD) * METEORS_SPEED * -1, vy: Math.cos(shoot.rot * DEG2RAD) * METEORS_SPEED * -1
    else
      meteor = split_class.new game: game, active: true, x: pos.x, y: pos.y, vx: Math.cos(shoot.rot * DEG2RAD) * METEORS_SPEED, vy: Math.cos(shoot.rot * DEG2RAD) * METEORS_SPEED
    end

    split_array << meteor
  end

  def draw
    return unless active

    RayDraw.circle_v pos, size, color
  end
end

class MediumMeteor < SmallMeteor
  def initialize(**opts)
    super({ size: 20 }.merge opts)
  end

  def split_array
    game.small_meteors
  end

  def split_class
    SmallMeteor
  end
end

class BigMeteor < SmallMeteor
  def initialize(game:)
    x = rand_range(game.screen_w, 150)
    y = rand_range(game.screen_h, 150)

    vx = vy = 0
    loop do
      vx = rand(-METEORS_SPEED..METEORS_SPEED)
      vy = rand(-METEORS_SPEED..METEORS_SPEED)
      break unless vx.zero? && vy.zero?
    end

    super game: game, color: RayColor::BLUE, active: true, x: x, y: y, vx: vx, vy: vy, size: 40
  end

  def split_array
    game.medium_meteors
  end

  def split_class
    MediumMeteor
  end

  def rand_range(max, center)
    loop do
      val = rand(0..max)
      return val unless val > max / 2 - center && val < max / 2 + center
    end
  end
end

class Game
  attr_accessor :screen_w, :screen_h, :over, :player, :shoots, :big_meteors, :medium_meteors, :small_meteors, :destroyed_meteors_count

  def initialize
    @screen_w = 1600
    @screen_h = 900

    @player = Player.new self
    @shoots = Array.new(PLAYER_MAX_SHOOTS) { Shoot.new game: self }
    @big_meteors = Array.new(MAX_BIG_METEORS) { BigMeteor.new game: self }
    @destroyed_meteors_count = 0
    @medium_meteors = []
    @small_meteors = []
    @over = @victory = @paused = false
  end

  def update
    if @over || @victory
      initialize if RayKey.is_pressed? RayKey::ENTER
    else
      @paused = !@paused if RayKey.is_pressed? RayKey::P

      return if @paused

      player.update
      shoots.each(&:update)
      big_meteors.each(&:update)
      medium_meteors.each(&:update)
      small_meteors.each(&:update)

      @victory = [big_meteors, medium_meteors, small_meteors].all?(&:empty?)
    end
  end

  def draw
    RayDraw.begin_drawing do
      RayDraw.clear_background RayColor::WHITE

      player.draw
      shoots.each(&:draw)
      big_meteors.each(&:draw)
      medium_meteors.each(&:draw)
      small_meteors.each(&:draw)

      draw_over if @over
      draw_victory if @victory
      draw_paused if @paused
    end
  end

  def draw_paused
    text = 'PAUSED!'
    RayDraw.text text, screen_w / 2 - RayDraw.measure_text(text, 40) / 2, screen_h / 2 - 50, 40, RayColor::GRAY
  end

  def draw_victory
    text = 'VICTORY!'
    RayDraw.text text, screen_w / 2 - RayDraw.measure_text(text, 40) / 2, screen_h / 2 - 50, 40, RayColor::GRAY
  end

  def draw_over
    text = 'GAME OVER - PRESS [ENTER] TO PLAY AGAIN'
    RayDraw.text text, screen_w / 2 - RayDraw.measure_text(text, 20) / 2, screen_h / 2 - 50, 20, RayColor::GRAY
  end

  def unload_game; end

  def main
    RayWindow.init screen_w, screen_h, 'sample game: asteroids'
    Raylib.target_fps = 60

    until RayWindow.should_close?
      update
      draw
    end

    unload_game
    RayWindow.close
  end
end

Game.new.main
