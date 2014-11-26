require 'guard'
require 'guard/plugin'

require 'uglifier'

module Guard
  class Uglify < Plugin
    def initialize(options={})
      super
      @input  = options[:input]
      @output = options[:output]
      if options[:input]
        watchers << ::Guard::Watcher.new %r{options[:input]}
      end
    end

    def start
      uglify
    end

    def reload
      uglify
    end

    def run_all
      uglify
    end

    def run_on_changes(paths)
      uglify
    end

    private
    def uglify
      begin
        uglified = Uglifier.new.compile(File.read(@input))
        File.open(@output,'w'){ |f| f.write(uglified) }
        UI.info         "Uglified #{@input} to #{@output}"
        Notifier.notify "Uglified #{@input} to #{@output}", :title => 'Uglify'
        true
      rescue Exception => e
        UI.error        "Uglifying #{@input} failed: #{e}"
        Notifier.notify "Uglifying #{@input} failed: #{e}", :title => 'Uglify', :image => :failed
        false
      end
    end
  end
end
