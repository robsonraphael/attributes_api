require 'json'

# Module Base Attributes
module Attributes
  # Class Atribute Basic
  class Basic
    def initialize(level = 1)
      @@attack = generate(0.8, level)
      @@defense = generate(0.9, level)
      @@agility = generate(1, level)
      @@luck = generate(1.2, level)
    end

    def generate(const = 1, level = 1)
      return 1 if const.zero? || level.zero?
      return 1 if level > 45

      ((const * level) + (level / 2) + 1).floor
    end
    private :generate

    def self.info
      { attack: @@attack, defense: @@defense, agility: @@agility, luck: @@luck }.to_json
    end

    def update(level = 1)
      @@attack += generate(0.2, level)
      @@defense += generate(0.3, level)
      @@agility += generate(0.5, level)
      @@luck += generate(0.7, level)
    end
    private :update
  end

  class Force < Basic
    def initialize(level = 1)
      super

      @@damage = generate(@@attack, level)
      @@armo = generate(@@defense, level)
      @@hp_max = generate(700, level)
      @@hp = @@hp_max
      @@strong = generate(@@agility, level)

      @@force = @@damage + @@strong
    end

    def self.info
      { attack: @@attack, defense: @@defense, agility: @@agility, luck: @@luck, damage: @@damage, armo: @@armo,
        hp: @@hp_max, strong: @@strong, force: @@force }.to_json
    end

    def update(level = 1)
      super

      @@damage = generate(@@attack, level)
      @@armo = generate(@@defense, level)
      @@hp_max = generate(700, level)
      @@hp = @@hp_max
      @@force = @@damage + @@strong
    end
  end
end
