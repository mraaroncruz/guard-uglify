require "guard"
require "guard/plugin"
require "guard/watcher"
require "uglifier"

module Guard
    class Uglify < Plugin

        ###
        # Initializer
        ###
        def initialize(options = {})
            options = {
                :input => "app/assets/javascripts/application.js",
                :output => "public/javascripts/application.js",
                :all_on_start => false,
                :uglifier => {
                    :mangle => {
                        :toplevel => true
                    },
                    :compress => {
                        :drop_console => true
                    }
                }
            }.merge(options)

            super(options)

            if options[:input]
                watchers << Watcher.new(%r{#{options[:input]}})
            end
        end

        ###
        # Run at start
        ###
        def start
            run_all if options[:run_at_start]
        end

         ###
        # Stop running
        ###
        def stop
            true
        end

        ###
        # On Guard reload
        ###
        def reload
            run_all
        end

        ###
        # Run all
        ###
        def run_all
            run_on_changes Watcher.match_files self, Dir[options[:input]]
        end

        ###
        # Run on changes to watched files
        #
        # @param {Array} paths
        #   Paths of changed files
        ###
        def run_on_changes(paths)
            paths.each do |file|
                uglify file
            end
        end

        private

        ###
        # Run the Uglifier gem and write contents to output file
        #
        # @param {String} file
        #   Input file to pass to Uglifier
        ###
        def uglify(file)
            begin
                uglified = ::Uglifier.new(options[:uglifier]).compile(File.read(file))

                File.open(options[:output], "w") { |f| f.write uglified }

                msg = color("Uglified #{options[:input]} to #{options[:output]}", ";32")
                ::Guard::UI.info msg
                true
            rescue Exception => err
                msg = color("Uglifying #{options[:input]} failed: #{err}", ";31")
                ::Guard::UI.error msg
                false
            end
        end

         ###
        # Set message color
        #
        # @param {String} message
        #   Text to color
        # @param {String} color
        #   Color code
        ###
        def color(message, color)
            if ::Guard::UI.send(:color_enabled?)
                "\e[0#{color}m#{message}\e[0m"
            else
                message
            end
        end
    end
end
