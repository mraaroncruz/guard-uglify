require 'guard'
require 'guard/guard'

require 'uglifier'

module Guard
  class Uglify < Guard
    def initialize(watchers=[], options={})
      super 
      @destination_file = options[:destination_file]
    end

    def start
       UI.info "Uglify is waiting for js file changes..."
    end
    
    def run_all
      true
    end

    def run_on_change(paths)
      @destination_file ||= "public/javascripts/application.js"
      uglified = Uglifier.new.compile(File.read(@destination_file))
      File.open(@destination_file,'w'){ |f| f.write(uglified) }
      UI.info "Guard::Uglify compressing file #{@destination_file}"
    end
  end
end
