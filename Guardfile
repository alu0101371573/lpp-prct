guard :rspec, cmd: 'rspec -I. -f d spec/prct06/alimento_spec.rb' do
  require 'guard/rspec'
  require "guard/rspec/inspectors/simple_inspector.rb"
  module ::Guard
      class RSpec < Plugin
          module Inspectors
              class SimpleInspector < BaseInspector
                  def paths(paths)
                      # please don't clear modified files correctly detected
                      # by watch but whose name doesn't end with '_spec.rb'
                      paths # return input without modification
                  end
              end
          end
      end
  end

  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib})
end