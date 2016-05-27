require "rake"
require "rake/tasklib"

module GitHubReadmeGenerator
  class RakeTask < ::Rake::TaskLib
    include ::Rake::DSL if defined?(::Rake::DSL)

    OPTIONS = %w( title badges )

    OPTIONS.each do |o|
      attr_accessor o.to_sym
    end

    # Public: Initialise a new GitHubChangelogGenerator::RakeTask.
    #
    # Example
    #
    #   GitHubChangelogGenerator::RakeTask.new
    def initialize(*args, &task_block)
      @name = args.shift || :readme

      define(args, &task_block)
    end

    def define(args, &task_block)
      desc "Generate a README.md"

      task_block.call(*[self, args].slice(0, task_block.arity)) if task_block

      # clear any (auto-)pre-existing task
      Rake::Task[@name].clear if Rake::Task.task_defined?(@name)

      task @name do
        out = @title
        out << "\n"
        out << "=" * @title.length
        out << "\n\n"

        # Badges
        @badges.each do |k, v|
          case v[:badge]
          when :puppetforge
            case v[:type]
            when 'v'
              title = v[:title] || 'Puppet Forge Version'
            when 'dt'
              title = v[:title] || 'Puppet Forge Downloads'
            else
              title = v[:title] || 'Puppet Forge'
            end
            img = "https://img.shields.io/puppetforge/#{v[:type]}/#{v[:user]}/#{v[:project]}.svg"
            link = "https://forge.puppetlabs.com/#{v[:user]}/#{v[:project]}"
            out << "[![#{title}](#{img})](#{link})\n"
          when :travis
            title = v[:title] || 'Build Status'
            img = "https://img.shields.io/travis/#{v[:user]}/#{v[:project]}.svg"
            link = "https://travis-ci.org/#{v[:user]}/#{v[:project]}"
            out << "[![#{title}](#{img})](#{link})\n"
          when :jenkins
            title = v[:title] || 'Build Status'
            img = "#{v[:jenkins_url]}/badge/icon"
            link = "#{v[:jenkins_url]}"
            out << "[![#{title}](#{img})](#{link})\n"
          else
            fail "Unknown badge type '#{v[:badge]}'"
          end
        end

        module_path = ENV['MODULE_PATH'] || './'
        # Usage from examples
        out << "\n## Usage\n\n"
        Dir.glob("#{module_path}examples/*").each do |e|
          content = File.read(e).gsub(/^#\s*/, '')
          out << "\n#{content}\n"
        end

        File.open("#{module_path}README.md", 'w').puts(out)
      end
    end
  end
end

