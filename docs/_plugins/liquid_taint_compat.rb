# frozen_string_literal: true

require 'liquid'

# Liquid 4.0.3 (pinned by github-pages 223) calls Variable#taint_check(context, obj) and uses
# Object#tainted?, removed in Ruby 3.2+. This no-op keeps local Ruby 3.2+ / 4.x working.
# GitHub Pages does not load _plugins (safe mode); production uses an older Ruby.

module LiquidTaintCompat
  def taint_check(context, obj)
    # intentionally empty — taint model was removed from Ruby
  end
end

Liquid::Variable.prepend(LiquidTaintCompat)
