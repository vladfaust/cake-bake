# Bake a Cakefile into native Crystal code
module Cake
  macro bake(cakefile_path = "./Cakefile")
    COMPILED_TASKS = [] of String

    private macro desc(description)
      # You don't need descriptions in the compiled code?
    end

    private macro task(name, &block)
      \{% COMPILED_TASKS.push(name) %}

      def \{{name.id}}
        \{{yield}}
      end
    end

    private macro define_run
      def run(task_name)
        \{% begin %}
          case task_name.gsub(":", "")
          \{% for name in COMPILED_TASKS %}
            when \{{name.id.stringify}}
              \{{name.id}}
          \{% end %}
            else
              abort("Unknown task #{task_name}, exiting!")
          end
        \{% end %}
      end
    end

    {% require_path = cakefile_path.split("Cakefile").first %}

    {{ `cat Cakefile`.stringify.gsub(%r{require "\.{1,2}/}, %Q{require "#{require_path.id}}).id }}

    define_run

    task_to_run = ARGV[0]?
    abort("No task is specified, exiting!") unless task_to_run

    run(task_to_run)
  end
end
