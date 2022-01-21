require "patir/command"

module Execution
  include Gaudi::Utilities
  # Number of lines from the tail of the command output to attach to the exception message on failure
  EXCEPTION_LINES = 25
  # Runs the command line using Patir, creating a new process and suppressing the output of the command.
  #
  # Output, error output, command exit status and total time of execution are captured and returned on success as Patir::ShellCommand instance
  #
  # They are also saved under system_config.out/logs using the provided name (which might lead to failures if the name contains special characters like ':')
  #
  # Will raise a GaudiError if the command fails providing the last EXCEPTION_LINES lines of output as the exception message
  def run_command(name, cmdline, system_config)
    puts cmdline
    cmd = Patir::ShellCommand.new(:cmd => cmdline)
    cmd.run
    logfile = File.join(system_config.out, "logs", "#{Time.now.strftime("%Y%m%d_%H%M%S")}_#{name.gsub("\s", "_").gsub("/", "_").gsub(":", "_").gsub("\\", "_")}.log")
    write_file(logfile, "#{cmdline}\n#{cmd.output}\n#{cmd.error}\n")
    puts "#{name} completed in #{cmd.exec_time.round(2)}"
    unless cmd.success?
      if cmd.output && cmd.output.lines.size > EXCEPTION_LINES
        message = cmd.output.lines[-EXCEPTION_LINES..-1].join("\n")
      else
        message = cmd.output
      end
      raise GaudiError, "#{cmdline}\n#{message}\n#{cmd.error}"
    end
    return cmd
  end
end
